INSERT INTO customer (customerFirstName, customerLastName, customerStreet, customerCity, contactNumber) VALUES
('John', 'Smith', 'Banica', 'Roxas', '555-1234'),
('Jane', 'Doe', 'Tiza', 'Roxas', '555-5678'),
('Peter', 'Jones', '789 Pine Rd', 'Otherville', '555-9101'),
('Michael', 'Johnson', 'Tiza', 'Roxas', '555-2468'),
('Jessica', 'Davis', 'Mandurriao', 'Ilo-ilo', '555-1357'),
('David', 'Miller', 'Banica', 'Roxas', '555-8642'),
('Sarah', 'Brown', 'Mandurriao', 'Ilo-ilo', '555-7788'),
('James', 'Wilson', 'Leganes', 'Ilo-ilo', '555-6655'),
('Olivia', 'Moore', 'Mandurriao', 'Ilo-ilo', '555-4433'),
('William', 'Garcia', '707 Oak Rd', 'Lakeside', '555-2211');

-- Inventory
INSERT INTO Inventory (shoeName, colorway, shoeSize, shoeQuantity, shoePrice) VALUES
('Samba OG 1', 'Gray', 9, 100, 90.00),
('Samba OG 1', 'Brown', 10, 50, 95.00),
('Samba OG 1', 'Black', 11, 25, 120.00),
('Samba OG 1', 'Black', 10, 45, 95.00),
('Samba OG 1', 'Brown', 8, 80, 85.00),
('Pegasus NK', 'White', 10, 25, 150.00),
('Pegasus NK', 'Black', 9, 30, 140.00),
('Pegasus NK', 'Green', 10, 20, 160.00),
('NB75', 'White', 9, 60, 110.00),
('NB75', 'Brown', 11, 35, 120.00);

-- Sales
INSERT INTO sales (customerID, salesDate, transactionTotalAmount) VALUES
(1001, '2024-09-10 09:00:00', 90.00),
(1004, '2024-09-14 10:00:00', 95.00),
(1005, '2024-09-14 11:15:00', 170.00),
(1006, '2024-09-15 09:30:00', 120.00),
(1007, '2024-09-15 14:00:00', 110.00),
(1008, '2024-09-16 08:45:00', 160.00),
(1009, '2024-09-16 11:00:00', 150.00),
(1010, '2024-09-17 13:20:00', 120.00),
(1001, '2024-09-17 15:45:00', 85.00),
(1002, '2024-09-18 09:10:00', 95.00);

-- Sales Details
INSERT INTO salesDetails (salesID, shoeID, salesQuantity, totalAmount) VALUES
(10001, 1, 1, 90.00),
(10002, 4, 1, 95.00),
(10003, 5, 2, 170.00),
(10004, 3, 1, 120.00),
(10005, 9, 1, 110.00),
(10006, 8, 1, 160.00),
(10007, 6, 1, 150.00),
(10008, 10, 1, 120.00),
(10009, 5, 1, 85.00),
(10010, 2, 1, 95.00);

-- Restock: (5 entries, to be expanded as needed)
INSERT INTO restock (shoeID, restockDate, restockQuantity) VALUES
(1, '2024-09-08 10:00:00', 50),
(4, '2024-09-12 11:00:00', 20),
(6, '2024-09-13 15:30:00', 15),
(5, '2024-09-15 09:00:00', 30),
(7, '2024-09-16 10:00:00', 40);

-- brands
INSERT INTO brand (brandName) VALUES
('Nike'),
('Adidas'),
('New Balance');

-- updating inventory for brand
ALTER TABLE Inventory ADD COLUMN brandID INT;
UPDATE Inventory SET brandID = (SELECT brandID FROM brand WHERE brandName = 'Nike') WHERE shoeName LIKE 'NK%';
UPDATE Inventory SET brandID = (SELECT brandID FROM brand WHERE brandName = 'Adidas') WHERE shoeName LIKE 'Samba%';
UPDATE Inventory SET brandID = (SELECT brandID FROM brand WHERE brandName = 'New Balance') WHERE shoeName LIKE 'NB%';
ALTER TABLE Inventory
ADD FOREIGN KEY (brandID)
REFERENCES brand(brandID);