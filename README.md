
**README.md**:
# Back End - Task Management Tool

This is the back end of the Task Management Tool, built with Ruby on Rails. It provides the API for managing users, projects, and tasks. The front end can be found at `https://github.com/sebastian-espeset/task_management_fe`

## Features

- User authentication
- CRUD operations for projects
- CRUD operations for tasks within projects

## Technologies

- Ruby on Rails
- PostgreSQL
- Devise for authentication
- Active Model Serializers
- CORS handling

## Setup
1. Install dependencies:

bash
Copy code
`bundle install`

2. Set up the database:

bash
Copy code
rails db:create
rails db:migrate

3. Create a .env file in the root directory and add the following environment variables:

env
Copy code
DATABASE_URL=your_database_url

4. Start the Rails server:

bash
Copy code
rails server
The API will be available at http://localhost:3000/api.

## API Endpoints
### User Authentication

- POST /api/users/sign_in - Sign in
- POST /api/users - Sign up
- DELETE /api/users/sign_out - Sign out
### Projects

- GET /api/projects - Get all projects
- GET /api/projects/:id - Get a specific project
- POST /api/projects - Create a new project
- PUT /api/projects/:id - Update a project
- DELETE /api/projects/:id - Delete a project
### Tasks

- GET /api/projects/:project_id/tasks - Get all tasks for a project
- GET /api/projects/:project_id/tasks/:id - Get a specific task
- POST /api/projects/:project_id/tasks - Create a new task
- PUT /api/projects/:project_id/tasks/:id - Update a task
- DELETE /api/projects/:project_id/tasks/:id - Delete a task
