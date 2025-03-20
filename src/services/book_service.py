from src.models.book import Book
from src.config.database import db

def get_books(title=None, author=None, page=1, limit=10):
    query = Book.query
    if title:
        query = query.filter(Book.title.ilike(f'%{title}%'))
    if author:
        query = query.filter(Book.author.ilike(f'%{author}%'))
    total = query.count()
    books = query.offset((page - 1) * limit).limit(limit).all()
    return books, total