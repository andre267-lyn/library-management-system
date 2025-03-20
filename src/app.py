from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from src.config.database import db, init_db

app = Flask(__name__)
init_db(app)  # Inisialisasi database dengan konfigurasi Flask

# Inisialisasi Flask-Migrate
migrate = Migrate(app, db)

# Pastikan model sudah di-import agar dikenali oleh migrasi
from src.models.book import Book

if __name__ == "__main__":
    app.run(debug=True)
