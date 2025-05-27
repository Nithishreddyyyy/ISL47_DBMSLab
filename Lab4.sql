-- Question 4
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

CREATE TABLE Branch (
  BranchID INT PRIMARY KEY,
  BranchName VARCHAR(50) NOT NULL
);

CREATE TABLE Account (
  AccountID INT PRIMARY KEY,
  AccountType VARCHAR(10) CHECK (AccountType IN ('Savings', 'Current')),
  CustomerID INT,
  BranchID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Transaction (
  TransactionID INT PRIMARY KEY,
  AccountID INT,
  Type VARCHAR(10) CHECK (Type IN ('Deposit', 'Withdrawal')),
  Amount DECIMAL(10,2) CHECK (Amount > 0),
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Inserting Values
INSERT INTO Customer VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Branch VALUES (101, 'Bangalore'), (102, 'Mysore');

INSERT INTO Account VALUES
(1001, 'Savings', 1, 101),
(1002, 'Current', 1, 101),
(1003, 'Savings', 2, 101),
(1004, 'Current', 3, 102);

INSERT INTO Transaction VALUES
(1, 1001, 'Deposit', 5000),
(2, 1002, 'Withdrawal', 2000),
(3, 1001, 'Deposit', 3000),
(4, 1003, 'Deposit', 4000),
(5, 1003, 'Withdrawal', 1000),
(6, 1003, 'Deposit', 1500);


-- Obtain the details of customers who have both Savings and Current Account.
Select C.*
from Customer C
join Account A1 on C.CustomerID = A1.CustomerID
and A1.AccountType = 'Savings'
join Account A2 on C.CustomerID = A2.CustomerID
and A2.AccountType = 'Current';

SELECT C.*
FROM Customer C
WHERE EXISTS (
  SELECT 1 FROM Account A WHERE A.CustomerID = C.CustomerID AND A.AccountType = 'Savings'
)
AND EXISTS (
  SELECT 1 FROM Account A WHERE A.CustomerID = C.CustomerID AND A.AccountType = 'Current'
);

-- Retrieve the details of branches and the number of accounts in each branch.
Select B.BranchID , B.BranchName , Count(A.AccountID) as NumAcc
from Branch B
Left Join Account A on B.BranchID = A.BranchID
group by B.BranchID,B.BranchName;


-- Obtain the details of customers who have performed at least 3 transactions.
select C.*
from Customer C
Join Account A on C.CustomerID = A.CustomerID
join Transaction T on A.AccountID = T.AccountID
Group by C.CustomerID , C.Name
Having count(T.TransactionID) >= 3;

-- List the details of branches where the number of accounts is less than the average number of accounts in all branches.
Select B.BranchID , B.BranchName , Count(A.AccountID) as NumAccounts
from Branch B
Left Join Account A on B.BranchID = A.BranchID
Group by B.BranchID, B.BranchName
Having Count(A.AccountID) <(
	Select Avg(NumAccs) From (
		Select Count(AccountID) as NumAccs
        From Account
        Group by BranchID
    ) as AvgTable
);


