import uuid
from datetime import datetime
from src.config.database import db

class Borrowing(db.Model):
    __tablename__ = "borrowings"

    id = db.Column(db.UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    book_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey("books.id"), nullable=False)
    member_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey("members.id"), nullable=False)
    borrow_date = db.Column(db.Date, default=datetime.utcnow)
    return_date = db.Column(db.Date, nullable=True)
    status = db.Column(db.Enum('BORROWED', 'RETURNED', name="borrowing_status"), default='BORROWED')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    def to_dict(self):
        return {
            "id": str(self.id),
            "book_id": str(self.book_id),
            "member_id": str(self.member_id),
            "borrow_date": self.borrow_date.strftime("%Y-%m-%d"),
            "return_date": self.return_date.strftime("%Y-%m-%d") if self.return_date else None,
            "status": self.status
        }
