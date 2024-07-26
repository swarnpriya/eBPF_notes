# CompCert Information:
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
- To make the formal verification achievable, CompCert introduces ```Clight```:
    - Properties of ```Clight```
        - Deterministic semantics
        - Subset of C
            - No variable length array
            - No struct or union passed by value in functions
            - Experssions do not have side-effects
            - No block-scoped variables are allowed.
            - Only allows global and function local variables.
        - Memory is modelled as disjoint blocks, each block being accessed through byte offsets; pointer values are pairs of a block identifier and a byte offset. 
        - In Clight, each variable is mapped to seperate disjoint memory blocks. Memory blocks are identifiers with offsets.
        

