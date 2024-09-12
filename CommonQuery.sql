CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;
DROP TABLE Worker;

CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (001, 'ABD', 'Devilliars', 100000, '12-02-20 09.00.00', 'HR'),
	   (002, 'Sachin', 'Tendulkar', 100000, '12-02-20 09.00.00', 'SWE'),
	   (003, 'Virat', 'Kohli', 100000, '12-03-20 09.00.00', 'Admin'),
	   (004, 'Kane', 'Williamson', 100000, '12-05-20 09.00.00', 'Account'),
       (005, 'Joe', 'Root', 100000, '12-09-20 09.00.00', 'HR'),
       (006, 'Dale', 'Steyn', 100000, '12-10-20 09.00.00', 'Account'),
       (007, 'Bradon', 'McCullum', 100000, '12-12-20 09.00.00', 'Admin'),
       (008, 'Mitchell', 'Starc', 100000, '12-10-20 09.00.00', 'Account');

SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES (001, 5000, '16-02-20'),
	   (002, 5000, '16-03-20'),
       (003, 5000, '16-04-20'),
       (001, 5000, '16-05-20'),
       (002, 5000, '16-06-20');

SELECT * FROM Bonus;

CREATE TABLE Title (
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
VALUES (001, 'Manager', '2016-02-20 00.00.00'),
	   (002, 'Executive', '2016-02-20 00.00.00'),
       (008, 'Executive', '2016-02-20 00.00.00'),
       (005, 'Manager', '2016-02-20 00.00.00'),
       (004, 'Asst. Manager', '2016-02-20 00.00.00'),
       (007, 'Executive', '2016-02-20 00.00.00'),
       (006, 'Lead', '2016-02-20 00.00.00'),
       (003, 'Lead', '2016-02-20 00.00.00');
       
SELECT * FROM Title;



-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT distinct DEPARTMENT FROM Worker;
SELECT DEPARTMENT FROM worker GROUP BY DEPARTMENT;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME, 1, 3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME, 'B') FROM Worker WHERE FIRST_NAME = 'Bradon';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(first_name) FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT distinct DEPARTMENT, LENGTH(DEPARTMENT) FROM Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A')  FROM worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT concat(FIRST_NAME, ' _ ', LAST_NAME) AS COMPLETE_NAME FROM Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY FIRST_NAME;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY FIRST_NAME, DEPARTMENT DESC;


-- Q-13. Write an SQL query to print details for Workers with the first name as “Virat” and “Kane” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME IN ('Virat', 'Kane');


-- Q-14. Write an SQL query to print details of workers excluding first names, “Virat” and “Kane” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Virat', 'Kane');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM Worker WHERE DEPARTMENT IN ('Admin');
SELECT * FROM Worker WHERE DEPARTMENT LIKE ('Admin');

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';  -- Because no name end will null so it return NULL
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%t';  

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘n’ and contains six alphabets.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____n';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2020.
SELECT * FROM Worker WHERE MONTH(JOINING_DATE) = 02 AND YEAR(JOINING_DATE) = 2020; 
SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2020 AND MONTH(JOINING_DATE) = 02; 


-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT, count(*) FROM Worker WHERE DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT concat(FIRST_NAME, ' ',LAST_NAME) FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;


