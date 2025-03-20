import uuid
from src.models.borrowing import Borrowing
from src.models.book import Book
from src.models.member import Member
from src.config.database import db
from sqlalchemy.exc import IntegrityError
from sqlalchemy import func

def create_borrowing(book_id, member_id):
    try:
        book_id = uuid.UUID(book_id, version=4)
        member_id = uuid.UUID(member_id, version=4)
    except ValueError:
        raise ValueError("ID buku dan anggota harus dalam format UUID yang valid")

    book = Book.query.get(str(book_id))
    member = Member.query.get(str(member_id))

    if not book:
        raise ValueError("Buku tidak ditemukan")
    if not member:
        raise ValueError("Anggota tidak ditemukan")

    if book.stock <= 0:
        raise ValueError("Buku tidak tersedia untuk dipinjam")

    borrowed_count = Borrowing.query.filter_by(member_id=str(member_id), status='BORROWED').count()
    if borrowed_count >= 3:
        raise ValueError("Anggota tidak dapat meminjam lebih dari 3 buku")

    new_borrowing = Borrowing(
        book_id=str(book_id),
        member_id=str(member_id),
        borrow_date=func.current_date(),
        status='BORROWED'
    )

    book.stock -= 1

    try:
        db.session.add(new_borrowing)
        db.session.commit()
        return new_borrowing
    except IntegrityError:
        db.session.rollback()
        raise ValueError("Terjadi kesalahan saat menyimpan peminjaman")

def return_borrowing(borrowing_id):
    try:
        borrowing_id = uuid.UUID(borrowing_id, version=4)
    except ValueError:
        raise ValueError("ID peminjaman harus dalam format UUID yang valid")

    borrowing = Borrowing.query.get(str(borrowing_id))
    if not borrowing:
        raise ValueError("Peminjaman tidak ditemukan")

    if borrowing.status != 'BORROWED':
        raise ValueError("Buku sudah dikembalikan sebelumnya")

    borrowing.status = 'RETURNED'
    borrowing.return_date = func.current_date()

    book = Book.query.get(borrowing.book_id)
    if book:
        book.stock += 1

    try:
        db.session.commit()
        return borrowing
    except IntegrityError:
        db.session.rollback()
        raise ValueError("Terjadi kesalahan saat mengembalikan buku")
