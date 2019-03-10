---?image=assets/meetup.png&size=auto 100% color=#3023AE
@snap[west]
##### Under the Hood: Code Evaluation in Lisp + Elixir
@snapend

---
### Discussion Topics
- Show and Tell
- Elixir News
- 4.1 The Metacircular Evaluator
- 4.2 Lazy Evaluation
- Community Building

---
### Show and Tell

---
### Elixir News
@ul[list-content-verbose]
- Mint is a new low-level HTTP client that aims to provide a small and functional core that others can build on top.
@ulend

---
### 4.1 The Metacircular Evaluator
@ul[list-content-verbose]
- An evaluator that is written in the same language that it evaluates is said to be **metacircular**.
- The environment model of evaluation has two parts:
    - Eval takes as arguments an expression and an environment. It classifies the expression and directs its evaluation. Eval is structured as a case analysis of the syntactic type of the expression to be evaluated. Each type of expression has a predicate that tests for it and an abstract means for selecting its parts.
    - Apply takes two arguments, a procedure and a list of arguments to which the procedure should be applied.
- The evaluator needs to define external syntax of expressions (self-evaluating items, symbols/variables, if-statements, etc...) and data structures that the evaluator manipulates internally (testing predicates, representing procedures, operating on enviroment, etc...) 
@ulend

+++?code=meetup-05/eval.exs&lang=elixir&title=Kinda Hacky Eval and Apply in Elixir

---
### 4.2 Lazy Evaluation
@ul[list-content-verbose]
- Applicative Order: all arguments are evaluated when the procedure is applied.
- Normal Order (Lay Evaluation): delay evaluation of procedure arguments until the actual argument values are needed.
- To change the evaluator to Normal Order:
    - The interpreter must determine which arguments are to be evaluated and which are to be delayed.
    - The delayed arguments are not evaluated; instead, they are transformed into objects called thunks.
        - The thunk must contain the information required to produce the value of the argument when it is needed, as if it had been evaluated at the time of the application.
    - Thunks are "Forced" (evaluated) when the value is needed:
        - When it is passed to a primitive procedure that will use the value of the thunk
        - When it is the value of a predicate of a conditional
        - When it is the value of an operator that is about to be applied as a procedure. 
@ulend


---
### Community Building
- Feedback
- Plan next meeting
