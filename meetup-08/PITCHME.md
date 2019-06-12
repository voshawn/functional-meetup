---
@snap[west]
###### NYC Functional Programming
#### @color[#FFF](Event Sourcing and CQRS)
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
@ulend
![Releases](meetup-08/releases.png)

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
### Event Sourcing and CQRS
@ul[list-content-verbose]
- The mantra of ES is that the state of a system is given by all the events that lead to that state.
- Those events can never be modified once emitted, and are stored in an append-only storage called the event store.
- ![Event Store](https://cdn-images-1.medium.com/max/1600/1*s3LbOhxnYFC4cKPshlAWcA.jpeg)
@ulend

---
### Event Sourcing and CQRS
@ul[list-content-verbose]
- Images / Diagrams
@ulend

---
### Pros 
@ul[list-content-verbose]
- When to use
@ulend

---
### Cons
@ul[list-content-verbose]
- When not to use
@ulend

---
### Glossary
@ul[list-content-verbose]
- *Command:* Used to instruct an application to do something and named in the imperative: register account, transfer funds, mark fraudulent activity. A command is dispatched to its corresponding handler using a router.
- *Router:* Maps a command to its corresponding handler function or aggregate module.
@ulend

---
### Glossary - Events
@ul[list-content-verbose]
- *Event sourcing:* Application state changes are modelled as a stream of domain events. An aggregate’s current state is built by replaying its domain events: `f(state, event) => state`
- *Domain events:* Indicate something of importance has occurred within a domain model. They are named in the past tense: account registered, funds transferred, fraudulent activity detected. Events may be consumed by multiple event handlers.
- *Event handler:* Receives every event persisted to the event store. The event store remembers the handler's last seen event to support restarts. The handler must acknowledge receipt of each processed event.
@ulend


---
### Glossary
@ul[list-content-verbose]
- *Aggregate:*  Defines a consistency boundary for transactions and concurrency. Aggregates should also be viewed from the perspective of being a "conceptual whole". They are used to enforce invariants in a domain model and to guard against business rule violations. An aggregate is comprised of entities and value objects. All access to the aggregate must go through the entity defined as the aggregate root.
- *Process manager:* Coordinates one or more aggregates: receives events and dispatches commands. May also track state necessary to route commands to the appropriate aggregate.
@ulend

---
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