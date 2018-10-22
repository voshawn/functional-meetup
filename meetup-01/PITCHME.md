---?image=assets/meetup.png&size=auto 100% color=#3023AE
Getting Started with Elixir

---
## Introductions
- Name / About?
- What are you trying to get out of this?

+++
#### Shawn Vo
1. Learn more, faster
2. Meet other people who are hyped about FP / Elixir
3. Build a dope community

---
![Video](https://www.youtube.com/embed/lxYFOM3UJzo)

---
## This Week's Reading
- Abstractions & Substitution
- Applicative VS Normal Order
- Conditionals & Predicates
- Square Root Example
---
### Abstractions & Substitution

+++?code=meetup-01/abstractions.exs&lang=elixir
@[2-4]
@[6-9]

---
### Applicative VS Normal Evaluation
- Why does this matter?
- How does Exlir do it?

+++?code=meetup-01/evaluation_order.exs&lang=elixir

---
### Conditionals & Predicates
- When should we use `cond`, `case`, `if`, `guards`?
+++?code=meetup-01/conditionals.exs&lang=elixir
@[2-9]
@[11-18]
@[20-22]
@[24-25]

---
### Square Root Example

+++?code=meetup-01/square_root.exs&lang=elixir

+++
#### How can we improve this?
1. Make `good_enough?` better for large and small numbers
1. Clean up code
1. Could we scope the variables better?
1. Implement cube root


