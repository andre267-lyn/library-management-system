from flask import Blueprint, request, jsonify
from src.controllers.borrowing_controller import create_borrowing, return_borrowing
from src.models.member import Member
from src.models.borrowing import Borrowing
from src.config.database import db

borrowing_bp = Blueprint('borrowing_bp', __name__)

@borrowing_bp.route('/api/borrowings', methods=['POST'])
def post_borrowing():
    data = request.get_json()

    try:
        borrowing = create_borrowing(book_id=data['book_id'], member_id=data['member_id'])
        return jsonify(borrowing), 201
    except ValueError as e:
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        return jsonify({"error": "Terjadi kesalahan server", "message": str(e)}), 500

@borrowing_bp.route('/api/borrowings/<uuid:borrowing_id>/return', methods=['PUT'])
def put_return_borrowing(borrowing_id):
    try:
        borrowing = return_borrowing(borrowing_id=str(borrowing_id))
        return jsonify(borrowing), 200
    except ValueError as e:
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        return jsonify({"error": "Terjadi kesalahan server", "message": str(e)}), 500

@borrowing_bp.route('/api/members/<uuid:member_id>/borrowings', methods=['GET'])
def get_member_borrowings(member_id):
    member = Member.query.get(str(member_id))
    if not member:
        return jsonify({"error": "Anggota tidak ditemukan"}), 404

    status = request.args.get('status')
    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 10))

    query = Borrowing.query.filter_by(member_id=str(member_id))

    if status:
        query = query.filter_by(status=status.upper())

    total = query.count()
    borrowings = query.offset((page - 1) * limit).limit(limit).all()

    data = [{
        "id": str(borrowing.id),
        "book_id": str(borrowing.book_id),
        "member_id": str(borrowing.member_id),
        "borrow_date": borrowing.borrow_date.isoformat(),
        "return_date": borrowing.return_date.isoformat() if borrowing.return_date else None,
        "status": borrowing.status
    } for borrowing in borrowings]

    return jsonify({
        "data": data,
        "pagination": {
            "total": total,
            "page": page,
            "limit": limit,
            "totalPages": (total + limit - 1) // limit
        }
    }), 200
