from marshmallow import Schema, fields, validate
import re

class MemberSchema(Schema):
    name = fields.Str(required=True, validate=validate.Length(min=1))
    email = fields.Email(required=True)
    phone = fields.Str(required=True, validate=lambda x: re.match(r"^\d{10,15}$", x))
    address = fields.Str(required=True, validate=validate.Length(min=1))