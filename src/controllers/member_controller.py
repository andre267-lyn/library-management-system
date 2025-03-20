from src.services.member_service import create_member

def register_member(name, email, phone, address):
    member = create_member(name=name, email=email, phone=phone, address=address)
    return {
        "id": str(member.id),
        "name": member.name,
        "email": member.email,
        "phone": member.phone,
        "address": member.address
    }