from flask import Blueprint, request, jsonify
from src.controllers.book_controller import list_books

book_bp = Blueprint('book_bp', __name__)

@book_bp.route('/api/books', methods=['GET'])
def get_books():
    title = request.args.get('title')
    author = request.args.get('author')
    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 10))
    try:
        result = list_books(title=title, author=author, page=page, limit=limit)
        return jsonify(result), 200
    except ValueError as e:
        return jsonify({"error": str(e)}), 400

