
-- do first!
-- create shoe_inventory table first (then run)
-- use table (run)
-- then run code for tables

CREATE TABLE customer (
    customerID INT PRIMARY KEY,
    customerFirstName VARCHAR(50) NOT NULL,
    customerLastName VARCHAR(50) NOT NULL,
    customerStreet VARCHAR(50),
    customerCity VARCHAR(50),
    contactNumber VARCHAR(20)
);

CREATE TABLE Inventory (
    shoeID INT PRIMARY KEY,
    shoeName VARCHAR(50) NOT NULL,
    colorway VARCHAR(20),
    shoeSize INT NOT NULL,
    shoeQuantity INT NOT NULL,
    shoePrice DECIMAL(10, 2) NOT NULL
);

CREATE TABLE sales (
    salesID INT PRIMARY KEY,
    customerID INT,
    salesDate DATETIME NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE salesDetails (
    salesID INT,
    shoeID INT,
    salesQuantity INT NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (salesID, shoeID),
    FOREIGN KEY (salesID) REFERENCES sales(salesID),
    FOREIGN KEY (shoeID) REFERENCES Inventory(shoeID)
);


CREATE TABLE restock (
    restockID INT PRIMARY KEY,
    shoeID INT,
    restockDate DATETIME NOT NULL,
    restockQuantity INT NOT NULL,
    FOREIGN KEY (shoeID) REFERENCES Inventory(shoeID)
);








