-- 1. SELECT COMMAND 
SELECT SALARY FROM Worker;
SELECT 44 + 11;
SELECT now();
SELECT ucase("sachin"); 
SELECT lcase("SACHIN"); 

-- 2. WHERE
SELECT * FROM Worker WHERE Salary > 50000; 
SELECT * FROM Worker WHERE DEPARTMENT = 'HR'; 

-- 3.  BETWEEN
SELECT * FROM Worker WHERE Salary BETWEEN 50000 AND 70000;  

-- 4. IN
SELECT * FROM Worker WHERE DEPARTMENT =  'HR' OR DEPARTMENT ='Marketing';
-- TO REDUCE OR WE USE IN
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Marketing');

-- 5. AND / OR / NOT
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Marketing');
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Marketing') AND SALARY > 60000;
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Marketing') OR SALARY > 60000;


-- 6. IS NULL
SELECT * FROM Worker WHERE DEPARTMENT IS NULL;

-- 7. PATTERN SEARCHING / WILDCARD ('%', '_')
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i_';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i_';

-- 8. ORDER BY 
SELECT * FROM Worker ORDER BY SALARY;  -- Increasing Order
SELECT * FROM Worker ORDER BY SALARY DESC;  -- Decreasing Order

-- 9. DISTINCT
SELECT DISTINCT DEPARTMENT from Worker;

-- 10. GROUP BY
SELECT DEPARTMENT from Worker GROUP BY DEPARTMENT;   -- No Aggregation 

SELECT DEPARTMENT, COUNT(*) from Worker GROUP BY DEPARTMENT;   -- with *
SELECT DEPARTMENT, COUNT(DEPARTMENT) from Worker GROUP BY DEPARTMENT;  -- with name of attributes

-- Avg Salary per Dept
SELECT DEPARTMENT, AVG(SALARY) from Worker GROUP BY DEPARTMENT;   

-- MIN and MAX
SELECT DEPARTMENT, MIN(SALARY) from Worker GROUP BY DEPARTMENT; 
SELECT DEPARTMENT, MAX(SALARY) from Worker GROUP BY DEPARTMENT; 

-- SUM
SELECT DEPARTMENT, SUM(SALARY) from Worker GROUP BY DEPARTMENT;

-- 11. HAVING Keyword by GROUP BY
SELECT DEPARTMENT, COUNT(DEPARTMENT) from Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) >= 2;



