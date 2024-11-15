CREATE DATABASE FoodWebMVC;

USE FoodWebMVC;
GO
    
CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(255),
    CategoryDateCreated DATETIME
);

CREATE TABLE Product (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(255),
    ProductPrice MONEY, 
    ProductDescription NVARCHAR(MAX),
    ProductAmount INT,
    ProductDiscount INT,
    ProductImage NVARCHAR(MAX),
    ProductDateCreated DATETIME,
    CategoryId INT,
    ProductRating INT,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

CREATE TABLE Blog (
    BlogId INT IDENTITY(1,1) PRIMARY KEY,
    BlogName NVARCHAR(255),
    BlogContent NVARCHAR(MAX),
    BlogImage NVARCHAR(MAX),
    BlogDateCreated DATETIME
);

CREATE TABLE Customer (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerFullName NVARCHAR(255),
    CustomerUserName NVARCHAR(50) UNIQUE,
    CustomerPassword NVARCHAR(255),
    CustomerDateCreated DATETIME,
    CustomerEmail NVARCHAR(255),
    CustomerAddress NVARCHAR(255),
    CustomerPhone NVARCHAR(20),
    CustomerState BIT,
    CustomerImage NVARCHAR(MAX) 
);

CREATE TABLE Admin (
    AdminId INT IDENTITY(1,1) PRIMARY KEY,
    AdminUserName NVARCHAR(50) UNIQUE,
    AdminPassword NVARCHAR(255),
    AdminEmail NVARCHAR(255),
    AdminImage NVARCHAR(MAX),
    AdminDateCreated DATETIME
);

CREATE TABLE [Order] (
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    DayOrder DATETIME,
    DayDelivery DATETIME,
    PaidState BIT,
    DeliveryState BIT,
    TotalMoney MONEY,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

CREATE TABLE OrderDetail (
    OrderId INT,
    ProductId INT,
    UnitPrice MONEY,
    Quantity INT,
    PRIMARY KEY (OrderId, ProductId),
    FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

CREATE TABLE Favorite (
    ProductId INT,
    CustomerId INT,
    PRDateCreated DATETIME,
    PRIMARY KEY (ProductId, CustomerId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

CREATE TABLE ProductRating (
    ProductRatingId INT IDENTITY(1,1) PRIMARY KEY,
    Stars INT CHECK (Stars >= 1 AND Stars <= 5),
    RatingContent NVARCHAR(MAX),
    PRDateCreated DATETIME,
    ProductId INT,
    CustomerId INT,
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

CREATE TABLE Token (
    TokenID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerUserName NVARCHAR(50),
    TokenValue NVARCHAR(255),
    Expiry DATETIME
);

CREATE TABLE Banner (
    BannerId INT IDENTITY(1,1) PRIMARY KEY,
    BannerName NVARCHAR(255),
    ProductDiscount INT,
    BannerPrice MONEY,
    BannerDescription NVARCHAR(MAX),
    BannerImage NVARCHAR(MAX),
    BannerDateCreated DATETIME
);

CREATE TABLE EFMigrationsHistory (
    MigrationId NVARCHAR(150) PRIMARY KEY,
    ProductVersion NVARCHAR(32)
);

-- Insert dữ liệu mẫu cho bảng Categories
INSERT INTO Categories (CategoryName, CategoryDateCreated) VALUES
(N'Fruits', '2024-11-01'),
(N'Vegetables', '2024-11-02'),
(N'Drinks', '2024-11-03'),
(N'Dairy', '2024-11-04'),
(N'Snacks', '2024-11-05'),
(N'Seafood', '2024-11-06'),
(N'Bakery', '2024-11-07'),
(N'Meat', '2024-11-08'),
(N'Frozen Foods', '2024-11-09'),
(N'Organic', '2024-11-10');

-- Insert dữ liệu mẫu cho bảng Product
INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductAmount, ProductDiscount, ProductImage, ProductDateCreated, CategoryId, ProductRating) VALUES
(N'Apple', 10.99, N'Fresh red apples', 100, 5, N'images/apple.jpg', '2024-11-01', 1, 2),
(N'Banana', 5.99, N'Sweet yellow bananas', 200, 10, N'images/banana.jpg', '2024-11-02', 1, 3),
(N'Carrot', 3.49, N'Fresh organic carrots', 150, 8, N'images/carrot.jpg', '2024-11-03', 2, 4),
(N'Orange Juice', 15.99, N'Freshly squeezed orange juice', 50, 12, N'images/oj.jpg', '2024-11-04', 3, 5),
(N'Cheese', 20.99, N'Organic cheddar cheese', 80, 15, N'images/cheese.jpg', '2024-11-05', 4, 3),
(N'Chips', 3.99, N'Crunchy potato chips', 300, 2, N'images/chips.jpg', '2024-11-06', 5, 3),
(N'Shrimp', 25.99, N'Fresh shrimp', 120, 10, N'images/shrimp.jpg', '2024-11-07', 6, 4),
(N'Bread', 2.99, N'Organic whole wheat bread', 100, 5, N'images/bread.jpg', '2024-11-08', 7, 5),
(N'Beef Steak', 50.99, N'Premium beef steak', 40, 20, N'images/steak.jpg', '2024-11-09', 8, 5),
(N'Ice Cream', 7.99, N'Chocolate vanilla ice cream', 80, 10, N'images/icecream.jpg', '2024-11-10', 9, 5);

-- Insert dữ liệu mẫu cho bảng Blog
INSERT INTO Blog (BlogName, BlogContent, BlogImage, BlogDateCreated) VALUES
(N'Top 10 Healthiest Fruits', N'This blog discusses the top 10 healthiest fruits to eat for a balanced diet.', N'images/blog1.jpg', '2024-11-01'),
(N'Benefits of Organic Food', N'Organic food is healthier and more sustainable. Learn about its benefits.', N'images/blog2.jpg', '2024-11-02'),
(N'Tips for a Healthy Lifestyle', N'Tips and tricks to maintain a healthy lifestyle with exercise and nutrition.', N'images/blog3.jpg', '2024-11-03'),
(N'How to Make Smoothies', N'A guide to making delicious and healthy smoothies with fruits and vegetables.', N'images/blog4.jpg', '2024-11-04'),
(N'Seafood Nutrition', N'Learn about the health benefits of seafood and how to cook it properly.', N'images/blog5.jpg', '2024-11-05'),
(N'Smart Grocery Shopping', N'Learn how to shop smart and save money while buying healthy food.', N'images/blog6.jpg', '2024-11-06'),
(N'The Best Snacks for Energy', N'Healthy snacks that keep you energized throughout the day.', N'images/blog7.jpg', '2024-11-07'),
(N'Meat vs. Plant-Based Diets', N'Comparing the pros and cons of meat-based and plant-based diets.', N'images/blog8.jpg', '2024-11-08'),
(N'Home Gardening for Fresh Veggies', N'Tips and tricks for starting your own home vegetable garden.', N'images/blog9.jpg', '2024-11-09'),
(N'Vegan Protein Sources', N'Explore plant-based sources of protein for vegan diets.', N'images/blog10.jpg', '2024-11-10');

-- Insert dữ liệu mẫu cho bảng Customer--Mật khẩu là 123
INSERT INTO Customer (CustomerFullName, CustomerUserName, CustomerPassword, CustomerDateCreated, CustomerEmail, CustomerAddress, CustomerPhone, CustomerState, CustomerImage) VALUES
(N'Nguyen Thi Lan', N'nguyenlan', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-01', N'nguyenlan@gmail.com', N'Street 123, Hanoi', N'0987654321', 1, N'images/customer1.jpg'),
(N'Pham Minh Tu', N'phamtul', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-02', N'phamtul@gmail.com', N'Street 456, Ho Chi Minh', N'0912345678', 1, N'images/customer2.jpg'),
(N'Le Thi Hoa', N'lehoa', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-03', N'lehoa@gmail.com', N'Street 789, Da Nang', N'0908765432', 1, N'images/customer3.jpg'),
(N'Trinh Minh Thu', N'trinhthu', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-04', N'trinhthu@gmail.com', N'Street 101, Hanoi', N'0916677889', 1, N'images/customer4.jpg'),
(N'Hoang Thi Mai', N'hoangmai', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-05', N'hoangmai@gmail.com', N'Street 202, Hanoi', N'0933344556', 0, N'images/customer5.jpg'),
(N'Nguyen Anh Tuan', N'nguyentuan', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-06', N'nguyentuan@gmail.com', N'Street 303, Ho Chi Minh', N'0981122334', 1, N'images/customer6.jpg'),
(N'Phan Thanh Son', N'phanthson', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-07', N'phanthson@gmail.com', N'Street 404, Da Nang', N'0909876543', 1, N'images/customer7.jpg'),
(N'Vu Minh Kien', N'vumkien', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-08', N'vumkien@gmail.com', N'Street 505, Hanoi', N'0911122334', 1, N'images/customer8.jpg'),
(N'Tran Thi Bich', N'tranbich', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-09', N'tranbich@gmail.com', N'Street 606, Ho Chi Minh', N'0922233445', 0, N'images/customer9.jpg'),
(N'Phan Thi Mai', N'phanmai', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', '2024-11-10', N'phanmai@gmail.com', N'Street 707, Da Nang', N'0934455667', 1, N'images/customer10.jpg');

-- Insert dữ liệu mẫu cho bảng Admin--Mật khẩu là 123
INSERT INTO Admin (AdminUserName, AdminPassword, AdminEmail, AdminImage, AdminDateCreated) VALUES
(N'admin1', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin1@bdf.com', N'images/admin1.jpg', '2024-11-01'),
(N'admin2', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin2@bdf.com', N'images/admin2.jpg', '2024-11-02'),
(N'admin3', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin3@bdf.com', N'images/admin3.jpg', '2024-11-03'),
(N'admin4', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin4@bdf.com', N'images/admin4.jpg', '2024-11-04'),
(N'admin5', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin5@bdf.com', N'images/admin5.jpg', '2024-11-05'),
(N'admin6', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin6@bdf.com', N'images/admin6.jpg', '2024-11-06'),
(N'admin7', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin7@bdf.com', N'images/admin7.jpg', '2024-11-07'),
(N'admin8', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin8@bdf.com', N'images/admin8.jpg', '2024-11-08'),
(N'admin9', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin9@bdf.com', N'images/admin9.jpg', '2024-11-09'),
(N'admin10', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin10@bdf.com', N'images/admin10.jpg', '2024-11-10');

-- Insert dữ liệu mẫu cho bảng Order
INSERT INTO [Order] (DayOrder, DayDelivery, PaidState, DeliveryState, TotalMoney, CustomerId) VALUES
('2024-11-01', '2024-11-02', 1, 1, 100.00, 1),
('2024-11-02', '2024-11-03', 1, 1, 200.00, 2),
('2024-11-03', '2024-11-04', 0, 0, 50.00, 3),
('2024-11-04', '2024-11-05', 1, 1, 150.00, 4),
('2024-11-05', '2024-11-06', 0, 0, 75.00, 5),
('2024-11-06', '2024-11-07', 1, 1, 120.00, 6),
('2024-11-07', '2024-11-08', 1, 0, 180.00, 7),
('2024-11-08', '2024-11-09', 1, 1, 90.00, 8),
('2024-11-09', '2024-11-10', 1, 1, 60.00, 9),
('2024-11-10', '2024-11-11', 0, 0, 110.00, 10);

-- Insert dữ liệu mẫu cho bảng ProductRating
INSERT INTO ProductRating (Stars, RatingContent, PRDateCreated, ProductId, CustomerId) VALUES
(5, N'Excellent product!', '2024-11-01', 1, 1),
(4, N'Good, but could be better.', '2024-11-02', 2, 2),
(3, N'Average taste.', '2024-11-03', 3, 3),
(5, N'Highly recommend!', '2024-11-04', 4, 4),
(2, N'Too sweet for my taste.', '2024-11-05', 5, 5),
(4, N'Pretty good.', '2024-11-06', 6, 6),
(5, N'Fresh and tasty!', '2024-11-07', 7, 7),
(4, N'Good bread.', '2024-11-08', 8, 8),
(5, N'Very juicy steak.', '2024-11-09', 9, 9),
(3, N'Tasty but expensive.', '2024-11-10', 10, 10);


-- Insert dữ liệu mẫu cho bảng Token
INSERT INTO Token (CustomerUserName, TokenValue, Expiry) VALUES
(N'nguyenlan', N'TokenValue1', '2024-12-01'),
(N'phamtul', N'TokenValue2', '2024-12-02'),
(N'lehoa', N'TokenValue3', '2024-12-03'),
(N'trinhthu', N'TokenValue4', '2024-12-04'),
(N'hoangmai', N'TokenValue5', '2024-12-05'),
(N'nguyentuan', N'TokenValue6', '2024-12-06'),
(N'phanthson', N'TokenValue7', '2024-12-07'),
(N'vumkien', N'TokenValue8', '2024-12-08'),
(N'tranbich', N'TokenValue9', '2024-12-09'),
(N'phanmai', N'TokenValue10', '2024-12-10');

-- Insert dữ liệu mẫu cho bảng Banner
INSERT INTO Banner (BannerName, ProductDiscount, BannerPrice, BannerDescription, BannerImage, BannerDateCreated) VALUES
(N'Summer Sale', 20, 19.99, N'Discount on fruits and veggies.', N'images/banner1.jpg', '2024-11-01'),
(N'Winter Special', 15, 25.99, N'Discount on dairy products.', N'images/banner2.jpg', '2024-11-02'),
(N'Spring Offer', 10, 5.99, N'Snacks at discounted prices.', N'images/banner3.jpg', '2024-11-03'),
(N'Seafood Sale', 25, 30.99, N'Get fresh seafood with a 25% discount.', N'images/banner4.jpg', '2024-11-04'),
(N'Organic Foods', 10, 35.99, N'Special offer on organic products.', N'images/banner5.jpg', '2024-11-05'),
(N'Bakery Delight', 15, 7.99, N'Fresh bakery items at great prices.', N'images/banner6.jpg', '2024-11-06'),
(N'Ice Cream Deal', 20, 12.99, N'Discount on all ice cream varieties.', N'images/banner7.jpg', '2024-11-07'),
(N'Vegan Protein', 10, 18.99, N'Explore vegan protein products.', N'images/banner8.jpg', '2024-11-08'),
(N'Meats Galore', 30, 49.99, N'Special offers on meats and steaks.', N'images/banner9.jpg', '2024-11-09'),
(N'Frozen Foods', 5, 12.99, N'Discount on all frozen food items.', N'images/banner10.jpg', '2024-11-10');

-- Insert dữ liệu mẫu cho bảng OrderDetail
INSERT INTO OrderDetail (OrderId, ProductId, UnitPrice, Quantity) VALUES
(1, 1, 10.99, 5),
(2, 2, 5.99, 10),
(3, 3, 3.49, 4),
(4, 4, 15.99, 2),
(5, 5, 20.99, 3),
(6, 6, 3.99, 5),
(7, 7, 25.99, 2),
(8, 8, 2.99, 6),
(9, 9, 50.99, 1),
(10, 10, 7.99, 3);

-- Insert dữ liệu mẫu cho bảng Favorite
INSERT INTO Favorite (ProductId, CustomerId, PRDateCreated) VALUES
(1, 1, '2024-11-01'),
(2, 2, '2024-11-02'),
(3, 3, '2024-11-03'),
(4, 4, '2024-11-04'),
(5, 5, '2024-11-05'),
(6, 6, '2024-11-06'),
(7, 7, '2024-11-07'),
(8, 8, '2024-11-08'),
(9, 9, '2024-11-09'),
(10, 10, '2024-11-10');

-- Insert dữ liệu mẫu cho bảng EFMigrationsHistory
INSERT INTO EFMigrationsHistory (MigrationId, ProductVersion) VALUES
('2024110101', '1.0.0'),
('2024110201', '1.0.1'),
('2024110301', '1.0.2'),
('2024110401', '1.1.0'),
('2024110501', '1.1.1'),
('2024110601', '1.1.2'),
('2024110701', '1.2.0'),
('2024110801', '1.2.1'),
('2024110901', '1.2.2'),
('2024111001', '1.3.0');
