from src.services.book_service import get_books

def list_books(title=None, author=None, page=1, limit=10):
    books, total = get_books(title=title, author=author, page=page, limit=limit)
    data = [{
        "id": str(book.id),
        "title": book.title,
        "author": book.author,
        "published_year": book.published_year,
        "stock": book.stock,
        "isbn": book.isbn,
        "available": book.stock > 0
    } for book in books]
    pagination = {
        "total": total,
        "page": page,
        "limit": limit,
        "totalPages": (total + limit - 1) // limit
    }
    return {"data": data, "pagination": pagination}