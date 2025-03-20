from src.config.database import db
import uuid
from sqlalchemy.dialects.postgresql import ENUM

class Borrowing(db.Model):
    __tablename__ = 'borrowings'
    id = db.Column(db.UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    book_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('books.id'), nullable=False)
    member_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('members.id'), nullable=False)
    borrow_date = db.Column(db.Date, nullable=False)
    return_date = db.Column(db.Date)
    status = db.Column(ENUM('BORROWED', 'RETURNED', name='status_enum'), default='BORROWED')
    created_at = db.Column(db.TIMESTAMP, default=db.func.current_timestamp())
    updated_at = db.Column(db.TIMESTAMP, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
