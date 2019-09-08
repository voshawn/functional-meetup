---
@snap[west]
###### NYC Functional Programming
### @color[#FFF](Lambda Calculus with Elixir)
@snapend

---
### Discussion Topics
- What is the lambda calculus?
- Syntax & Rules
- Turing (Imparative) VS Lambda (Functional)
- Examples

---
### What is the lambda calculus?
@ul[list-content-verbose]
- Lambda calculus is a formal system in mathematical logic and computer science for expressing computation by way of variable binding and substitution.
- World's smallest programming language.
- Forms the basis of all functional programming languages.
- Can be used to express anything that is computable (Turing Complete).
@ulend

---

### Syntax & Rules
@ul[list-content-verbose]
- Syntax:
  - expression = name | function | application
  - function = λ name.expression
  - application = expression expression
- Rules:
  1. α-conversion: Renaming variables
  2. β-reduction: Substitution 
  3. η-conversion: Adding / removing unused variables.
- Does not have numbers, characters, or any non-function datatype!
@ulend


---
### Turing (imparative) 
@ul[list-content-verbose]
- Imperative programming languages are abstractions on top of the Von Neumann computer architecture. 
- The Von Neumann computer architecture is based on the mathematical model of computation proposed by Turing in 1937: the Turing machine.
- Fundemental concepts:
    - store
    - variable: something that is possible to modify ("memory cell")
    - assignment
    - iteration
@ulend

--- 
### Lambda (functional)
@ul[list-content-verbose]
- What if we don't care about the machine? Could things be simplier to understand? 
- Functional programming is based off the mathematical model of computation: the λ-calculus
- Fundemental concepts:
    - expression
    - recursion: different from the notion of iteration
    - evaluation: different from the notion of execution (when we evaluate a mathematical expression we do not modify anything)
    - variable: intended in a mathematical sense (unknown entity, abstraction from a concrete value)
@ulend

---?code=meetup-10/lambda.exs&lang=elixir&title=Church Numerals / Boolean Logic