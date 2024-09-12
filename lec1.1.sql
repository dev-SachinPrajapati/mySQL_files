-- Step 1: Create a Database
CREATE DATABASE SimpleDB;

-- Step 2: Select the Database
USE SimpleDB;

-- Step 3: Create a Table
CREATE TABLE Users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

-- Step 4: Insert a Record
INSERT INTO Users (Name, Email) VALUES ('John Doe', 'john.doe@example.com');

-- Step 5: Query the Table
SELECT * FROM Users;
