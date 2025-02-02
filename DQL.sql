CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;


CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (001, 'John', 'Doe', 50000, '2022-01-15 09:00:00', 'Engineering'),
       (002, 'Jane', 'Smith', 60000, '2023-03-22 10:30:00', 'Marketing'),
       (003, 'Michael', 'Johnson', 55000, '2021-11-12 08:45:00', 'HR'),
       (004, 'Emily', 'Davis', 70000, '2020-05-18 14:00:00', 'Engineering'),
       (005, 'William', 'Brown', 65000, '2019-07-25 11:00:00', 'Finance'),
       (006, 'Sophia', 'Wilson', 48000, '2022-06-05 09:15:00', 'Marketing'),
       (007, 'James', 'Taylor', 72000, '2018-09-10 13:30:00', 'Engineering'),
       (008, 'Olivia', 'Anderson', 53000, '2021-02-20 16:00:00', 'HR');
	
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (009, 'Olivia', 'Anderson', 53000, '2021-02-20 16:00:00', NULL);
	
SELECT * FROM Worker;

CREATE TABLE BONUS (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES (001, 5000, '2023-12-25 10:00:00'),
       (002, 3000, '2023-12-15 11:00:00'),
       (003, 4000, '2023-11-30 09:00:00'),
       (001, 6000, '2023-10-20 14:30:00'),
       (002, 3500, '2023-09-05 12:00:00');


CREATE TABLE Title (
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (001, 'Engineer', '2022-01-15 09:00:00'),
       (002, 'Marketing Specialist', '2023-03-22 10:30:00'),
       (008, 'HR Manager', '2021-11-12 08:45:00'),
       (005, 'Senior Engineer', '2020-05-18 14:00:00'),
       (004, 'Financial Analyst', '2019-07-25 11:00:00'),
       (007, 'Marketing Coordinator', '2022-06-05 09:15:00'),
       (006, 'Lead Engineer', '2018-09-10 13:30:00'),
       (003, 'HR Coordinator', '2021-02-20 16:00:00');


