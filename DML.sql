CREATE DATABASE temp;

USE temp;


CREATE TABLE Customer (
	id INT PRIMARY KEY,
    cname VARCHAR(255),
    Address VARCHAR(255),
    Gender CHAR(2),
    City VARCHAR(255),
    Pincode INTEGER
);

INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) 
VALUES (10, 'John Doe', '123 Elm St', 'M', 'New York', 10001);

-- 1. INSERT VALUE 
INSERT INTO Customer VALUES (11, 'Sachin Prajapati', 'Mumbai', 'M', 'Maharashtrs', 400068);

INSERT INTO Customer (id, cname) 
VALUES (12, 'Virat');  -- all remaining value will be NULL i.e. DEFAULT VALUE (But we didn't add)


-- 2. UPDATE
UPDATE Customer SET Address="DELHI", Gender='M' WHERE id = 12;
	
    -- Update Multiple ROW
    SET SQL_SAFE_UPDATES = 0; -- we use this
    UPDATE Customer SET Pincode = 400068;  -- this give error as SQL Security think you are unauthorize user to use it 

SELECT * FROM Customer;


-- 3. DELETE
DELETE FROM Customer WHERE id = 4;
	-- to delete all customer
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Customer;
    
SELECT * FROM Customer;


-- 4. ON DELETE CASCADE AND SET NULL
DROP TABLE Customer;
DROP TABLE Order_Details;

CREATE TABLE Customer (
	id INT PRIMARY KEY,
    cname VARCHAR(255),
    Address VARCHAR(255),
    Gender CHAR(2),
    City VARCHAR(255),
    Pincode INTEGER
);

SELECT * FROM Customer;

INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) 
VALUES (1, 'John Doe', '123 Elm St', 'M', 'New York', 10001);

CREATE TABLE Order_Details (
	Order_id INTEGER PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE CASCADE
);

INSERT INTO Order_Details (Order_id, delivery_date, cust_id) 
VALUES (101, '2024-09-10', 1);

INSERT INTO Order_Details (Order_id, delivery_date, cust_id) 
VALUES (102, '2024-09-11', 1);

DELETE FROM Customer WHERE id = 1;


CREATE TABLE Order_Details (
	Order_id INTEGER PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE SET NULL
);

SELECT * FROM Order_Details;

	-- Here make sure add customer first because we already deleted that
INSERT INTO Order_Details (Order_id, delivery_date, cust_id) 
VALUES (103, '2024-09-10', 1);

INSERT INTO Order_Details (Order_id, delivery_date, cust_id) 
VALUES (104, '2024-09-11', 1);

DELETE FROM Customer WHERE id = 1;


-- 5. REPLACE
REPLACE INTO Customer(id, City) VALUES(1, 'Antartica');  -- From New York to Antartica 

REPLACE INTO Customer(id, City) VALUES(2, 'DELHI');   -- work as Insert as didn't have this ID

REPLACE INTO Customer SET id = 3, cname='MAC', City='Goa';

REPLACE INTO Customer(id, cname, City)
	SELECT id, cname, City
    FROM Customer WHERE id = 1;

SELECT * FROM Customer;





