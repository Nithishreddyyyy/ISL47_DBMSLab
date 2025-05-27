-- Question 3
CREATE TABLE Sailor (
  SailorID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Age INT CHECK (Age > 0)
);

CREATE TABLE Boat (
  BoatID INT PRIMARY KEY,
  BoatName VARCHAR(50) NOT NULL,
  Color VARCHAR(30)
);

CREATE TABLE Reserves (
  SailorID INT,
  BoatID INT,
  Day VARCHAR(10),
  PRIMARY KEY (SailorID, BoatID, Day),
  FOREIGN KEY (SailorID) REFERENCES Sailor(SailorID) ON DELETE CASCADE,
  FOREIGN KEY (BoatID) REFERENCES Boat(BoatID) ON DELETE CASCADE
);

-- Inserting values
INSERT INTO Sailor VALUES (1, 'John', 25), (2, 'Alice', 30), (3, 'Bob', 22);

INSERT INTO Boat VALUES (101, 'Titanic', 'Red'), (102, 'Poseidon', 'Blue'), (103, 'Nautilus', 'Green');

INSERT INTO Reserves VALUES 
(1, 101, 'Monday'),
(1, 102, 'Tuesday'),
(2, 101, 'Monday'),
(2, 103, 'Wednesday'),
(3, 101, 'Friday'),
(3, 102, 'Friday');


-- Obtain the details of the boats reserved by ‘#Sailor_Name’.
SELECT B.*
FROM Boat B
JOIN Reserves R ON B.BoatID = R.BoatID
JOIN Sailor S ON S.SailorID = R.SailorID
WHERE S.Name = 'John';


-- Retrieve the BID of the boats reserved necessarily by all the sailors.
SELECT BoatID
FROM Reserves
GROUP BY BoatID
HAVING COUNT(DISTINCT SailorID) = (SELECT COUNT(*) FROM Sailor);


-- Find the number of boats reserved by each sailor. Display the Sailor_Name along with the number of boats reserved.
Select S.Name , Count(Distinct R.BoatID) as NumBoatsReserved
From Sailor S
Join Reserves R on S.SailorID = R.SailorID
group by S.Name;
