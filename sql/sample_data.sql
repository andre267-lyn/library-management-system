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

-- Insert Sample Data for Borrowings
INSERT INTO borrowings (book_id, member_id, borrow_date, return_date, status) VALUES
((SELECT id FROM books LIMIT 1 OFFSET 0), (SELECT id FROM members LIMIT 1 OFFSET 0), '2024-11-21', '2024-11-28', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 1), (SELECT id FROM members LIMIT 1 OFFSET 1), '2024-11-22', '2024-11-29', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 2), (SELECT id FROM members LIMIT 1 OFFSET 2), '2024-11-23', '2024-11-30', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 3), (SELECT id FROM members LIMIT 1 OFFSET 3), '2024-11-24', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 4), (SELECT id FROM members LIMIT 1 OFFSET 4), '2024-11-25', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 5), (SELECT id FROM members LIMIT 1 OFFSET 5), '2024-11-26', '2024-12-03', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 6), (SELECT id FROM members LIMIT 1 OFFSET 6), '2024-11-27', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 7), (SELECT id FROM members LIMIT 1 OFFSET 7), '2024-11-28', '2024-12-05', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 8), (SELECT id FROM members LIMIT 1 OFFSET 8), '2024-11-29', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 9), (SELECT id FROM members LIMIT 1 OFFSET 9), '2024-11-30', '2024-12-07', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 10), (SELECT id FROM members LIMIT 1 OFFSET 10), '2024-12-01', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 11), (SELECT id FROM members LIMIT 1 OFFSET 11), '2024-12-02', '2024-12-09', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 12), (SELECT id FROM members LIMIT 1 OFFSET 12), '2024-12-03', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 13), (SELECT id FROM members LIMIT 1 OFFSET 13), '2024-12-04', '2024-12-11', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 14), (SELECT id FROM members LIMIT 1 OFFSET 14), '2024-12-05', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 15), (SELECT id FROM members LIMIT 1 OFFSET 15), '2024-12-06', '2024-12-13', 'RETURNED'),
((SELECT id FROM books LIMIT 1 OFFSET 16), (SELECT id FROM members LIMIT 1 OFFSET 16), '2024-12-07', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 17), (SELECT id FROM members LIMIT 1 OFFSET 17), '2024-12-08', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 18), (SELECT id FROM members LIMIT 1 OFFSET 18), '2024-12-09', NULL, 'BORROWED'),
((SELECT id FROM books LIMIT 1 OFFSET 19), (SELECT id FROM members LIMIT 1 OFFSET 19), '2024-12-10', '2024-12-17', 'RETURNED');