-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, count(WORKER_ID) AS no_of_worker FROM Worker GROUP BY DEPARTMENT ORDER BY no_of_worker DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT * FROM Worker AS w INNER JOIN Title AS t ON w.WORKER_ID = t.WORKER_REF_ID WHERE t.WORKER_TITLE = "Manager";
SELECT w.* FROM Worker AS w INNER JOIN Title AS t ON w.WORKER_ID = t.WORKER_REF_ID WHERE t.WORKER_TITLE = "Manager";

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE, count(*) AS count FROM Title GROUP BY WORKER_TITLE HAVING count > 1; 

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM worker WHERE MOD (WORKER_ID, 2) != 0; 
SELECT * FROM Worker WHERE MOD(WORKER_ID, 2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM Worker WHERE MOD(WORKER_ID, 2) = 0; 

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE Worker; 
INSERT INTO worker_clone SELECT * FROM Worker;
SELECT * FROM worker_clone;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT Worker.* FROM Worker INNER JOIN worker_clone USING(WORKER_ID);   -- as data is common

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT Worker.* FROM Worker LEFT JOIN worker_clone USING(WORKER_ID) WHERE worker_clone.WORKER_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT CURDATE();
SELECT NOW();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.  [Corelated]
SELECT SALARY FROM Worker w1 WHERE 4 = (SELECT COUNT(w2.salary) FROM WORKER w2 WHERE w2.SALARY >= w1.SALARY);  -- BECAUSE ALL IS SAME
SELECT * FROM Worker w1 
WHERE 4 = (
SELECT COUNT(w2.salary) 
FROM WORKER w2 
WHERE w2.SALARY >= w1.SALARY
);
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT * FROM Worker w1, Worker w2 WHERE w1.SALARY = w2.SALARY AND w1.WORKER_ID != w2.WORKER_ID;  -- AS ALL HAVE SAME SALARY
SELECT w1.* FROM Worker w1, Worker w2 WHERE w1.SALARY = w2.SALARY AND w1.WORKER_ID != w2.WORKER_ID;  -- AS ALL HAVE SAME SALARY


-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT max(SALARY) FROM Worker
WHERE SALARY NOT IN (SELECT max(SALARY) FROM Worker);  -- as ALL Salary is same

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker ORDER BY Worker_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
	-- Here we do subquery by taking worker id, then we check that id is not in the bonus or not
SELECT Worker_ID FROM Worker WHERE Worker_ID NOT IN (SELECT WORKER_REF_ID FROM Bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS DEPCOUNT FROM WORKER GROUP BY DEPARTMENT HAVING DEPCOUNT < 2;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS DEPCOUNT FROM WORKER GROUP BY DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM WORKER);

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM WORKER);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- Query alisases by TEMP then do INNER JOIN
SELECT w.DEPARTMENT, w.FIRST_NAME, w.SALARY FROM (SELECT MAX(SALARY) AS MAXSAL, DEPARTMENT FROM Worker GROUP BY DEPARTMENT) 
TEMP INNER JOIN Worker w ON TEMP.DEPARTMENT = W.DEPARTMENT AND TEMP.MAXSAL = w.SALARY;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery

SELECT DISTINCT SALARY FROM Worker w1
WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM Worker w2 WHERE w1.SALARY <= w2.SALARY) ORDER BY w1.SALARY DESC;

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.
SELECT DISTINCT SALARY FROM Worker ORDER BY SALARY DESC LIMIT 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM Worker w1
WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM Worker w2 WHERE w1.SALARY >= w2.SALARY) ORDER BY w1.SALARY DESC;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.  [n=6]
SELECT DISTINCT SALARY FROM Worker w1
WHERE 6 >= (SELECT COUNT(DISTINCT SALARY) FROM Worker w2 WHERE w1.SALARY <= w2.SALARY) ORDER BY w1.SALARY DESC;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, SUM(SALARY) AS DEPSAL FROM Worker GROUP BY DEPARTMENT ORDER BY DEPSAL DESC;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);

-- Q-51. Remove all the revened number pairs from given table [like 1,2 <-> 2,1 so remove 2,1] kind of all

USE ORG;
CREATE TABLE Pairs(
	A INT,
    B INT
);

INSERT INTO Pairs VALUES(1,2), (2,4), (2,1), (3,2), (4,2), (5,6), (6,5), (7,8);
SELECT * FROM Pairs;

-- Method 1 JOINS
SELECT * FROM Pairs lt LEFT JOIN Pairs rt ON lt.A = rt.B AND lt.B = rt.A;
SELECT lt.* FROM Pairs lt LEFT JOIN Pairs rt ON lt.A = rt.B AND lt.B = rt.A WHERE rt.A IS NULL OR lt.A < rt.A;  -- jis row me left(lt) row ki value kam hai usko remove kardo

-- METHOD 2: CORELATED SUBQUERY
SELECT * FROM Pairs p1 WHERE NOT EXISTS
(SELECT * FROM Pairs p2 WHERE p1.B = p2.A AND p1.A = p2.B AND p1.A > p2.A);