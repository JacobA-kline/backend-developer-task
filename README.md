# Flask API for Superheroes

This API allows users to create, read, list, and delete  superheroes using a UI, Flask server and a PostgresSQL database.

## Requirements

* Docker
* Docker Compose

## Endpoints

The following endpoints are available in this application:

### `POST /users`

Creates a new user in the database. Accepts a JSON body with the following parameters:

- `username`: a string representing the user's username (required)
- `email`: a string representing the user's email address (required)
- `gender`: a string representing the user's gender (required)
- `first_name`: a string representing the user's first name (required)
- `last_name`: a string representing the user's last name (required)

Returns a message indicating success or failure, along with a corresponding HTTP status code.

### `GET /users/<user_id>`

Retrieves the user with the specified ID.

- `user_id`: a string representing the ID of the user to retrieve

Returns a JSON representation of the user with the specified ID, or an error message if the user was not found.

### `GET /users/all`

Lists all users in the database.

Returns a list of JSON representations of all users in the database.

### `DELETE /users/<user_id>`

Deletes the user with the specified ID.

- `user_id`: a string representing the ID of the user to delete

Returns a message indicating success or failure, along with a corresponding HTTP status code.

## Data Validation

The application includes validation for email addresses and gender. Email addresses are considered valid if they match the pattern `[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+`. Gender is considered valid if it is either "male" or "female". If either of these validations fail, the request will return an error message and a status code of `400 Bad Request`.

## UI
- A Nginx container serves a UI at localhost/user-management/ with the following options:
    - View Specific User 
    - View All Users
    - Delete User
    - Create User
    - Update User


## Running The Application

Run the following command from project directory.
To run in detached mode, give the -d option.
```bash
docker-compose up -d
```

