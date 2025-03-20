from src.config.database import db
from src.app import app

with app.app_context():
    db.create_all()