CREATE DATABASE db_library_mang

USE db_library_mang

/*** CREATE TABLES ***/

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	BranchName VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL
)
SELECT * FROM library_branch;

CREATE TABLE publisher (
	PublisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(15) NOT NULL
)
SELECT * FROM publisher;

CREATE TABLE books (
	BooksID INT PRIMARY KEY IDENTITY(100,1) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(30) FOREIGN KEY REFERENCES publisher(PublisherName)
)
SELECT * FROM books;

CREATE TABLE book_authors(
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	AuthorName VARCHAR(70) NOT NULL
)
SELECT * FROM book_authors;

CREATE TABLE book_copies(
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	BranchID INT FOREIGN KEY REFERENCES library_branch(BranchID),
	Number_Of_Copies INT NULL
)
SELECT * FROM book_copies;

CREATE TABLE borrower(
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(15) NOT NULL
)
SELECT * FROM borrower;

CREATE TABLE book_loans (
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	BranchID INT FOREIGN KEY REFERENCES library_branch(BranchID),
	CardNo INT FOREIGN KEY REFERENCES borrower(CardNo) NULL,
	DateOut DATE NULL,
	DateDue DATE NULL
)

SELECT * FROM book_loans;

/*** INSERT DATA ***/

INSERT INTO library_branch 
	(BranchName, Address)
	VALUES
	('Central', '123 Main Street, Salem, MA'), 
	('Sharpstown', '2 Cabot Street, Bverly, MA'), 
	('Wings', 'Nest Street, Middleton, MA'),
	('Waterspout', '23 Ocean Drive, Gloucester, MA');

SELECT * FROM library_branch;

INSERT INTO publisher 
	(PublisherName, Address, Phone)
	VALUES
	('Pigeons Publishing', '1 Main Street, Dallas, TX', '234-456-6789'),
	('Wiley', '1 Central Street, Malden MA', '617-203-4567'),
	('Discovery', '23 Old Town Road, Nashville, TN', '456-123-1234'),
	('Triumph', '43 Cabot Street, San Jose, CA', '423-123-3456');

SELECT * FROM publisher;

INSERT INTO books 
	(Title, PublisherName)
	VALUES
	('Harry Potter', 'Wiley'),
	('Badguys', 'Triumph'),
	('Capt Underpants', 'Pigeons Publishing'),
	('Dogman', 'Wiley'),
	('Piggie & Elephant', 'Discovery'),
	('Harry Potter', 'Triumph'),
	('A Game of Thrones', 'Pigeons Publishing'),
	('Angry Birds', 'Wiley'),
	('The Matrix', 'Discovery'),
	('The Alchemist', 'Triumph'),
	('Dune', 'Pigeons Publishing'),
	('Animal Farm', 'Wiley'),
	('1984 ', 'Wiley'),
	('IT', 'Wiley'), 
	('Pet Cematary', 'Pigeons Publishing'), 
	('Goodnight Moon', 'Wiley'),
	('Gone Girl', 'Discovery'),
	('Invisble Man', 'Triumph'),
	('The Right Stuff', 'Pigeons Publishing'),
	('The Road', 'Wiley');

INSERT INTO books 
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Wiley');


SELECT * FROM books;

INSERT INTO book_authors 
	(BooksID, AuthorName)
	VALUES
	(100, 'J.K. Rowling'),
	(101, 'Aaron Blabley'),
	(102, 'Aaron Blabley'),
	(103, 'Aaron Blabley'),
	(104, 'Mo Williams'),
	(105, 'J.K. Rowling'),
	(106, 'George Martin'),
	(107, 'Rovey'),
	(108, 'Robert Perry'),
	(109, 'Paulo Coelhor'),
	(110, 'Brian Herbert'),
	(111, 'George Orwell'),
	(112, 'George Orwell'),
	(113, 'Stephen King'),
	(114, 'Stephen King'),
	(115, 'Margaret Wise Brown'),
	(116, 'Gillian Schieber Flynn'),
	(117, 'Ralph Ellison'),
	(118, 'Tom Wolfe'),
	(119, 'Cormac McCarthy');

SELECT * FROM book_authors;

