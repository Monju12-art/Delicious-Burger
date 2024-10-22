-- Create the database
CREATE DATABASE DeliciousBurgerDB;
GO
-- Use the database
USE DeliciousBurgerDB;
GO

BACKUP DATABASE DeliciousBurgerDB
TO DISK = 'C:\sql_Backups\DeliciousBurger.bak';

--C:\sql_Backups\DeliciousBurger.bak
-- TO DISK = 'C:\TREUFASHION\truefashion\TrueFashionEmployeeDB.bak';


-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT IDENTITY(2,2) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL
);

-- Insert default categories
INSERT INTO Categories (CategoryName) VALUES 
('Appetizers'),
('Main Courses'),
('Desserts');

 -- Select all data from categories table to verify insertions
SELECT * FROM Categories;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(200)
);

INSERT INTO Customers 
VALUES( 'Irene Jelleh','irene@mail.com','+233 925 225 509', 'Spintex'),
      ( 'Rita Tody', 'Tody@mail.com', '+233 925 230 711', 'Awutu'),
      ( 'Thomas Blah', ' Blah@mail.com', '+233 925 230 664', 'Accra'),
      ( 'Francelyn Smith', 'france@mail.com','+233 925 630 001', 'Tema'),
      ( 'Julius Railey', 'julius@mail.com', '+233 925 230 985', 'Kasoa');


-- Select all data from Customers table to verify insertions
SELECT * FROM Customers;


-- Create Burgers table name menuItems
CREATE TABLE MenuItems (
    MenuItemsID INT IDENTITY(100,1) PRIMARY KEY,
    ItemName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Insert sample data into the Burgers table
INSERT INTO MenuItems (ItemName, Description, Price, CategoryID)

 VALUES
  ('Beef and Cheese', 'Delicious beef with cheese', 20.00, 2),
 ('Crispy Fried Chicken', 'Crispy fried chicken', 20.00, 2),
 ('Vegetable Salad', 'Fresh vegetable salad', 25.00, 2),
 ('Bacon Burger', 'Juicy bacon burger', 40.00, 4),
 ('Meat Burger', 'Delicious meat burger', 40.00, 4),
 ('Veges Burger', 'Healthy veges burger', 30.00, 4),
 ('Chocolate Cake', 'Rich chocolate cake', 20.00, 6),
 ('Cheesecake', 'Creamy cheesecake', 20.00, 6),
 ('Fruit Tart', 'Fresh fruit tart', 20.00, 6);

  -- Select all data from MenuItems table to verify insertions
 SELECT * FROM MenuItems;

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(10,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE DEFAULT GETDATE(),
	location NVARCHAR (70),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
);

INSERT INTO Orders
VALUES
(1, '2024-02-11','Spintex', 60.00 ),
(2, '2024-03-12','Awutu', 20.00 ),
(3, '2024-03-01', 'Accra',45.00 ),
(5, '2024-04-25', 'Kasoa',20.00 ),
(1, '2024-04-19', 'Spintex',85.00 );

 -- Select all data from Order table to verify insertions
 SELECT * FROM Orders;

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailsID INT IDENTITY(200,1) PRIMARY KEY,
    OrderID INT,
    MenuItemsID INT,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemsID) REFERENCES MenuItems(MenuItemsID)
);

INSERT INTO OrderDetails
VALUES (10,102, 20.00),
(10,105, 40.00),
(11,103, 20.00),
(12,104, 25.00),
(12,103, 20.00),
(13,109, 200.00),
(14,105, 40.00),
(12,106, 40.00);

 -- Select all data from OrderDetails table to verify insertions
SELECT * FROM OrderDetails;


  ---CRUD ( create, read,update, delete) OPERATIONS---
     -- Create(insert)

INSERT INTO Orders
VALUES (1, '2024-04-20','Kasoa', 60.00 );
SELECT*FROM Orders;

-- Read (Select)
SELECT*FROM Customers  
WHERE CustomerName='Irene Jelleh';

SELECT  DISTINCT Location
FROM Orders;

SELECT COUNT(DISTINCT ItemName) FROM  MenuItems;

SELECT TOP 4* FROM Customers;

SELECT ItemName AS FoodName
FROM MenuItems;

-- Update (Update)
UPDATE OrderDetails
SET price= 20.00
WHERE OrderDetailsID= 205;

SELECT * FROM OrderDetails;

-- Delete (delete)
DELETE FROM employee
WHERE employeeID = 11;


---JOINS--

-- Inner Join
SELECT *
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;


-- Left Join
SELECT *
FROM Employee e
LEFT JOIN JobHistory j ON e.EmployeeID = j.EmployeeID;
