An API-only Rails app to be used for building a React app.

API will be used for chatting between users.

Some realtime messaging service like PubNub will be used.

Current API:

1. Create a user:
  ```
    POST /api/users?username=uname
  ```

1. View all users:
  ```
    GET /api/users
  ```

2. View all messages of a user:
  ```
    GET /api/users/:id/messages
  ```

3. Send a message to another user
  ```
    POST /api/users/:id/send_message?receiver_id=1&content=the_message
  ```
