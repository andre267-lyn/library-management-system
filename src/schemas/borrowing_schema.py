from marshmallow import Schema, fields, validate

class BorrowingSchema(Schema):
    book_id = fields.UUID(required=True)
    member_id = fields.UUID(required=True)