# Case-Tracker API

This is the backend API for the Case-Tracker application, a case management system that allows users to track cases and their related assignments, customers, and employees.

## Getting Started

To run this application locally, you will need to have Docker installed on your machine. Once you have Docker installed, you can follow the steps below:

1. Clone this repository and `cd` into the project directory
2. Build the Docker image by running `docker build -t case-tracker-api:latest .`
3. Start the Docker container by running `docker run -p 3000:3000 case-tracker-api:latest`
4. Access the API at `http://localhost:3000`

## API Endpoints

The Case-Tracker API provides the following endpoints:

- `POST /login`: Authenticate a user and generate a JWT token
- `POST /signup`: Create a new user account and generate a JWT token
- `GET /users`: Retrieve all users (researchers only)
- `GET /users/:id`: Retrieve a single user
- `GET /cases`: Retrieve all cases
- `GET /cases/:id`: Retrieve a single case
- `POST /cases`: Create a new case
- `PUT /cases/:id`: Update an existing case
- `DELETE /cases/:id`: Delete an existing case

For more detailed information about the API endpoints and their usage, please refer to the API documentation.
