
# library-management-system-using-flask

Create a RESTful API for a library management system using Flask, following the specified project structure.




## Screenshots

![App Screenshot](./image/running%20flask.png)
![App Screenshot](./image/running%20test%20api%20book.png)
![App Screenshot](./image/running%20test%20api%20members.png)
![App Screenshot](./image/running%20test%20api%20borrowing.png)
![App Screenshot](./image/running%20test%20api%20borrowing%20id%20return.png)
![App Screenshot](./image/running%20%20test%20member%20id%20%20borrowing.png)


## Run Locally

Clone the project

```bash
  git clone https://github.com/andre267-lyn/library-management-system-using-flask.git
```

Go to the project directory

```bash
  cd library-management-system-using-flask
```

Create a virtual environment

```bash
  python -m venv venv
```
```bash
  On Mac: source venv/bin/activate
```
```bash
  On Windows: venv\Scripts\activate
```

Start the server

```bash
  npm run start
```
Install dependencies

```bash
  pip install -r requirements.txt
```

Setup the database in postgresql:

```bash
  create database library_db;
```

```bash
  -- Create Books Table
CREATE TABLE books (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INTEGER NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Members Table
CREATE TABLE members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Borrowings Table
CREATE TABLE borrowings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    book_id UUID REFERENCES books(id),
    member_id UUID REFERENCES members(id),
    borrow_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(10) NOT NULL DEFAULT 'BORROWED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

```bash
  -- Insert Sample Data for Books
INSERT INTO books (title, author, published_year, stock, isbn) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 5, '9780743273565'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 3, '9780446310789'),
('1984', 'George Orwell', 1949, 4, '9780451524935'),
('Pride and Prejudice', 'Jane Austen', 1813, 6, '9780141439518'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 3, '9780316769488'),
('The Hobbit', 'J.R.R. Tolkien', 1937, 7, '9780547928227'),
('The Da Vinci Code', 'Dan Brown', 2003, 4, '9780307474278'),
('The Alchemist', 'Paulo Coelho', 1988, 5, '9780062315007'),
('The Little Prince', 'Antoine de Saint-Exupéry', 1943, 8, '9780156012195'),
('Brave New World', 'Aldous Huxley', 1932, 4, '9780060850524'),
('The Lord of the Rings', 'J.R.R. Tolkien', 1954, 6, '9780618640157'),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 1997, 7, '9780590353427'),
('The Chronicles of Narnia', 'C.S. Lewis', 1950, 5, '9780066238501'),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 1967, 3, '9780060883287'),
('The Hunger Games', 'Suzanne Collins', 2008, 6, '9780439023481'),
('The Road', 'Cormac McCarthy', 2006, 4, '9780307387899'),
('The Kite Runner', 'Khaled Hosseini', 2003, 5, '9781594631931'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 2005, 4, '9780307949486'),
('The Book Thief', 'Markus Zusak', 2005, 6, '9780375842207'),
('Life of Pi', 'Yann Martel', 2001, 5, '9780156027328');

