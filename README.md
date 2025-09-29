# Project B - Dockerized Flask Web App

## Objective
Transform a minimal Python Flask application into a fully containerized service using Docker, making it portable and reproducible across environments.

## Architecture & Stack
- Python 3.12
- Flask 3.0
- Docker
- (Optional) Docker Compose for multi-service orchestration
- (Future) GitHub Actions for CI/CD automation

## Project Structure
```
project-b/
│
├── app/                   # Application source code
│   ├── app.py             # Minimal Flask app
│   └── requirements.txt   # Dependencies
│
├── Dockerfile             # Docker build instructions
└── README.md              # Documentation
```

## How to Run (Local)

### Build the image
```bash
docker build -t projectb-app .
```

### Run the container
```bash
docker run -d -p 5000:5000 --name projectb-container projectb-app
```

### Test the app
Open in your browser:
```
http://localhost:5000
```

Expected output:
```
Hello from Project B
```

## Next Steps
- [ ] Add `docker-compose.yml` for multi-container setup (e.g., Flask + Postgres).
- [ ] Configure CI/CD pipeline using GitHub Actions.
- [ ] Deploy to a remote VPS with HTTPS via Nginx and Let's Encrypt.

## Author
Developed as part of a DevOps learning path and portfolio building project.
