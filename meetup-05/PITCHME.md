---?image=assets/meetup.png&size=auto 100% color=#3023AE
@snap[west]
##### Falling in love with Elixir
@snapend

---
### Discussion Topics
- Show and Tell
- 3.4 Concurrency: Time Is of the Essence
- 3.5 Streams
- Community Building


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
- Whats the difference between subsitution and environment model?
- What are the two rules to summarize the environment model of procedure
  application?



+++?code=meetup-05/queue.exs&lang=elixir

---
### Community Building
- Feedback
- Plan next meeting
