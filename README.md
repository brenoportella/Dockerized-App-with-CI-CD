# Project B - Dockerized Flask Web App with CI/CD

## Objective
Transform a simple Flask application into a fully containerized web app connected to PostgreSQL, with automated CI/CD workflows.

![Project demo](demo.gif)

## Architecture & Stack
- **Backend:** Flask, Python 3.12
- **Database:** PostgreSQL 15
- **Containerization:** Docker, Docker Compose
- **CI/CD:** GitHub Actions
- **Registry:** GitHub Container Registry (GHCR)

## Features
- Flask API endpoints:
  - `GET /` - Health check
  - `POST /add` - Add a message to the database
  - `GET /messages` - Retrieve all messages
- Automated CI workflow: build and test Docker image
- Automated CD workflow: push Docker image to GHCR

## Prerequisites
- Docker & Docker Compose installed
- GitHub account with GHCR access
- GitHub secrets configured:
  - `GHCR_USERNAME` (your GitHub username)
  - `GHCR_TOKEN` (Personal Access Token with `write:packages`, `read:packages`)

## Project Structure
```
project-b/
│
├── .github/
│   └──.workflows/
│      ├── docker-cd.yml   # Continuous Deployment workflow
│      └── docker-ci.yml   # Continuous Integration workflow
│
├── app/                   # Application source code
│   ├── __init__.py        # Marks directory as a package 
│   ├── app.py             # Minimal Flask app
│   ├── Dockerfile         # Container build instructions
│   └── requirements.txt   # Dependencies
│
├── docker-compose.yml     # Multi-container setup
└── README.md              # Project documentation
```

## Running the App Locally

### Using Docker Compose
1. Clone repository:
```bash
git clone https://github.com/brenoportella/Dockerized-WEB-APP---CI-CD.git
cd Dockerized-WEB-APP---CI-CD
```

2. Pull web image:
```bash
docker pull ghcr.io/<username>/projectb-web:latest
```

3. Start containers:
```bash
docker-compose up -d
```

4. Check status:
```bash
docker-compose ps
docker-compose logs -f
```

5. Test endpoints:
```bash
curl http://localhost:5000/
curl -X POST http://localhost:5000/add -H "Content-Type: application/json" -d '{"message": "Hello Docker!"}'
curl http://localhost:5000/messages
```


## CI/CD Overview
- **CI Workflow:** Runs on pushes or pull requests to `main` - builds and tests the Docker image
- **CD Workflow:** Runs on pushes to `main` - pushes Docker image to GHCR

## Lessons Learned
- Docker & Containerization: building Python/Flask apps as images
- Docker Compose: multi-container orchestration with dependencies
- CI/CD: GitHub Actions workflows for automated build/test/push
- Docker networking: enabling container communication
- Environment variables: secure configuration for containers

## Future Improvements
- Use production WSGI server (Gunicorn) instead of Flask dev server
- Add error handling in endpoints
- Add automated tests for CI
- Configure deployment to cloud servers

## Author
Developed as part of a DevOps learning path and portfolio building project.