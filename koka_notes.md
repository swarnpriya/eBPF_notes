# Koka features:
- A strongly typed language with a strong type-inference engine. A programmer can provide the type annotations for function arguments and return values and the type-inference engine can infer the type of local variables.
- Koka infers all the side-effects that occur in a function.
    - The absence of any effect is denoted as ```:total```
    - An expection is denoted as ```:exn```
    - Non terminating function has effect as ```:div```
    - Non deterministic function has effect as ```:ndet```
    - ...
- Koka also allows to have row of effect: <div, exn, ndet>
