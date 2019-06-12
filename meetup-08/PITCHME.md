---
@snap[west]
###### NYC Functional Programming
### @color[#FFF](Event Sourcing and CQRS)
@snapend

---
### Discussion Topics
- Elixir News
- Show and Tell
- Event Sourcing and CQRS
- Pros
- Cons
- Example

---
### Elixir News
@ul[list-content-verbose]
- Elixir 1.9 is out!
    - Main feature is Releases. This is supposed to be the last core feature. Elixir is now "complete".
- ![Releases](meetup-08/releases.png)
@ulend

---
### Show and Tell
- [Axle Payments](https://staging.axlepayments.com)
    - Umbrella App:
        1. Server Side Marketing Page (Better SEO)
        2. React Web App (Nice SPA interface)
        3. JSON Backend (Easy mobile port)
    - Deployed on GCP
        1. Release built inside Docker (but not deployed with docker or k8s)
        2. Deployed on Compute instances
        3. Behind load balancer (rolling deployments) 

---
### Event Sourcing (ES)
@ul[list-content-verbose]
- The mantra of ES is that the state of a system is given by all the events that lead to that state.
- Those events can never be modified once emitted, and are stored in an append-only storage called the event store.
- ![Event Store](https://cdn-images-1.medium.com/max/1600/1*s3LbOhxnYFC4cKPshlAWcA.jpeg)
@ulend

---
### Command Query Responsibility Segregation (CQRS)
@ul[list-content-verbose]
- While ES is great for traceability, simple queries can become very complex and inefficient.
- That's why ES isused in combination with CQRS, a pattern that handles reads and writes in the system with two very distinct entities.
- ![EES/CQRS](https://cdn-images-1.medium.com/max/2600/1*2IUbZocoe_zT-mSec-crmg.jpeg)
@ulend

---
### Projection
@ul[list-content-verbose]
- `BankAccount` is called a **projection** of the event stream.
@ulend

---?image=https://cdn-images-1.medium.com/max/1600/1*1oUxSMaXHVuETYiWAG4rcQ.jpeg&size=contain

---
### Asynchronous / Availability
@ul[list-content-verbose]
- ![Async](https://cdn-images-1.medium.com/max/2400/1*NCP3YktA4Oo86tHncrOXPw.jpeg)
- Because the event store is asynchronous, the system is able to keep response times short and handle huge traffic with zero impact on the write side.
- But this creates a potential problem: Write Consistancy / Business Logic (i.e withdrawing insufficient funds.)
@ulend

---
### Aggregates
@ul[list-content-verbose]
- Aggregates are small stateful components on the write side that receives **commands** produces **events**. 
- The aggregate uses its state to make business decisions.
- ![Aggregates](https://cdn-images-1.medium.com/max/2600/1*vBvbCa9qT_Ttl2ToQkvD1w.jpeg)
- The actor model of Elixir is a perfect fit for these aggregates. A GenServer has a state and receives messages in its mailbox.
@ulend

---
### Pros 
@ul
- Traceability
- Performance
- Availability
- Consistency
- Maintainability
@ulend

---
### Cons
@ul[list-content-verbose]
- Certain tasks can be alot more complicated. (e.g check that a user email is not already taken.)
- CQRS/ES rarely fits a whole system, and should be used sparingly. 
- Can't make breaking changes. Need to maintain versions of events and handle the different versions in aggregates and projections.
- Works best for systems where the domain is clearly defined and understood. 
@ulend

---
### Glossary
@ul[list-content-verbose]
- *Command:* Used to instruct an application to do something and named in the imperative: register account, transfer funds, mark fraudulent activity. A command is dispatched to its corresponding handler using a router.
- *Router:* Maps a command to its corresponding handler function or aggregate module.
@ulend

+++
### Glossary - Events
@ul[list-content-verbose]
- *Event sourcing:* Application state changes are modelled as a stream of domain events. An aggregate’s current state is built by replaying its domain events: `f(state, event) => state`
- *Domain events:* Indicate something of importance has occurred within a domain model. They are named in the past tense: account registered, funds transferred, fraudulent activity detected. Events may be consumed by multiple event handlers.
- *Event handler:* Receives every event persisted to the event store. The event store remembers the handler's last seen event to support restarts. The handler must acknowledge receipt of each processed event.
@ulend


+++
### Glossary
@ul[list-content-verbose]
- *Aggregate:*  Defines a consistency boundary for transactions and concurrency. Aggregates should also be viewed from the perspective of being a "conceptual whole". They are used to enforce invariants in a domain model and to guard against business rule violations. An aggregate is comprised of entities and value objects. All access to the aggregate must go through the entity defined as the aggregate root.
- *Process manager:* Coordinates one or more aggregates: receives events and dispatches commands. May also track state necessary to route commands to the appropriate aggregate.
@ulend

+++
### Glossary
@ul[list-content-verbose]
- *Projection:* Read model built to support a specific query, often using denormalised data. Projections are cheap and easy to build and rebuild.
- *Projector:*  An event handler that populates a read model projection from data contained within the events it is interested in. Projectors run asynchronously and are decoupled from each other.
@ulend

---
### Giftcard Demo
- `git clone https://github.com/slashdotdash/gift-card-demo.git`
- Commanded Library
- Phoenix LiveView