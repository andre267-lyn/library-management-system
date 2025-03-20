from marshmallow import Schema, fields, validate

class BookSchema(Schema):
    title = fields.Str(required=True, validate=validate.Length(min=1))
    author = fields.Str(required=True, validate=validate.Length(min=1))
    published_year = fields.Int(required=True, validate=validate.Range(min=1))
    stock = fields.Int(required=True, validate=validate.Range(min=0))
    isbn = fields.Str(required=True, validate=validate.Length(equal=13))