INSERT INTO book_copies 
	(BooksID, BranchID, Number_Of_Copies)
	VALUES

	(100, 1, 5),
	(100, 2, 5),
	(100, 3, 5),
	(100, 4, 5), /** 1st book **/
	(101, 1, 5),
	(101, 2, 5),
	(101, 3, 5),
	(101, 4, 5), /** 2nd book **/
	(102, 1, 5),
	(102, 2, 5),
	(102, 3, 5),
	(102, 4, 5), /** 3rd book **/
	(103, 1, 5),
	(103, 2, 5),
	(103, 3, 5),
	(103, 4, 5), /** 4th book **/
	(104, 1, 5),
	(104, 2, 5),
	(104, 3, 5),
	(104, 4, 5), /** 5th book **/
	(105, 1, 5),
	(105, 2, 5),
	(105, 3, 5),
	(105, 4, 5), /** 6th book **/
	(106, 1, 5),
	(106, 2, 5),
	(106, 3, 5),
	(106, 4, 5), /** 7th book **/
	(110, 1, 5),
	(110, 2, 5),
	(110, 3, 5),
	(110, 4, 5),  /** 8th book **/
	(111, 1, 5),
	(111, 2, 5),
	(111, 3, 5),
	(111, 4, 5), /** 9th book **/
	(113, 1, 5),
	(113, 2, 5),
	(113, 3, 5),
	(113, 4, 5), /** 10th book **/
	(114, 1, 5),
	(114, 2, 5),
	(114, 3, 5),
	(114, 4, 5), /** 11th book **/
	(115, 1, 5),
	(115, 2, 5),
	(115, 3, 5),
	(115, 4, 5);  /** 12th book **/

INSERT INTO book_copies 
	(BooksID, BranchID, Number_Of_Copies)
	VALUES
	(120, 1, 5),
	(120, 2, 5),
	(120, 3, 5),
	(120, 4, 5);
	

SELECT * FROM book_copies;

INSERT INTO borrower 
	(CardNo, Name, Address, Phone)
	VALUES
	(1001, 'Mike Hobbs', '15 Goodwin Road, Gloucester, MA', '978-283-1212'),
	(1002, 'Andrain Smith', '24 Half Street., Danvers, MA', '617-555-1234'),
	(1003, 'Nico Heroy', '2 Mohawk Circle, Georgetown, MA', '978-554-5433'),
	(1004, 'Todd Fertil', '345 Broadway Street, Lynn, MA', '978-420-1269'),
	(1005, 'Amanda Ribeiro', '1 Vine Street, Gloucester, MA', '978-290-1516'),
	(1006, 'Mike Novello', '29 Fatkid Street, Beverly, MA', '978-209-3456'),
	(1007, 'Nancy Great', '23 Washington Street, Boston, MA', '512-555-6789'),
	(1008, 'Darell Seppala', '23 Vine Road, Gloucester, MA', '978-456-6789'),
	(1009, 'Ronald Condon', '45 fort Sqaure, Salem, mA', '978-234-5643');

SELECT * FROM borrower;

INSERT INTO book_loans (BooksID, BranchID, CardNo, DateOut, DateDue)
VALUES
	/*** Books to Nancy ***/
	(100, 1, 1007, '2019-06-02', '2020-07-02'),
	(101, 1, 1007, '2019-06-02', '2020-07-02'),
	(102, 1, 1007, '2019-06-02', '2020-07-02'),
	(103, 1, 1007, '2019-06-02', '2020-07-02'),
	(104, 1, 1007, '2019-06-02', '2020-07-02'),
	(105, 1, 1007, '2019-06-02', '2020-07-02'), 
	(106, 1, 1007, '2019-06-02', '2020-07-02'),
	(107, 1, 1007, '2019-06-02', '2020-07-02'), 

	/*** Books to Ronald ***/
	(101, 2, 1009, '2019-08-11', '2020-08-11'),
	(102, 2, 1009, '2019-08-11', '2020-08-11'),
	(103, 2, 1009, '2019-08-11', '2020-08-11'),
	(108, 2, 1009, '2019-08-11', '2020-08-11'),
	(109, 2, 1009, '2019-08-11', '2020-08-11'),
	(110, 2, 1009, '2019-08-11', '2020-08-11'),
	(111, 2, 1009, '2019-08-11', '2020-08-11'), 
	(112, 2, 1009, '2019-08-11', '2020-08-11'), 

	/*** Books to Todd ***/
	(101, 3, 1004, '2018-11-16', '2019-01-11'),
	(104, 3, 1004, '2018-11-16', '2019-01-11'),
	(105, 3, 1004, '2018-11-16', '2019-01-11'),
	(106, 3, 1004, '2018-11-16', '2019-01-11'),
	(107, 3, 1004, '2018-11-16', '2019-01-11'),
	(109, 3, 1004, '2018-11-16', '2019-01-11'), 
	(113, 3, 1004, '2018-11-16', '2019-01-11'),
	(116, 3, 1004, '2018-11-16', '2019-01-11'),

	/*** Books to Mike ***/
	(101, 4, 1001, '2019-09-20', '2020-01-20'),
	(105, 4, 1001, '2019-09-20', '2020-01-20'),
	(106, 4, 1001, '2019-09-20', '2020-01-20'),
	(109, 4, 1001, '2019-09-20', '2020-01-20'),
	(115, 4, 1001, '2019-09-20', '2020-01-20'),
	(116, 4, 1001, '2019-09-20', '2020-01-20'),
	(117, 4, 1001, '2019-09-20', '2020-01-20'),
	(118, 4, 1001, '2019-09-20', '2020-01-20'), 

	/*** Books to Amanda ***/
	(111, 1, 1005, '2019-11-19', '2020-01-20'),
	(113, 1, 1005, '2019-11-19', '2020-01-20'),
	(114, 1, 1005, '2019-11-19', '2020-01-20'),
	(115, 1, 1005, '2019-11-19', '2020-01-20'),
	(116, 1, 1005, '2019-11-19', '2020-01-20'),
	(117, 1, 1005, '2019-11-19', '2020-01-20'),
	(118, 1, 1005, '2019-11-19', '2020-01-20'),
	(119, 1, 1005, '2019-11-19', '2020-01-20'), 

	/*** Books to Mike Novello ***/
	(102, 1, 1002, '2020-01-20', '2020-8-20'),
	(103, 1, 1002, '2020-01-20', '2020-8-20'),
	(104, 1, 1002, '2020-01-20', '2020-8-20'),
	(105, 1, 1002, '2020-01-20', '2020-8-20');

