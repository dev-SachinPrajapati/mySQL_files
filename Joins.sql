-- Table Employee

USE sachindb;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(15),
    City VARCHAR(50)
);

INSERT INTO Employee (id, fname, lname, Age, emailID, PhoneNo, City)
VALUES 
(1, 'John', 'Doe', 35, 'john.doe@example.com', '1234567890', 'New York'),
(2, 'Jane', 'Smith', 29, 'jane.smith@example.com', '0987654321', 'Los Angeles'),
(3, 'Robert', 'Brown', 42, 'robert.brown@example.com', '1111111111', 'Chicago'),
(4, 'Emily', 'Davis', 38, 'emily.davis@example.com', '2222222222', 'San Francisco'),
(5, 'Michael', 'Clark', 31, 'michael.clark@example.com', '3333333333', 'Houston');

SELECT * FROM Employee;

-- Table Client
CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(15),
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);

SELECT * FROM Client;

INSERT INTO Client (id, first_name, last_name, age, emailID, PhoneNo, City, empID)
VALUES 
(1, 'Alice', 'Johnson', 45, 'alice.johnson@example.com', '4444444444', 'Boston', 1),
(2, 'Brian', 'Williams', 39, 'brian.williams@example.com', '5555555555', 'Denver', 2),
(3, 'Catherine', 'Jones', 52, 'catherine.jones@example.com', '6666666666', 'Seattle', 3),
(4, 'David', 'Garcia', 33, 'david.garcia@example.com', '7777777777', 'Miami', 4),
(5, 'Erica', 'Martinez', 27, 'erica.martinez@example.com', '8888888888', 'Phoenix', 5);


-- Table Project
CREATE TABLE Project (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    startdate DATE,
    empID INT,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id),
    FOREIGN KEY (clientID) REFERENCES Client(id)
);

INSERT INTO Project (id, name, startdate, empID, clientID)
VALUES 
(1, 'Project A', '2024-01-01', 1, 1),
(2, 'Project B', '2024-02-01', 2, 2),
(3, 'Project C', '2024-03-01', 3, 3),
(4, 'Project D', '2024-04-01', 4, 4),
(5, 'Project E', '2024-05-01', 5, 5);

SELECT * FROM Project;


-- 1. INNER JOIN
-- Enlist all the employee ID's, name along with the project allocated to them
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee as e INNER JOIN Project as p ON e.id = p.empID;
SELECT * FROM Employee as e INNER JOIN Project as p ON e.id = p.empID; -- both will work
 
 -- Fetch out all the employee ID's and their contact detail who have been working
 -- From Jaipur with the Clients name working in New York
SELECT e.id, e.emailID, e.PhoneNo, c.first_name, c.last_name FROM Employee as e 
INNER JOIN Client AS c ON e.id = c.empID WHERE e.City= 'New York' AND c.City = 'Boston';
 
 
-- LEFT JOIN
-- Fetch Out each project allocated to each employee
SELECT * FROM Employee as e LEFT JOIN Project as p ON e.id = p.empID;
 

-- RIGHT JOIN
-- List out all the project along with the employee's name and their respective allocated email ID
SELECT p.id, p.name, e.fname, e.lname, emailID FROM Employee as e RIGHT JOIN Project as p ON e.id = p.empID;


-- CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.id, p.name FROM Employee as e CROSS JOIN Project as p;


-- Doing JOIN without using JOIN Keyword
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee as e, Project as p WHERE e.id = p.empID;