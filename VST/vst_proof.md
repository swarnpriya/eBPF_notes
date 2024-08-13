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

- Example program:
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
    - 