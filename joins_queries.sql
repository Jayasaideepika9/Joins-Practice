CREATE DATABASE codtech_internship_db;
USE codtech_internship_db;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eve', 'Miami');


-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2023-01-15', 250.00),
(102, 2, '2023-01-20', 150.50),
(103, 1, '2023-01-22', 300.00),
(104, 4, '2023-02-01', 500.00),
(105, 3, '2023-02-10', 75.25);

-- inner join
SELECT
    C.CustomerID,
    C.CustomerName,
    C.City,
    O.OrderID,
    O.OrderDate,
    O.Amount
FROM
    Customers AS C -- 'AS C' is an alias for Customers, makes queries shorter
INNER JOIN
    Orders AS O ON C.CustomerID = O.CustomerID;
    
-- left join
SELECT
    C.CustomerID,
    C.CustomerName,
    C.City,
    O.OrderID,
    O.OrderDate,
    O.Amount
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID;

-- right join
SELECT
    C.CustomerID,
    C.CustomerName,
    C.City,
    O.OrderID,
    O.OrderDate,
    O.Amount
FROM
    Customers AS C
RIGHT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID;
    
-- full join
SELECT
    C.CustomerID,
    C.CustomerName,
    C.City,
    O.OrderID,
    O.OrderDate,
    O.Amount
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
UNION ALL -- Use UNION ALL to combine results
SELECT
    C.CustomerID,
    C.CustomerName,
    C.City,
    O.OrderID,
    O.OrderDate,
    O.Amount
FROM
    Customers AS C
RIGHT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
WHERE C.CustomerID IS NULL; -- This part ensures you only get rows unique to the RIGHT JOIN (orders without matching customers from the left join)