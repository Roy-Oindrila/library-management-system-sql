-- Library Management System SQL Project


-- 1. Create Tables
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    JoinDate DATE NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    YearPublished INT,
    CopiesAvailable INT DEFAULT 1
);

CREATE TABLE BorrowRecords (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 2. Insert Sample Data
INSERT INTO Members (Name, Email, Phone, Address, JoinDate) VALUES
('Alice Johnson', 'alice@example.com', '1234567890', '123 Main St', '2025-01-10'),
('Bob Smith', 'bob@example.com', '9876543210', '456 Oak St', '2025-02-15');

INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 3),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 2),
('A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 1);

INSERT INTO BorrowRecords (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2025-08-01', NULL),
(2, 2, '2025-08-05', '2025-08-12');

-- 3. Example Queries

-- Get all borrowed books with member names
SELECT br.BorrowID, m.Name AS MemberName, b.Title AS BookTitle, br.BorrowDate, br.ReturnDate
FROM BorrowRecords br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID;

-- List all available books
SELECT Title, Author, Genre, YearPublished, CopiesAvailable
FROM Books
WHERE CopiesAvailable > 0;

-- Show all tables
SHOW TABLES;

-- See structure of 'Books' table
DESC Books;

-- Count total books
SELECT COUNT(*) AS total_books FROM Books;

-- Join members with their borrowed books
SELECT m.Name AS MemberName, b.Title AS BookTitle, br.BorrowDate
FROM Members m
JOIN BorrowRecords br ON m.MemberID = br.MemberID
JOIN Books b ON br.BookID = b.BookID;
-- Show all tables
SHOW TABLES;

-- View all members
SELECT * FROM Members;

-- View all books
SELECT * FROM Books;

-- Borrowed books with member names
SELECT m.Name, b.Title, br.BorrowDate
FROM Members m
JOIN BorrowRecords br ON m.MemberID = br.MemberID
JOIN Books b ON br.BookID = b.BookID;
