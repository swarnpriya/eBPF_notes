# Verification 

- Each VST proof file has a boiler plate:
    ```
    (* imports verifiable c and its Floyd proof-automation library *)
    Require Import VST.floyd.proofauto.  
    (* imports the AST of the program to be verified)
    Require Import VC.sumarray.
    (* processes all struct and unions in program *)
    #[export] Instance CompSpecs : compspecs. make_compspecs prog. Defined.
    (* processes all global variable declarations *)
    Definition Vprog : varspecs. mk_varspecs prog. Defined.
    ```

## Example program:
    ```
    #include <stddef.h>

    unsigned sumarray(unsigned a[], int n) {
      int i; unsigned s;
      i=0;
      s=0;
      while (i<n) {
        s+=a[i];
        i++;
      }
      return s;
    }

    unsigned four[4] = {1,2,3,4};

    int main(void) {
      unsigned int s;
      s = sumarray(four,4);
      return (int)s;
    }
    ```

### How to verify the functional correctness of sumarray?
- sumarray computes the sum of the elements present in the array.
- To prove that the sum is computed correctly, first we need to write a functional model of adding a sequence and prove properties about them.

    ```
    Definition sum_Z : list Z → Z := fold_right Z.add 0.
    Lemma sum_Z_app:
        ∀ a b, sum_Z (a++b) = sum_Z a + sum_Z b.
        Proof.
            intros. induction a; simpl; lia.
        Qed.
    
    ```
    - The datatypes used in the model can be of any type as long as there exists a conversion relation between Coq data type and data type used in the actual program. It is advisable to use Z, list, int, etc. that have a good library support in Coq. 
- Point to note here is that this functional model is not directly related to our sumarray program, but it defines properties about mathematics in general. 

### API spec for sumarray.c program: 
- In Verifiable C, an API specification is written as a series of function specifications ```funspec``` corresponding to the function prototypes.
- A function is specified by precondition and postcondition.
- The precondition has access to the function parameter. In the case of sumarray, the function parameters are a and size. 
- The postcondition has access to the return value of the function. In the case of sumarray, return value s is modeled mathematically as sum_Z. 
- Functions precondition, postcondition, and loop invariants are assertions about state of variables and memory at that particular program point.
- ```PROP```: Properties specified as propositions ```PROP(P)```, where ```P``` is a sequence of properties are defined as propositions in Coq and are defined independent on the state. It is treated as property that will always hold irrespective of the program state.
    ```
        Definition sumarray_spec : ident × funspec :=
        DECLARE _sumarray
        WITH a: val, sh : share, contents : list Z, 
             size: Z
        PRE [ tptr tuint, tint ]
          PROP (readable_share sh; 
                0 ≤ size ≤ Int.max_signed;
                Forall (fun x ⇒ 0 ≤ x ≤ 
                           Int.max_unsigned) contents)
          PARAMS (a; Vint (Int.repr size))
          SEP (data_at sh (tarray tuint size) 
              (map Vint (map Int.repr contents)) a)
        POST [ tuint ]
          PROP () 
          RETURN (Vint (Int.repr (sum_Z contents)))
          SEP (data_at sh (tarray tuint size) 
          (map Vint (map Int.repr contents)) a).
    ```
    For example, in the specification for sumarray, the propostion ```0 ≤ size ≤ Int.max_signed``` needs to be satisfied always irrespective to program state. ```x``` represents the argument ```n``` and as its type is int, this proposition ensures that the size of x is within the range and there is no possibility of integer overflow.
- ```LOCAL```: The ```LOCAL``` clause describes properties about the local variables of the function.
  - In a function precondition, ```PROP/SEP/PARAMS``` can be used to write properties about local variables. ```PARAMS``` lists the values of arguments/parameters to a function.
  - In a function-postcondition, ```RETURN(v)``` indicate the return value of the function. 
  - Within a function body (in assertions and invariants), we write ```LOCAL``` to describe the values of local variables (including parameters). 
  - ```SEP(R)``` conjuncts R are spatial assertions in separation logic. For example, in sumarray.c ```SEP``` includes ```SEP (data_at sh (tarray tuint size) 
              (map Vint (map Int.repr contents)) a)```, which represents that a ```data_at``` assertion. It says that at address ```a``` in memory, there is a data structure of type ```tarray tuint size``` with access-permission ```sh```, and the contents of that array is the sequence ```map Vint (map Int.repr contents)```.
- The postcondition is introduced by ```POST [tuint]```, indicating that this function returns a value of type ```unsigned int```. 

#### Overall specification for sumarray:
At any call to sumarray, there exist value ```a```, ```sh```, ```contents```, ```size``` such that ```sh``` gives at least read-permission; ```size``` is representable as a nonnegative 32-bit signed integer; function parameter ```_a``` contains a value ```a``` and ```_n``` contains the 32-bit representation of ```size```; and there is an array in ```sum_int(contents)```, and leaves the array in memory unaltered.

### Function specification for main()
- The function specification for main has a special form. It has a global variable notion as ```gv``` and its precondition defined as ```main_pre```.
    ```
    Definition main_spec :=
    DECLARE _main
      WITH gv : globals
      PRE [] main_pre prog tt gv
      POST [ tint ]
        PROP()
        RETURN (Vint (Int.repr (1+2+3+4)))
        SEP(TT).
    ```
  The postcondition says we have indeed added up the global array four. 

## Packaging the Gprog and Vprog:
To prove the correctness of a whole program:
  - Collect the function-API specs together in Gprog

    For example, ```Definition Gprog := [sumarray_spec; main_spec].``` 
    
    GProg consists of funspecs that we build using ```DECLARE```
  - Prove that each function satisfies its own API spec
  - Tie everything together with a proof 

### Proof of individual function:
In the sumarray.c case,

```Lemma body_sumarray: semax_bpdy Vprog Gprog f_sumarray sumarray_spec.```

where ```Vprog``` is a set of global definitions, ```f_sumarray``` is the actual function body (AST of C code) as parsed by clightgen.

The lemma says in the context of Vprog and Gprog, the function body f_sumarray satisfies its specification sumarray_spec.

- Proof is done using a hoare tripe ```Delta |- {Pre} c {Post}```, where ```Pre``` and ```Post``` are taken from the funspec, ```c``` is the body of the function, and the type-context ```Delta``` is calculated from the global type-context overlaid with the parameter and local-types of the function. Proof utilizes symbolic execution to prove assertions. 

- Loop invariant: EX...PROP(...)LOCAL(...)SEP(...)

  Each iteration of the loop has a state characterized by a different value of some iteration variable(s), the EX binds that value. 


