CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, age, department, salary)
VALUES ('John Doe', 30, 'Engineering', 75000.00),
       ('Jane Smith', 25, 'Marketing', 55000.00),
       ('Michael Johnson', 40, 'HR', 60000.00),
       ('Emily Davis', 35, 'Engineering', 80000.00);

SELECT * FROM employees;
 
