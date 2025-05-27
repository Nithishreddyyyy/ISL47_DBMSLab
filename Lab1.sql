-- Question 1
CREATE TABLE E1 (
    SSN INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptName VARCHAR(50)
);

CREATE TABLE P1 (
    PNO INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    ProjectArea VARCHAR(50)
);

CREATE TABLE W1 (
    SSN INT,
    PNO INT,
    Hours INT,
    PRIMARY KEY (SSN, PNO),
    FOREIGN KEY (SSN) REFERENCES E1(SSN),
    FOREIGN KEY (PNO) REFERENCES P1(PNO)
);

-- Obtain the details of employees assigned to “Database” project.
select E1.* 
from E1 
join W1 on E1.SSN = W1.SSN
join P1 on P1.PNO = W1.PNO
Where upper(P1.projectArea) = 'DATABASE';

-- Find the number of employees working in each department with department details.
select E1.DName,E1.dept_no,count(E1.SSN) as Employee_Count
from E1
group by E1.DName , E1.dept_no;

-- Update the Project details of Employee bearing SSN = #SSN to ProjectNo = #Project_No and display the same.
update W1
set PNo = 203
where SSN = 102;