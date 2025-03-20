from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, scoped_session
from sqlalchemy import create_engine
import os

# Konfigurasi koneksi database PostgreSQL
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://postgres:root@localhost/library_db")

# Membuat engine database
engine = create_engine(DATABASE_URL)

# Inisialisasi SQLAlchemy
db = SQLAlchemy()

# Membuat session factory
SessionLocal = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

# Base untuk deklarasi model
Base = declarative_base()

def init_db(app):
    """Inisialisasi database dengan Flask app."""
    app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)