SELECT * FROM book_loans;

GO

/*** How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown" ***/
CREATE PROCEDURE dbo.uspselectLostTribeFromSharpstown
AS
SELECT book_copies.Number_Of_Copies, books.Title, library_branch.BranchName
FROM books
JOIN book_copies ON book_copies.BooksID = books.BooksID
JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
WHERE books.Title = 'The Lost Tribe'
AND library_branch.BranchName = 'Sharpstown'
GO

EXEC [dbo].[uspselectLostTribeFromSharpstown];
GO

/*** How many copies of the book titled "The Lost Tribe" are owned by each library branch? ***/
CREATE PROCEDURE dbo.uspselectLostTribeFromAllBranches @branchName NVARCHAR(20) = NULL
AS
SELECT book_copies.Number_Of_Copies, books.Title, library_branch.BranchName
FROM books
JOIN book_copies ON book_copies.BooksID = books.BooksID
JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
WHERE books.Title = 'The Lost Tribe'
GO

EXEC [dbo].[uspselectLostTribeFromAllBranches];

GO
/*** Retrieve the names of all borrowers who do not have any books checked out. ***/
CREATE PROCEDURE dbo.uspselectBorrowersNoBooks
AS
SELECT borrower.Name
FROM borrower
FULL OUTER JOIN book_loans ON book_loans.CardNo = borrower.CardNo
WHERE book_loans.CardNo IS NULL
GO

EXEC [dbo].[uspselectBorrowersNoBooks];
GO

/*** For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
retrieve the book title, the borrower's name, and the borrower's address. ***/
CREATE PROCEDURE dbo.uspSelectBorrowerDataSharpstown
AS
SELECT library_branch.BranchName, book_loans.DateDue, books.Title, borrower.Name, borrower.Address
FROM library_branch
JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
JOIN books ON books.BooksID = book_loans.BooksID
JOIN borrower ON borrower.CardNo = book_loans.CardNo
WHERE book_loans.DateDue = '2020-08-11'
AND library_branch.BranchName = 'Sharpstown'
GO

EXEC [dbo].[uspSelectBorrowerDataSharpstown]
GO

/*** For each library branch, retrieve the branch name and
the total number of books loaned out from that branch. ***/

CREATE PROCEDURE dbo.uspSelectLoanedBooks
AS
SELECT COUNT(*) AS 'Books Loaned', library_branch.BranchName
FROM library_branch
JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
WHERE book_loans.DateDue = (DateDue)
GROUP BY library_branch.BranchName
GO

EXEC [dbo].[uspSelectLoanedBooks]
GO

/*** Retrieve the names, addresses, and the number of books checked out for all borrowers
who have more than five books checked out. ***/
CREATE PROCEDURE dbo.uspSelectBorrowersBeyond5
AS
SELECT COUNT(book_loans.BooksID) AS 'BooksLoaned', borrower.Name, borrower.Address
FROM borrower
JOIN book_loans ON book_loans.CardNo = borrower.CardNo
GROUP BY borrower.Name, borrower.Address
HAVING COUNT(*)>5
GO

EXEC [dbo].[uspSelectBorrowersBeyond5]
GO

/*** For each book authored (or co-authored) by "Stephen King", retrieve the title and
the number of copies owned by the library branch whose name is "Central". ***/
CREATE PROCEDURE dbo.uspStephenKingCentral
AS
SELECT books.Title, book_authors.AuthorName, book_copies.Number_Of_Copies, library_branch.BranchName
FROM books
JOIN book_copies ON book_copies.BooksID = books.BooksID
JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
JOIN book_authors ON book_authors.BooksID = books.BooksID
WHERE book_authors.AuthorName = 'Stephen King'
AND library_branch.BranchName = 'Central'
GO

EXEC [dbo].[uspStephenKingCentral]
GO