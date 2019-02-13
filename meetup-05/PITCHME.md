---?image=assets/meetup.png&size=auto 100% color=#3023AE
@snap[west]
##### Falling in love with Elixir
@snapend

---
### Discussion Topics
- Show and Tell
- Elixir News
- 3.4 Concurrency: Time Is of the Essence
- 3.5 Streams
- Community Building

---
### Elixir News
@ul[list-content-verbose]
- Elixir 1.8 release last month
- There is only one last major feature planned for upcoming Elixir versions, which is the addition of `mix release` to Elixir itself, streamlining the experience provided by packages like distillery. With `mix release`, a developer can bundle the VM and all compiled code in a single directory, which can then be packaged and sent to production.
@ulend

---
### 3.4 Concurrency
@ul[list-content-verbose]
- In addition to making programs more modular, concurrent computation can provide a speed advantage over sequential computation.
- When several processes **share a common state variable**, they may become **interleaved** and produce unexpected results.
- **Serialization** creates distinguished sets of procedures such that only one execution of a procedure in each serialized set is permitted to happen at a time.
- Serializers can be implemented with a **mutex**. Once a mutex has been acquired, no other acquire operations on that mutex may proceed until the mutex is released.
- Deadlock is always a danger in systems that provide concurrent access to multiple shared resources.
@ulend

+++?code=meetup-05/bank.exs&lang=elixir&title=GenServers are Serializers?

---
### 3.5 Streams
@ul[list-content-verbose]
- Streams lets us model systems that have state without ever using assignment or mutable data.
- Stream allows one to use sequence manipulations without incurring the costs of manipulating sequences as lists because they construct just enough that's needed for the consumer automatically.
- Streams are inplmented teewith `delay` and `force`: Delay must package an expression so that it can be evaluated later on demand. Force simply calls the procedure (of no arguments) produced by delay.
- We can model a changing quantity, such as the local state of some object, using a stream that represents the time history of successive states.
- How might we create the bank account with streams in Elixir?
@ulend

+++?code=meetup-05/streams.exs&lang=elixir

---
### Community Building
- Feedback
- Plan next meeting
