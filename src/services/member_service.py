from src.models.member import Member
from src.config.database import db
import re

def create_member(name, email, phone, address):
    if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
        raise ValueError("Invalid email format")
    if not re.match(r"^\d{10,15}$", phone):
        raise ValueError("Invalid phone format")
    if Member.query.filter_by(email=email).first():
        raise ValueError("Email already exists")
    new_member = Member(name=name, email=email, phone=phone, address=address)
    db.session.add(new_member)
    db.session.commit()
    return new_member