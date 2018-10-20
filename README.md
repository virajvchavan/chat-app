An API-only Rails app to be used for building a React app.
(Deployed here: http://chat-app-rails-api.herokuapp.com/)

See the API in action here: 
  http://react-chat-demo.herokuapp.com/
  (React App: https://github.com/virajvchavan/react-chat)

API will be used for chatting between users.

Some realtime messaging service like PubNub to be used.
(Currently the actual chating functionality is very inefficient. UI has to do polling every few seconds to update the messages)

Current API:

1. Create a user:
  ```
    POST /api/users?username=uname
  ```
  This finds adn old user or creates a new user.
  Returns user_id.

1. View all users:
  ```
    GET /api/users
  ```
  Returns an array of all users registered.

2. View all messages of a user:
  ```
    GET /api/users/:id/messages?receiver_id={id}
  ```
  Returns all messages between two users, ordered by time.

3. Send a message to another user
  ```
    POST /api/users/:id/send_message?receiver_id={id}&content={the_message}
  ```
