CREATE TABLE BOOK (
    ISBN VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10)
);

CREATE TABLE BORROWS (
    StudentID INT,
    ISBN VARCHAR(10),
    BorrowDate DATE,
    PRIMARY KEY (StudentID, ISBN, BorrowDate),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN)
);


-- Books
INSERT INTO BOOK VALUES ('123', 'Database', 'C.J.Date', 'Pearson');
INSERT INTO BOOK VALUES ('124', 'Networks', 'Tanenbaum', 'PHI');
INSERT INTO BOOK VALUES ('125', 'Operating Systems', 'Silberschatz', 'Wiley');

-- Students
INSERT INTO STUDENT VALUES (1, 'Alice', 'Female');
INSERT INTO STUDENT VALUES (2, 'Bob', 'Male');
INSERT INTO STUDENT VALUES (3, 'Carol', 'Female');

-- Borrows
INSERT INTO BORROWS VALUES (1, '123', '2025-06-01');
INSERT INTO BORROWS VALUES (1, '124', '2025-06-01');
INSERT INTO BORROWS VALUES (2, '124', '2025-06-02');
INSERT INTO BORROWS VALUES (3, '123', '2025-06-03');

-- i. Obtain the names of the students who have borrowed either book bearing ISBN ‘123’ or ISBN ‘124’.
SELECT DISTINCT S.Name
FROM STUDENT S
JOIN BORROWS B ON S.StudentID = B.StudentID
WHERE B.ISBN IN ('123', '124');


-- ii. Obtain the names of female students who have borrowed “Database” books.
SELECT DISTINCT S.Name
FROM STUDENT S
JOIN BORROWS B ON S.StudentID = B.StudentID
JOIN BOOK K ON B.ISBN = K.ISBN
WHERE S.Gender = 'Female' AND K.Title = 'Database';

-- iii. Find the number of books borrowed by each student. Display the student details along with the number of books.
SELECT S.StudentID, S.Name, S.Gender, COUNT(B.ISBN) AS NumberOfBooks
FROM STUDENT S
LEFT JOIN BORROWS B ON S.StudentID = B.StudentID
GROUP BY S.StudentID, S.Name, S.Gender;
