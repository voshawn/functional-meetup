---
@snap[west]
###### NYC Functional Programming Reading Group
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
- Event Sourcing:
- CQRS
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
### Giftcard Demo
- Commanded Library
- Phoenix LiveView
`git clone https://github.com/slashdotdash/gift-card-demo.git`