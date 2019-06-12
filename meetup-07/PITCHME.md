---?image=assets/meetup.png&size=auto 100% color=#3023AE
@snap[west]
##### Nondeterministic Computing + Logic Programming
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
@ulend

---
### 4.3 Nondeterministic Computing (What is it?)
@ul[list-content-verbose]
- Ordinary expressions will return a value, never terminate, or return an error. Nondeterministic expressions can result in a dead-end, in which case evaluation must backtrack to a previous choice point.
- Nondeterministic expressions can also have more than one correct answer, depending on how you handle the choice points.
- Logic puzzles and NLP are some examples of problems that can be solved like this.
- The special form `amb` (ambiguous) is used to implement nondeterminism.
- It is not random, it only models a nondeterministic choice. Typically the tree of choices is searched in a predictable order.
@ulend

---
### 4.3 Nondeterministic Computing (How to implement)
@ul[list-content-verbose]
- If we had infinite processors, execution would proceed sequentially, until an `amb` expression is encountered. Then, more processors would be allocated to each path. Each processor would proceed until it either terminates by encountering a failure, or it further subdivides, or it finishes.
- If we had limited processors, we would have to go down the branches sequentially. One systematic way of doing that is `depth-first search`.
- In addition to thhe expression, an ordinary evaluator take one argument: the environment of execution. The `amb` evaluator take three arguments: the environment, the success continuation, and the failure continuation.
@ulend

---?code=meetup-07/puzzle.exs&lang=elixir&title=Logic Puzzle with Spawn (many processes)

---
### 4.4 Logic Programming (What is it?)
@ul[list-content-verbose]
- Logic programming focuses more on "what is" rather than "how to". This is powerful because a single "what is" fact may have multiple "how to" components (i.e you can model relationships that are not just unidirectional (inputs -> outputs)).
- A query language is a type of logic programming because it is good for information retrevial.
- You can write Primative queries, Compound queries (and, or, not), Rules (abstractions of queries)
- Query languages use `pattern matching` for simple and compound queries and `unification` to evaluate rules.
- Logic programming is not exactly mathematical logic because it still interprets the logic procedually.
@ulend

---
### 4.4 Logic Programming (How to implement?)
@ul[list-content-verbose]
- Frames specifies bindings for pattern variables. A stream of frames is referenced against assertions (data) in the database to see if there are matches. If so, frames are extended (fill in variables) to create the output stream.
- Driver loop takes in input, routes to an assertion handler or a `qeval` function, and displays output.
- `qeval` behaves similar to `eval`, It takes as inputs a query and a stream of frames, and returns a stream of extended frames.
@ulend

---
### Community Building
- New Direction / Potential Topics
    - Testing
    - Macros
    - Deployment
    - IoT / Nerves
    - Channels / Phoenix
    - Streaming / Membrane
    - Embedded UI / Scenic
