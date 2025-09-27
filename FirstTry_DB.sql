
-- do first!
-- create shoe_inventory table first (then run)
-- use table (run)
-- then run code for tables

-- USERS (no relationship yet!)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'staff',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

CREATE TABLE customer (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerFirstName VARCHAR(50) NOT NULL,
    customerLastName VARCHAR(50) NOT NULL,
    customerStreet VARCHAR(50),
    customerCity VARCHAR(50),
    contactNumber VARCHAR(20)
);
ALTER TABLE customer AUTO_INCREMENT = 1001;

-- Create the 'Inventory' table with an AUTO_INCREMENT starting at 1
CREATE TABLE Inventory (
    shoeID INT PRIMARY KEY AUTO_INCREMENT,
    shoeName VARCHAR(50) NOT NULL,
    colorway VARCHAR(20),
    shoeSize INT NOT NULL,
    shoeQuantity INT NOT NULL,
    shoePrice DECIMAL(10, 2) NOT NULL
);
ALTER TABLE Inventory AUTO_INCREMENT = 1;

-- Create the 'sales' table with an AUTO_INCREMENT starting at 10001.
CREATE TABLE sales (
    salesID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    salesDate DATETIME NOT NULL,
    transactionTotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customer(customerID)
);
ALTER TABLE sales AUTO_INCREMENT = 10001;

-- Create the 'salesDetails' table, a junction table.
-- This table does not use AUTO_INCREMENT as its primary key is a composite of foreign keys.
CREATE TABLE salesDetails (
    salesID INT,
    shoeID INT,
    salesQuantity INT NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (salesID, shoeID),
    FOREIGN KEY (salesID) REFERENCES sales(salesID),
    FOREIGN KEY (shoeID) REFERENCES Inventory(shoeID)
);

-- Create the 'restock' table with an AUTO_INCREMENT starting at 100001.
CREATE TABLE restock (
    restockID INT PRIMARY KEY AUTO_INCREMENT,
    shoeID INT,
    restockDate DATETIME NOT NULL,
    restockQuantity INT NOT NULL,
    FOREIGN KEY (shoeID) REFERENCES Inventory(shoeID)
);
ALTER TABLE restock AUTO_INCREMENT = 100001;

CREATE TABLE brand (
    brandID INT PRIMARY KEY AUTO_INCREMENT,
    brandName VARCHAR(50) NOT NULL UNIQUE
);






