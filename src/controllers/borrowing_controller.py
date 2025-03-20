from src.services.borrowing_service import create_borrowing as create_borrowing_service
from src.services.borrowing_service import return_borrowing as return_borrowing_service

def create_borrowing(book_id, member_id):
    try:
        borrowing = create_borrowing_service(book_id=book_id, member_id=member_id)
        return {
            "id": str(borrowing.id),
            "book_id": str(borrowing.book_id),
            "member_id": str(borrowing.member_id),
            "borrow_date": borrowing.borrow_date.isoformat(),
            "status": borrowing.status
        }
    except Exception as e:
        raise ValueError(str(e))

def return_borrowing(borrowing_id):
    try:
        borrowing = return_borrowing_service(borrowing_id=borrowing_id)
        return {
            "id": str(borrowing.id),
            "book_id": str(borrowing.book_id),
            "member_id": str(borrowing.member_id),
            "borrow_date": borrowing.borrow_date.isoformat(),
            "return_date": borrowing.return_date.isoformat() if borrowing.return_date else None,
            "status": borrowing.status
        }
    except Exception as e:
        raise ValueError(str(e))
