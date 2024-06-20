--q1_create and insert
CREATE TABLE Customers (
    Customer_Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL
);


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL
);


INSERT INTO Customers (Customer_Id, Name, Email, Address)
VALUES (1, 'mohamed ahmed', 'mohamed@example.com', '123 Main St, City, State'),
       (2, 'ahmed ahmed', 'ahmed@example.com', '456 Elm St, City, State'),
       (3, 'adel adel', 'adel@example.com', '789 Oak St, City, State');

-- Insert data into the Orders table
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount)
VALUES (1, 1, '2024-05-01', 49.99),
       (2, 2, '2024-05-03', 79.99),
       (3, 3, '2024-05-05', 99.99);


------------------------------------------------------------------------------------------------
--q2 forighn
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_Id);

------------------------------------------------------------------------------------------------------
--q3

CREATE TABLE Returns (
    Return_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Return_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL
);


INSERT INTO Returns (Return_ID, Customer_ID, Return_Date, Total_Amount)
VALUES (1, 1, '2024-05-5', 24.99),
       (2, 2, '2024-05-5', 39.99);


SELECT 'Order' AS Type, Order_ID, Customer_ID, Order_Date, Total_Amount
FROM Orders
UNION
SELECT 'Return' AS Type, Return_ID, Customer_ID, Return_Date, Total_Amount
FROM Returns;

--------------------------------------------------------------------------------------
--q4


CREATE PROCEDURE GetMonthlyOrdersForCustomers(IN customer_ids VARCHAR(100), IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT 
        MONTH(Order_Date) AS Month,
        YEAR(Order_Date) AS Year,
        Customer_ID,
        COUNT(*) AS Order_Count
    FROM Orders
    WHERE Customer_ID IN (SELECT value FROM STRING_SPLIT(customer_ids, ','))
        AND Order_Date BETWEEN start_date AND end_date
    GROUP BY YEAR(Order_Date), MONTH(Order_Date), Customer_ID
    ORDER BY YEAR(Order_Date), MONTH(Order_Date), Customer_ID;
END
 ;


CALL GetMonthlyOrdersForCustomers('1,2', DATE_SUB(NOW(), INTERVAL 1 YEAR), NOW());