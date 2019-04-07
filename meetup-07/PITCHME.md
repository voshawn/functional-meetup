---?image=assets/meetup.png&size=auto 100% color=#3023AE
@snap[west]
##### Nondeterministic Computing + Logig Programming
@snapend

---
### Discussion Topics
- Show and Tell
- Elixir News
- 4.3 Nondeterministic Computing
- 4.4 Logic Programming
- Community Building

---
### Show and Tell

---
### Elixir News
@ul[list-content-verbose]
- Scenic
- Mix Formatter
@ulend

---
### 4.3 Nondeterministic Computing
@ul[list-content-verbose]
- Ordinary expressions will return a value, never terminate, or return an error.
- Nondeterministic expressions can result in a dead-end, in which case evaluation must backtrack to a previous choice point.
- Nondeterministic expressions can also have more than one correct answer, depending on how you handle the choice points.
- Logic puzzles and NLP are some examples of problems that can be solved
  nondeterministically.
- The special form `amb` (ambiguous) is used to implement nondeterminism.
- It is not random, it only models a nondeterministic choice. Typically the tree of choices is searched in a predictable order.
@ulend

### 4.3 Nondeterministic Computing
@ul[list-content-verbose]
- If we had infinite processors, execution would proceed sequentially, until an `amb` expression is encountered. Then, more processors would be allocated to continue all of the parallel executions implied by the choice. Each processor would proceed sequentially as if it were the only choice, until it either terminates by encountering a failure, or it further subdivides, or it finishes.
- If we had limited processors, we would have to go down the branches
  sequentially. One systematic way of doing that is `depth-first search`.
- The execution procedures for the ordinary evaluator take one argument: the environment of execution. The execution procedures in the `amb` evaluator take three arguments: the environment, thhe success continuation, and the failure continuation.
@ulend

---?code=meetup-07/puzzle.exs&lang=elixir&title=Logic Puzzle with Spawn (many processes)

---
### 4.4 Logic Programming
@ul[list-content-verbose]
@ulend


---
### Community Building
- Feedback
- Plan next meeting
