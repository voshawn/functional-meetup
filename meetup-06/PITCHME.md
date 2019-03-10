---?image=assets/meetup.png&size=auto 100% color=#3023AE
@snap[west]
##### Code Evaluation in Lisp + Elixir
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
    - Eval takes as arguments an expression and an environment. It classifies the expression and directs its evaluation.
    - Apply takes two arguments, a procedure and a list of arguments to which the procedure should be applied.
- The evaluator needs to define external syntax of expressions and data structures that the evaluator manipulates internally.
@ulend

---?code=meetup-06/eval.exs&lang=elixir&title=Kinda Hacky Evaluator Elixir

---
### 4.2 Lazy Evaluation
@ul[list-content-verbose]
- Applicative Order: all arguments are evaluated when the procedure is applied.
- Normal Order (Lazy Evaluation): delay evaluation of procedure arguments until the actual argument values are needed.
- To change the evaluator to Normal Order:
    - The interpreter must determine which arguments are to be evaluated and which are to be delayed.
    - The delayed arguments are not evaluated; instead, they are transformed into objects called thunks.
    - Thunks are "Forced" (evaluated) when the value is needed:
@ulend


---
### Community Building
- Feedback
- Plan next meeting
