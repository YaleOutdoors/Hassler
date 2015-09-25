# Getting Started
## Setting Up
```
bundle install
rake db:create
rake db:migrate
```

## Database (postgres)
User: hassler
Password: yohohoho

# API Specification
Current version: `less than alpha`

Most requests require an access token in the "hassler-access-token" 
field in the request header. This token is a 64 byte string encoded in 
base64, which expires 4 hours after issue. (this will probably be changed 
to expire 4 hours after the last use, but this is still under consideration)

**Public Endpoints** (No access token required)
* Login: `POST /login`
* Create new user: `POST /users`

## Users
* Login: `POST /login`: 
  - Parameters: `id_token`, an id_token from a Google OAuth 2 signin
  - Return: `hassler-access-token`, `401` if the access token is bad or the user is not registered
* Create: `POST /users`
  - 500 if creation failed
* Index: `GET /users`
* Show: `GET /users/:id`
* Update: `PUT /users/:id` (under construction)
* Destroy: `DELETE /users/:id`
## Trips
* Show: `GET /trips/:id`
* Index: `GET /trips`
* Signup: `PUT /trips/:id/signup`
  - Signs up the user making the request for trip `:id`
* Create: `POST /trips`
  - 500 if creation failed
* Update: `PUT /trips/:id` (under construction)
* Destroy: `DELETE /users/:id`

