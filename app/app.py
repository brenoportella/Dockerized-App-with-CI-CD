from flask import Flask, request, jsonify
from sqlalchemy import create_engine, text
import os

app = Flask(__name__)

db_url = os.getenv("DATABASE_URL", "postgresql://postgres:postgres@db:5432/postgres")
engine = create_engine(db_url, echo=True)

@app.route("/")
def home():
    return "Flask + Postgres running in Docker!"

@app.route("/add", methods=["POST"])
def add():
    data = request.json.get("message")
    with engine.begin() as conn:
        conn.execute(text("CREATE TABLE IF NOT EXISTS messages (id SERIAL PRIMARY KEY, content TEXT)"))
        conn.execute(text("INSERT INTO messages (content) VALUES (:msg)"), {"msg": data})
    return {"status": "ok", "message": data}

@app.route("/messages")
def messages():
    with engine.begin() as conn:
        rows = conn.execute(text("SELECT * FROM messages")).fetchall()
    return jsonify([dict(r._mapping) for r in rows])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
