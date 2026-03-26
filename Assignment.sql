
-- ============================================
-- DATABASE: ShopDB (Cosmetics & Jewelry Management)
-- Glitzy (Advanced)
-- ============================================

CREATE DATABASE ShopDB;
GO
USE ShopDB;
GO

-- ============================
-- 1. CUSTOMER
-- ============================
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address NVARCHAR(200)
);

-- ============================
-- 2. SUPPLIER
-- ============================
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);

-- ============================
-- 3. CATEGORY
-- ============================
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

-- ============================
-- 4. PRODUCT
-- ============================
CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    Stock INT DEFAULT 0 CHECK (Stock >= 0),
    SupplierID INT NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- ============================
-- 5. ORDER 
-- ============================
CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATE NOT NULL DEFAULT GETDATE(),
    CustomerID INT NOT NULL,
    TotalAmount DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- ============================
-- 6. ORDER DETAIL 
-- ============================
CREATE TABLE OrderDetail (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- ============================
-- 7. PAYMENT 
-- ============================
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    PaymentDate DATE DEFAULT GETDATE(),
    Amount DECIMAL(12,2) CHECK (Amount >= 0),
    Method NVARCHAR(30),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID)
);

-- ============================
-- 8. REVIEW 
-- ============================
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    Rating TINYINT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(300),
    ReviewDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
--INSERT DATA 
-- 1. CUSTOMER 
INSERT INTO Customer (Name, Email, Phone, Address) VALUES
('John Smith', 'john.s@gmail.com', '0904462757', '123 Oak St, London'),
('Alice Johnson', 'alice.j@gmail.com', '0909228745', '456 Pine Ave, New York'),
('Robert Brown', 'robert.b@gmail.com', '0931562758', '789 Maple Rd, Paris'),
('Emily Davis', 'emily.d@gmail.com', '0942587666', '101 Birch Ln, Sydney'),
('Michael Wilson', 'michael.w@gmail.com', '0903636544', '202 Cedar Pl, Berlin'),
('Sarah Lee', 'sarah.l@gmail.com', '0904000106', '303 Elm Dr, Tokyo'),
('David Kim', 'david.k@gmail.com', '0909444610', '404 Aspen Blvd, Toronto'),
('Jessica Chen', 'jessica.c@gmail.com', '0999845564', '505 Willow Way, Rome'),
('James Wang', 'james.w@gmail.com', '0924555666', '606 Poplar Ct, Madrid'),
('Maria Garcia', 'maria.g@gmail.com', '0939258777', '707 Spruce Gr, Dublin');
-- 2. SUPPLIER 
INSERT INTO Supplier (Name, Phone, Email, Address) VALUES
('Global Beauty Inc.', '0902111111', 'gb@inc.com', '10 Industrial Area, LA'),
('Jewelry Master', '0902222222', 'jm@master.com', '20 Gold Lane, Miami'),
('SkinCare Essentials', '0902333333', 'sc@essentials.com', '30 Pharma Zone, Boston'),
('Fashion Accessories Co.', '0902444444', 'fa@co.com', '40 Style Street, Dallas'),
('Cosmetics Hub', '0902555555', 'ch@hub.com', '50 Makeup Blvd, Chicago'),
('Natural Oils Ltd.', '0902666666', 'no@ltd.com', '60 Organic Way, Seattle'),
('Premium Gold Crafts', '0902777777', 'pg@crafts.com', '70 Luxury Rd, San Fran'),
('Tech Gadget Supplies', '0902888888', 'tg@supplies.com', '80 Silicon St, Austin'),
('Home Decor Central', '0902999999', 'hd@central.com', '90 Cozy Ave, Denver'),
('Health & Wellness Corp.', '0903000000', 'hw@corp.com', '100 Vita Loop, Phoenix');

-- 3. CATEGORY
INSERT INTO Category (CategoryName) VALUES
('Lipstick'),
('Necklace'),
('Skincare'),
('Bracelet'),
('Makeup Kit'),
('Earrings'),
('Fragrance'),
('Hair Care'),
('Rings'),
('Nail Polish');

