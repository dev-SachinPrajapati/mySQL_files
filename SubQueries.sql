USE sachindb;

-- DB FROM JOINS
SELECT * FROM Employee;
SELECT * FROM Project;

-- 1. Sub Queries
-- WHERE clause same table
-- Employee with age > 25
SELECT * FROM Employee WHERE Age IN(SELECT Age FROM Employee WHERE AGE > 35);


-- WHERE Clause different table
-- emp details working in more than 1 Project.
SELECT * FROM Employee WHERE id IN (SELECT empID FROM Project GROUP BY empID HAVING COUNT(empID) = 1);
SELECT * FROM Employee WHERE id IN (SELECT empID FROM Project GROUP BY empID HAVING COUNT(empID) > 1);


-- SINGLE VALUE SubQuery
-- Emp details having age > avg(age)
SELECT * FROM Employee WHERE Age > (SELECT AVG(Age) FROM Employee);


-- FROM Clause  -- After FROM Keyword statement is Derived Tables
-- SELECT Max age person whose first name contains 'a'
SELECT MAX(Age) FROM (SELECT * FROM Employee WHERE fname like '%a%') AS temp;

-- Corelated subquery 
-- find the 3rd oldest employee
SELECT * FROM Employee;
SELECT * FROM Employee e1 WHERE 3 = (SELECT COUNT(e2.age) FROM Employee e2 WHERE e2.age >= e1.age);



-- 2. VIEWS IN SQL
-- VIEW
SELECT * FROM Employee;

-- Creating a view
CREATE VIEW custom_view AS SELECT fname, age FROM Employee;
CREATE VIEW custom_view1 AS SELECT fname, age, City FROM Employee;

-- VIEWING FROM VIEW
SELECT * FROM custom_view;
SELECT * FROM custom_view1;

-- ALTERING THE VIEW
ALTER VIEW custom_view AS SELECT fname, lname, age FROM Employee;
ALTER VIEW custom_view1 AS SELECT fname, lname, age FROM Employee;
