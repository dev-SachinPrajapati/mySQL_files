CREATE DATABASE temp;

USE temp;

-- 1. PRIMARY AND FOREIGN KEY
CREATE TABLE Customer (
	id INT PRIMARY KEY,
    cname VARCHAR(255),
    Address VARCHAR(255),
    Gender CHAR(2),
    City VARCHAR(255),
    Pincode INTEGER
);

INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) 
VALUES (1, 'John Doe', '123 Elm St', 'M', 'New York', 10001),
	   (2, 'Jane Smith', '456 Oak St', 'F', 'Los Angeles', 90001),
       (3, 'Alice Johnson', '789 Pine St', 'F', 'Chicago', 60601),
       (4, 'Bob Lee', '321 Maple St', 'M', 'Houston', 77001),
       (5, 'Emma Davis', '654 Birch St', 'F', 'Phoenix', 85001);


INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) 
VALUES (1245, 'John Doe', '123 Elm St', 'M', 'New York', NULL);



CREATE TABLE Order_Details (
	Order_id INTEGER PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer(id)
);


INSERT INTO Order_Details (Order_id, delivery_date, cust_id) 
VALUES 
(101, '2024-09-10', 1);


DELETE FROM Customer WHERE id = 245;



-- 2. UNIQUE and CHECK 

CREATE TABLE Accounts (
	id INT PRIMARY KEY,
    fullname VARCHAR(255) UNIQUE,
    balance INT,
    CONSTRAINT acc_balance_chk CHECK(balance > 1000)
);

INSERT INTO Accounts (id, fullname, balance) 
VALUES 
(1, 'Alice Brown', 1500.00);

-- This below give error as we use the same fullname and we define that it should be unique 
-- and make sure balance must be greater than 1000 as we use CHECK
INSERT INTO Accounts (id, fullname, balance) 
VALUES 
(2, 'Sachin Prajapati', 1500.00);

-- to drop table 
DROP TABLE Accounts;
SELECT * FROM Accounts;

-- 3. DEFAULT

CREATE TABLE Accounts (
	id INT PRIMARY KEY,
    fullname VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

INSERT INTO Accounts (id, fullname, balance) 
VALUES 
(1, 'Alice Brown', 1500.00);

-- This below give error as we use the same fullname and we define that it should be unique 
-- and make sure balance must be greater than 1000 as we use CHECK
INSERT INTO Accounts (id, fullname ) 
VALUES 
(2, 'Sachin Prajapati');


DROP TABLE Accounts;
SELECT * FROM Accounts;

-- 4. ALTER
CREATE TABLE Accounts (
	id INT PRIMARY KEY,
    fullname VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

INSERT INTO Accounts (id, fullname, balance) 
VALUES 
(1, 'Alice Brown', 1500.00);

SELECT * FROM Accounts;

	-- ADD NEW COLUMN
ALTER TABLE Accounts ADD Interest FLOAT NOT NULL DEFAULT 0;
    
    -- MODIFY (DATA TYPES)
ALTER TABLE Accounts MODIFY Interest DOUBLE NOT NULL DEFAULT 0;
DESC Accounts;  -- to check that float se double is happens or not by DESC -> Describe Accounts

	-- CHANGE COLUMN - RENAME THE COLUMN (interest to saving_interest)
ALTER TABLE Accounts CHANGE COLUMN Interest  Saving_Interest FLOAT NOT NULL DEFAULT 0;
DESC Accounts;  -- to check 

	-- DROP COLUMN
ALTER TABLE Accounts DROP COLUMN Saving_Interest;
DESC Accounts;  -- to check 

	-- RENAME THE TABLE
ALTER TABLE Accounts RENAME TO Account_Details;    