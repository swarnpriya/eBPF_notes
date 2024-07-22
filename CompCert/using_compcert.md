# How to use the CompCert C compiler
- After compilation using ```make -j12 all``` in the directory CompCert, it generates ./ccomp. 
- ```ccomp``` can be used in command-line to compile C programs using CompCert. 
      
      ``./ccomp [options] input-file``
- By default, every input file is processed in sequence to obtain a compiled object; then all compiled object files thus obtained, plus those given on the command line, are linked together to prodcue an executable program. 
- **Available options:**
   - **-c** : Stop compilation before invoking the linker, leaving the compiled 
          object files with extension .o as the final result. 
   - **-S** : Stop compilation before invoking the assembler, leaving assembly files with the .s extension as the final result. 
   - **-interp** : Interpreter command. Prints the trace (events that are generated while executing the program).
   - **-trace** : Print a detailed trace of the execution. At each time step, the interpreter displays the expression or statement or function invocation that it is about to execute. 
   - **-quiet** : Do not print any trace of the execution. The only output produced is that of the printf calls contained in the program. 
   - **-E** : Stop after preprocessing stage; do not compiler not link. The output is preprocessed C source code for every input file x.c.
   - **-sdump** : Generates the abstract syntax tree for the generated assembly code, in JSON format. 
   - **-dclight** : Save the generated Clight intermediate code in file x.light.c. 
   - **-dcminor** : Save generated Cminor intermediate code in the file x.cm. 
   - **-drtl** : Save generated RTL form at successive stage of optimization in files x.rtl.0, x.rtl.1, etc.
   - **-dltl** : Save LTL form after register allocation in x.ltl.
   - **-dmach** : Save Mach form after stack layout in file x.mach.

- **Available extensions:**
   - **.c** : Source files written in C. Given the file x.c, the compiler preprocesses the file, then compiles it to assembly language, then invokes the assembler to produce an object file names x.o. 
   - **.i/.p** : C source files that should not be preprocessed. These files are either already preprocessed or not using any preprocessing directive. 
   - **.s** : Source files written in assembly language. Given the file x.s, the compiler passes it to the assembler and produces an object file named x.o.
   - **.o** : Files ending in .o are taken as object files and they are passed directly to the linker. 
   - **.a** : Compiled library files. Can be directly fed into the linker. 
   