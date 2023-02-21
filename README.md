# Case Tracker Rails API


## Full project

https://www.youtube.com/watch?v=cONFD37A6y8

https://github.com/mterrano1/Case-Tracker-Final-Project


## Description

This is the backend API for the Case-Tracker application, a case management system that allows users to track cases and their related assignments, customers, and employees.


## Getting Started

1. Clone this repository and `cd` into the project directory
2. Build the Docker image by running `docker build -t case-tracker-api:latest .`
3. Start the Docker container by running `docker run -p 3000:3000 case-tracker-api:latest`
4. Access the API at `http://localhost:3000`


## API Endpoints

- `POST /login`: Authenticate a user and generate a JWT token
- `POST /signup`: Create a new user account and generate a JWT token
- `GET /users`: Retrieve all users (researchers only)
- `GET /users/:id`: Retrieve a single user
- `GET /cases`: Retrieve all cases
- `GET /cases/:id`: Retrieve a single case
- `POST /cases`: Create a new case
- `PUT /cases/:id`: Update an existing case
- `DELETE /cases/:id`: Delete an existing case