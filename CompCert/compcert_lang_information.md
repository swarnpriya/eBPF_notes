# CompCert Intermediate Languages: 
- The C language can be non-deterministic. For example, the evaluation of the expression can be in any order and which would lead to non-deterministic behavior. 
    ```
    #include <stdio.h>
    int a() { printf("a "); return 1; }
    int b() { printf("b "); return 2; }
    int c() { printf("c "); return 3; }
    int main () {
    printf("%d\n", a() + (b() + c()));
    return 0;
    }

    Output:
    a b c 6
    a c b 6
    b a c 6
    b c a 6
    c a b 6
    c b a 6
    ```
    When we run the program, the output can be different because the call to a(), b() and c() can occur in any order. Hence the C standard and CompCert very first language (```CompCertC```) can show non-determinism. 
- ```Clight```:
    - Properties of ```Clight```
        - Deterministic semantics (modeled as big-step semantics??)
        - Subset of C
            - No variable length array
            - No struct or union passed by value in functions
            - Experssions do not have side-effects
            - No block-scoped variables are allowed.
            - Only allows global and function local variables.
        - Memory is modelled as disjoint blocks, each block being accessed through byte offsets; pointer values are pairs of a block identifier and a byte offset. 
        - In Clight, each variable is mapped to seperate disjoint memory blocks. Memory blocks are identifiers with offsets.
- ```C#minor```
    - C#minor is deterministic (picks one evaluation order) and modeled as small-step semantics.
    - Local variables of scalar types whose addresses are never taken are "pulled out of memory" and turned into temporaries.
    - All type-dependent behaviors are made explicit.  
        - Operator overloading is resolved 
        - Implicit conversion is materialized 
        - Array and struct accesses become load and store operation with explicit address computation
        - C loops are encodes using block and exit. 
- ```Cminor```
    - Notion of Stack 
        

# CompCert Memory Model:
- In ``CLight``, every variable is mapped to a seperate block. 
    - The local environment maps local variables to block references (which are        basically positive number) and types. The current value of the variable is stored in the associated memory block.
- Memory models also include ``permission`` of the form:
    - Readable 
    - Writable 
    - Freeable 
    - Nonempty (isn't readable but also not empty)
    For example, memory load need to ensure that the address is ``Readable``