-- 4. PRODUCT 
INSERT INTO Product (ProductName, Price, Stock, SupplierID, CategoryID) VALUES
('Matte Red Lipstick', 19.99, 50, 1, 1),           -- Lipstick, Global Beauty
('18k Gold Necklace', 129.99, 10, 7, 2),           -- Necklace, Premium Gold Crafts (Using SupplierID 7)
('Hydrating Serum 30ml', 39.99, 40, 3, 3),         -- Skincare, SkinCare Essentials
('Silver Charm Bracelet', 49.99, 15, 4, 4),        -- Bracelet, Fashion Accessories Co.
('Pro Makeup Palette', 89.99, 20, 5, 5),          -- Makeup Kit, Cosmetics Hub
('Natural Lip Balm', 7.99, 80, 6, 1),             -- Lipstick, Natural Oils Ltd. (Using SupplierID 6)
('Diamond Stud Earrings', 199.99, 5, 7, 6),        -- Earrings, Premium Gold Crafts
('Luxury Perfume 50ml', 79.99, 30, 1, 7),         -- Fragrance, Global Beauty
('Daily Shampoo 500ml', 14.99, 60, 8, 8),          -- Hair Care, Tech Gadget Supplies (Using SupplierID 8)
('Classic Gold Ring', 99.99, 12, 7, 9);            -- Rings, Premium Gold Crafts

-- 5. ORDER 
INSERT INTO [Order] (OrderDate, CustomerID, TotalAmount) VALUES
(GETDATE(), 1, 12), -- Order 1
(DATEADD(day, -1, GETDATE()), 2, 11), -- Order 2
(DATEADD(day, -2, GETDATE()), 3, 10), -- Order 3
(DATEADD(day, -3, GETDATE()), 4, 9), -- Order 4
(DATEADD(day, -4, GETDATE()), 5, 1), -- Order 5
(DATEADD(day, -5, GETDATE()), 6, 5), -- Order 6
(DATEADD(day, -6, GETDATE()), 7, 20), -- Order 7
(DATEADD(day, -7, GETDATE()), 8, 25), -- Order 8
(DATEADD(day, -8, GETDATE()), 9, 36), -- Order 9
(DATEADD(day, -9, GETDATE()), 10, 9); -- Order 10
-- 6. ORDER DETAIL 
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 19.99),  -- Order 1: Matte Red Lipstick (39.98)
(2, 6, 1, 7.99),   -- Order 2: Natural Lip Balm (7.99)
(3, 2, 1, 129.99), -- Order 3: 18k Gold Necklace (129.99)
(4, 3, 3, 39.99),  -- Order 4: Hydrating Serum (119.97)
(5, 4, 2, 49.99),  -- Order 5: Silver Charm Bracelet (99.98)
(6, 5, 1, 89.99),  -- Order 6: Pro Makeup Palette (89.99)
(7, 7, 1, 199.99), -- Order 7: Diamond Stud Earrings (199.99)
(8, 8, 2, 79.99),  -- Order 8: Luxury Perfume (159.98)
(9, 9, 1, 14.99),  -- Order 9: Daily Shampoo (14.99)
(10, 10, 1, 99.99);-- Order 10: Classic Gold Ring (99.99)
-- 7. PAYMENT 
INSERT INTO Payment (OrderID, Amount, Method) VALUES
(1, 39.98, 'Credit Card'),
(2, 7.99, 'Cash'),
(3, 129.99, 'Bank Transfer'),
(4, 119.97, 'PayPal'),
(5, 99.98, 'MOMO'),
(6, 89.99, 'VNPAY'),
(7, 199.99, 'Credit Card'),
(8, 159.98, 'Bank Transfer'),
(9, 14.99, 'Cash'),
(10, 99.99, 'PayPal');

-- 8. REVIEW 
INSERT INTO Review (ProductID, CustomerID, Rating, Comment) VALUES
(1, 1, 5, 'Excellent product, highly recommend!'),
(2, 2, 4, 'Good quality, fast shipping.'),
(3, 3, 5, 'Skin feels amazing after using this serum.'),
(4, 4, 3, 'A bit tight, but looks nice.'),
(5, 5, 4, 'Great variety of shades in the palette.'),
(6, 6, 5, 'Very moisturizing and natural.'),
(7, 7, 5, 'Stunning earrings, worth the price.'),
(8, 8, 4, 'Lovely fragrance, lasts all day.'),
(9, 9, 3, 'Average shampoo, nothing special.'),
(10, 10, 5, 'Beautiful classic ring, perfect fit.');