-- Insert Sample Data for Members
INSERT INTO members (name, email, phone, address) VALUES
('John Doe', 'john.doe@email.com', '081234567890', '123 Main St, City'),
('Jane Smith', 'jane.smith@email.com', '081234567891', '456 Oak Ave, Town'),
('Robert Johnson', 'robert.j@email.com', '081234567892', '789 Pine Rd, Village'),
('Mary Williams', 'mary.w@email.com', '081234567893', '321 Elm St, Borough'),
('Michael Brown', 'michael.b@email.com', '081234567894', '654 Maple Dr, District'),
('Sarah Davis', 'sarah.d@email.com', '081234567895', '987 Cedar Ln, County'),
('James Wilson', 'james.w@email.com', '081234567896', '147 Birch Ave, State'),
('Emily Taylor', 'emily.t@email.com', '081234567897', '258 Spruce St, Province'),
('David Anderson', 'david.a@email.com', '081234567898', '369 Ash Rd, Territory'),
('Lisa Thomas', 'lisa.t@email.com', '081234567899', '741 Walnut Ct, Region'),
('Kevin Martin', 'kevin.m@email.com', '081234567800', '852 Cherry Ln, Area'),
('Jennifer White', 'jennifer.w@email.com', '081234567801', '963 Palm Ave, Zone'),
('Christopher Lee', 'chris.l@email.com', '081234567802', '159 Beach Rd, Sector'),
('Amanda Clark', 'amanda.c@email.com', '081234567803', '357 Coast St, District'),
('Daniel Martinez', 'daniel.m@email.com', '081234567804', '468 River Dr, County'),
('Michelle Garcia', 'michelle.g@email.com', '081234567805', '789 Lake Ave, State'),
('Andrew Robinson', 'andrew.r@email.com', '081234567806', '951 Ocean Blvd, Province'),
('Patricia Rodriguez', 'patricia.r@email.com', '081234567807', '753 Bay St, Territory'),
('Joseph Hall', 'joseph.h@email.com', '081234567808', '246 Harbor Rd, Region'),
('Nicole King', 'nicole.k@email.com', '081234567809', '135 Port Ave, Area');
```
For the borrowing table, leave it empty for now, as it will later display the response 'BORROWED' (precondition & expected results) or 'RETURNED'. Then, use the following query to check the book ID and member ID for running the API test in Postman or Thunder Client.
```bash
  SELECT id FROM books;
  SELECT id FROM members;
```
    
## Running Tests

To run tests, run the following command

```bash
   cd your project folder file
```
```bash
   set FLASK_APP=app.pyset FLASK_APP=app.py
```
```bash
   flask run
```
## API Reference testing 

```bash
Implement these endpoints with appropriate validation:

1. GET /api/books 
   example = http://127.0.0.1:5000/api/books?title=The Great Gatsby&author=F. Scott Fitzgerald&page=1&limit=10
○ List all books with their current stock
○ Query Parameters:
■ title (string): Filter by title (case-insensitive)

■ author (string): Filter by author (case-insensitive)
■ page (integer, default: 1)
■ limit (integer, default: 10)

Response Format:
{
"data": [{
"id": "uuid",
"title": "string",
"author": "string",
"published_year": "integer",
"stock": "integer",
"isbn": "string",
"available": "boolean"
}],
"pagination": {
"total": "integer",
"page": "integer",
"limit": "integer",
"totalPages": "integer"
}
}
2. POST /api/members
   example : http://127.0.0.1:5000/api/members
○ Register new member
Request Body:
{
"name": "string",
"email": "string",
"phone": "string",
"address": "string"
}
○ Validations:
■ Email must be unique and valid format
■ Phone must be valid format
■ All fields are required

3. POST /api/borrowings
   example : http://127.0.0.1:5000/api/borrowings
○ Create new book borrowing
Request Body:
{
"book_id": "uuid",
"member_id": "uuid"
}
○ Business Rules:
■ Check book stock (must be > 0)
■ Update book stock (-1)
■ Member cannot borrow more than 3 books
■ Record borrowing date as current date

4. PUT /api/borrowings/:id/return
   example : http://127.0.0.1:5000/api/borrowings/4c2cf6db-cc7f-4adc-8edc-0070ea5cb8ff/return
○ Process book return
○ Path Parameters:
■ id: Borrowing ID
○ Updates:
■ Change status to 'RETURNED'
■ Update book stock (+1)
■ Set return_date to current date

5. GET /api/members/:id/borrowings
   example : http://127.0.0.1:5000/api/members/a7ebd39f-cad1-4863-a81d-2412f7160a92/borrowings
○ Get member's borrowing history
○ Path Parameters:
■ id: Member ID
○ Query Parameters:
■ status: Filter by status (BORROWED/RETURNED)
■ page (integer, default: 1)
■ limit (integer, default: 10)
○ Response includes book details
```

## Tech Stack

**Flask:** for as backend framework 

**PostgreSQL:** database

**SQLAlchemy:**  for as Object-Relational Mapping(ORM) database relasional for OOP

**Thunder Client/Postman:** for testing API

**Pycharm/VSCode:** for as IDE