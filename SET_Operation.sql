USE sachindb;

-- Table for Department 1
CREATE TABLE Department1 (
    empid INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50)
);

-- Inserting 5 values into Department 1
INSERT INTO Department1 (empid, name, role) VALUES
(1, 'Alice', 'Manager'),
(2, 'Bob', 'Developer'),
(3, 'Charlie', 'Designer'),
(4, 'David', 'Tester'),
(5, 'Eve', 'Analyst');


-- Table for Department 2
CREATE TABLE Department2 (
    empid INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50)
);

-- Inserting 3 values into Department 2
INSERT INTO Department2 (empid, name, role) VALUES
(3, 'Charlie', 'Designer'),
(6, 'Sarah', 'HR'),
(7, 'Tom', 'Lead Engineer');


-- set operation
-- List out all the employee in the company. [UNION]
SELECT * FROM Department1
UNION
SELECT * FROM Department2;

-- List out all employees in all departments who work as Designer
SELECT * FROM Department1 WHERE role = 'Designer'
UNION
SELECT * FROM Department2 WHERE role = 'Designer';

-- List out all the employees who work in all the departments. [Intersect]
SELECT * FROM Department1 INNER JOIN Department2 USING(empid);
SELECT Department1.* FROM Department1 INNER JOIN Department2 USING(empid);


-- List out all the employees working in dept1 but not in the dept2. [MINUS]
SELECT Department1.* FROM Department1 LEFT JOIN Department2 USING(empid) WHERE Department2.empid IS NULL;