--7. SQL Queries
--7.1. Multi-table JOIN:
--Retrieve details of ordered products, including the customer name and product name.
SELECT o.OrderID, c.Name AS Customer, p.ProductName, od.Quantity, od.UnitPrice
FROM [Order] o
JOIN OrderDetail od ON o.OrderID = od.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Product p ON od.ProductID = p.ProductID;
--7.2. Subquery :
--Find products whose selling price is higher than the average selling price of all products.
SELECT ProductName, Price
FROM Product
WHERE Price > (SELECT AVG(Price) FROM Product);
--7.3. LIKE + Aggregate Function
--Calculate the total sales revenue for the current month.
SELECT SUM(TotalAmount) AS MonthlySales
FROM [Order]
WHERE MONTH(OrderDate) = MONTH(GETDATE()) AND YEAR(OrderDate) = YEAR(GETDATE());
--8. View Installation
--Create a view vw_ProductInfo for quick viewing of aggregated product information (product name, category name, supplier name, price, stock).
CREATE VIEW vw_ProductInfo AS
SELECT p.ProductID, p.ProductName, c.CategoryName, s.Name AS SupplierName, p.Price, p.Stock
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
JOIN Supplier s ON p.SupplierID = s.SupplierID;

-- Way to use:
SELECT * FROM vw_ProductInfo; 
--9. Trigger Installation
--Create a trigger trg_AfterInsertOrderDetail to automatically update the stock quantity (decrease) and update the total amount for an order whenever a new product is added to OrderDetail.
CREATE TRIGGER trg_AfterInsertOrderDetail
ON OrderDetail
AFTER INSERT
AS
BEGIN
    
    UPDATE P
    SET Stock = P.Stock - I.Quantity
    FROM Product P
    JOIN inserted I ON P.ProductID = I.ProductID;

    
    
    ;WITH CTE_OrderTotal AS (
        SELECT 
            OrderID, 
            SUM(Quantity * UnitPrice) AS NewTotal
        FROM OrderDetail
        
        WHERE OrderID IN (SELECT DISTINCT OrderID FROM inserted)
        GROUP BY OrderID
    )
    UPDATE O
    SET TotalAmount = CTE.NewTotal
    FROM [Order] O
    JOIN CTE_OrderTotal CTE ON O.OrderID = CTE.OrderID;
END;
--10. Procedure and Function Installation
--10.1. Procedure:
--Create a stored procedure sp_UpdateTotal to calculate and re-update the total amount for any given order (useful when order details are updated or deleted).
CREATE PROCEDURE sp_UpdateTotal @OrderID INT
AS
BEGIN
    DECLARE @Total DECIMAL(12,2);
    SELECT @Total = SUM(Quantity * UnitPrice)
    FROM OrderDetail
    WHERE OrderID = @OrderID;

    UPDATE [Order] SET TotalAmount = @Total WHERE OrderID = @OrderID;
    SELECT @Total AS TotalAmount;
END;

-- Way to use:
EXEC sp_UpdateTotal @OrderID = 1;
--10.2. Function:
--Create a function fn_ProductCountBySupplier to quickly count the number of products supplied by a specific supplier.
CREATE FUNCTION fn_ProductCountBySupplier(@SupplierID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM Product WHERE SupplierID = @SupplierID;
    RETURN @Count;
END;

-- Way to use:
SELECT dbo.fn_ProductCountBySupplier(4) AS SoLuongSanPham;
--11. Additional Database Techniques (CRUD, Alter, Encrypt) 
--11.1. Update/Delete Data:
--Update the price for a product.
UPDATE Product SET Price = 25.00 WHERE ProductName = 'Matte Red Lipstick';
--Delete an inappropriate review.
DELETE FROM Review WHERE ReviewID = 4;
--11.2. Modify Table and Column Names:
--Rename the column Phone to PhoneNumber in the Customer table.
EXEC sp_rename 'Customer.Phone', 'PhoneNumber', 'COLUMN';
--Rename the Review table to ProductReview.
EXEC sp_rename 'Review', 'ProductReview';
--11.3. Code Encryption (Procedure):
--Encrypt (hide) the content of the sp_UpdateTotal procedure to protect business logic.
ALTER PROCEDURE sp_UpdateTotal @OrderID INT
WITH ENCRYPTION
AS
BEGIN
    DECLARE @Total DECIMAL(12,2);
    SELECT @Total = SUM(Quantity * UnitPrice)
    FROM OrderDetail
    WHERE OrderID = @OrderID;

    UPDATE [Order] SET TotalAmount = @Total WHERE OrderID = @OrderID;
    SELECT @Total AS TotalAmount;
END;

