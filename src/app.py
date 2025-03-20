from flask import Flask
from src.config.database import init_db
from src.routes.book_routes import book_bp
from src.routes.member_routes import member_bp
from src.routes.borrowing_routes import borrowing_bp
from src.middlewares.error_handler import handle_error

app = Flask(__name__)

# Initialize database
init_db(app)

# Register blueprints
app.register_blueprint(book_bp)
app.register_blueprint(member_bp)
app.register_blueprint(borrowing_bp)

# Register error handlers
handle_error(app)

if __name__ == '__main__':
    app.run(debug=True)