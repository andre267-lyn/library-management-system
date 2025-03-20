from flask import Blueprint, request, jsonify
from src.controllers.member_controller import register_member

member_bp = Blueprint('member_bp', __name__)

@member_bp.route('/api/members', methods=['POST'])
def post_member():
    data = request.get_json()
    try:
        member = register_member(name=data['name'], email=data['email'], phone=data['phone'], address=data['address'])
        return jsonify(member), 201
    except ValueError as e:
        return jsonify({"error": str(e)}), 400