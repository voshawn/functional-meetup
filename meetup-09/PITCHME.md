---
@snap[west]
###### NYC Functional Programming
### @color[#FFF](Phoenix LiveView)
@snapend

---
### Discussion Topics
- What is LiveView?
- Compared to React
- Pros
- Cons
- Example

---
### What is LiveView?
@ul[list-content-verbose]
- An Elixir library that for building interactive, and bi-directional web apps that do not require javascript.
- Uses Websockets to get "server side rendering in real time."
- Removes a boundary between client and server so that development and maintenance is easier. 
@ulend

---
### Compared to React
![Live View](meetup-09/liveview.png)

---
### Pros
@ul[list-content-verbose]
- Reduce dependencies and simplify stack.
    - Size: Liveview < 30K; React > 100K.
- Reduce the number of places that state, business logic and rendering are handled.
- Reduce data transfer / payload size.
@ulend


---
### Cons
@ul[list-content-verbose]
- Doesn't work for mobile apps.
- No offline support.
- Not great for big / complex apps with lots of interactions.
- Uses more memory on the server compared to stateless requests.
@ulend

---
### Demos
- `https://github.com/chrismccord/phoenix_live_view_example`