# Limitations: 

## Types 
- The ```long double``` type is not supported by default. If the -fllongdouble option is set, it is treated as a synonym for double. 
- The result type and argument types of function must not be a structure or union type, unless the -fstruct-passing option is active. 
- Variable length arrays are not supported. The size N of an array declarator T[N] must be always known at compile time. $\color{red}{\textsf{Is it what we need for eBPF?}}$
- Switch statement has some specific fixed format. 
- Pointer values can be converted to any poitner type. A pointer value can also be converted to any integer type of the same size and back to the original pointer type. $\color{red}{\textsf{A notion of ```void *``` which is needed for eBPF.}}$
- CompCert C compiler does not perform preprocessing itself, but delegates this task to an external preprocessor, such as that of GCC (should conform to C99).
- CompCert C compiler does not provide its own implementation of the standard C library. It provides a few standard headers and relies on the standard library for the target system for the others. It has been successfully used in conjuction with the GNU glibc standard library. 
