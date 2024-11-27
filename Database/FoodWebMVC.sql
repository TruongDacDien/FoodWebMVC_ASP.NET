CREATE DATABASE FoodWebMVC;
GO

USE FoodWebMVC;
GO
    
CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(255),
    CategoryDateCreated DATETIME
);
GO

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
GO

CREATE TABLE Blog (
    BlogId INT IDENTITY(1,1) PRIMARY KEY,
    BlogName NVARCHAR(255),
    BlogContent NVARCHAR(MAX),
    BlogImage NVARCHAR(MAX),
    BlogDateCreated DATETIME
);
GO

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
GO

CREATE TABLE Admin (
    AdminId INT IDENTITY(1,1) PRIMARY KEY,
    AdminUserName NVARCHAR(50) UNIQUE,
    AdminPassword NVARCHAR(255),
    AdminEmail NVARCHAR(255),
    AdminImage NVARCHAR(MAX),
    AdminDateCreated DATETIME
);
GO

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
GO

CREATE TABLE OrderDetail (
    OrderId INT,
    ProductId INT,
    UnitPrice MONEY,
    Quantity INT,
    PRIMARY KEY (OrderId, ProductId),
    FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);
GO

CREATE TABLE Favorite (
    ProductId INT,
    CustomerId INT,
    PRDateCreated DATETIME,
    PRIMARY KEY (ProductId, CustomerId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);
GO

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
GO

CREATE TABLE Token (
    TokenID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerUserName NVARCHAR(50),
    TokenValue NVARCHAR(255),
    Expiry DATETIME
);
GO

CREATE TABLE Banner (
    BannerId INT IDENTITY(1,1) PRIMARY KEY,
    BannerName NVARCHAR(255),
    ProductDiscount INT,
    BannerPrice MONEY,
    BannerDescription NVARCHAR(MAX),
    BannerImage NVARCHAR(MAX),
    BannerDateCreated DATETIME
);
GO

CREATE TABLE EFMigrationsHistory (
    MigrationId NVARCHAR(150) PRIMARY KEY,
    ProductVersion NVARCHAR(32)
);
GO

-- Insert dữ liệu mẫu cho bảng Categories
INSERT INTO Categories (CategoryName, CategoryDateCreated) VALUES
(N'Đồ ăn vặt Việt Nam', '2024-11-01'),
(N'Đồ ăn vặt quốc tế', '2024-11-02'),
(N'Đồ ăn vặt đóng gói', '2024-11-03'),
(N'Đồ uống', '2024-11-04')

-- Insert dữ liệu mẫu cho bảng Product (Đồ ăn vặt Việt Nam)
INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductAmount, ProductDiscount, ProductImage, ProductDateCreated, CategoryId, ProductRating) VALUES
(N'Bánh Tráng Nướng', 15000, N'Bánh tráng nướng giòn với gia vị đặc trưng', 150, 5, N'banhtrangnuong.jpg', '2024-11-01', 1, 4),
(N'Chè Ba Màu', 25000, N'Chè ba màu thơm ngon với đậu xanh, đậu đỏ, thạch dừa', 200, 10, N'chebamau.jpg', '2024-11-02', 1, 5),
(N'Bánh Xèo', 30000, N'Bánh xèo giòn rụm với nhân tôm thịt', 80, 15, N'banhxeo.jpg', '2024-11-03', 1, 4),
(N'Nem Chua', 20000, N'Nem chua chấm mắm tỏi ớt, ăn kèm với rau sống', 120, 10, N'nemchua.jpg', '2024-11-04', 1, 4),
(N'Gỏi Cuốn', 18000, N'Gỏi cuốn tươi ngon với tôm, bún, rau sống', 100, 5, N'goicuon.jpg', '2024-11-05', 1, 5),
(N'Ốc Luộc', 36000, N'Ốc luộc chấm mắm gừng', 150, 10, N'ocluoc.jpg', '2024-11-06', 1, 4),
(N'Khoai Môn Chiên', 12000, N'Khoai môn chiên giòn, ăn kèm với nước mắm', 200, 8, N'khoaimonchien.jpg', '2024-11-07', 1, 4),
(N'Chân Gà Nướng', 50000, N'Chân gà nướng gia vị thơm ngon, cay nồng', 80, 5, N'changanuong.jpg', '2024-11-08', 1, 5),
(N'Bánh Trôi Nước', 20000, N'Bánh trôi nước nhân đậu xanh, nước đường ngọt thanh', 120, 10, N'banhtroinuoc.jpg', '2024-11-09', 1, 4),
(N'Xoài Lắc', 10000, N'Xoài xanh lắc muối ớt, chua cay hấp dẫn', 200, 8, N'xoailac.jpg', '2024-11-10', 1, 5);

-- Insert dữ liệu mẫu cho bảng Product (Đồ ăn vặt quốc tế)
INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductAmount, ProductDiscount, ProductImage, ProductDateCreated, CategoryId, ProductRating) VALUES
(N'Pizza Margherita', 30000, N'Pizza Ý với phô mai mozzarella và sốt cà chua', 100, 5, N'pizzamargherita.jpg', '2024-11-01', 2, 4),
(N'Sushi', 36000, N'Sushi tươi ngon với các loại cá sống và rong biển', 150, 10, N'sushi.jpg', '2024-11-02', 2, 5),
(N'Hot Dog', 18000, N'Hot dog với xúc xích và sốt mù tạt', 200, 8, N'hotdog.jpg', '2024-11-03', 2, 4),
(N'Tacos', 11000, N'Tacos nhân thịt gà, rau sống và sốt salsa', 120, 10, N'tacos.jpg', '2024-11-04', 2, 5),
(N'Falafel', 16000, N'Falafel chiên giòn với hummus và rau sống', 100, 5, N'falafel.jpg', '2024-11-05', 2, 4),
(N'Pasta Carbonara', 23000, N'Pasta Ý với sốt kem, thịt xông khói và phô mai', 80, 10, N'pastacarbonara.jpg', '2024-11-06', 2, 5),
(N'Fish & Chips', 20000, N'Fish & chips với cá chiên giòn và khoai tây chiên', 150, 5, N'fishandchips.jpg', '2024-11-07', 2, 4),
(N'Poutine', 15000, N'Poutine với khoai tây chiên, phô mai curd và nước sốt thịt', 100, 8, N'poutine.jpg', '2024-11-08', 2, 5),
(N'Burger', 15000, N'Burger với thịt bò, phô mai và rau sống', 200, 5, N'burger.jpg', '2024-11-09', 2, 4),
(N'Croissant', 10000, N'Croissant bơ mềm, vỏ giòn, thơm ngon', 80, 5, N'croissant.jpg', '2024-11-10', 2, 5);

-- Insert dữ liệu mẫu cho bảng Product (Đồ ăn vặt đóng gói)
INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductAmount, ProductDiscount, ProductImage, ProductDateCreated, CategoryId, ProductRating) VALUES
(N'Chips Khoai Tây', 20000, N'Chips khoai tây giòn tan, nhiều hương vị', 300, 10, N'chipskhoaitay.jpg', '2024-11-01', 3, 4),
(N'Kẹo Dẻo', 22000, N'Kẹo dẻo với nhiều hương vị trái cây', 500, 5, N'keodeo.jpg', '2024-11-02', 3, 5),
(N'Sô Cô La', 18000, N'Sô cô la đen nguyên chất, thơm ngon', 100, 8, N'socola.jpg', '2024-11-03', 3, 4),
(N'Kẹo Mút', 15000, N'Kẹo mút nhiều màu sắc, ngọt ngào', 600, 5, N'keomut.jpg', '2024-11-04', 3, 5),
(N'Bánh Quy', 80000, N'Bánh quy bơ thơm, giòn tan', 200, 10, N'banhquy.jpg', '2024-11-05', 3, 4),
(N'Nước Ép Trái Cây', 18000, N'Nước ép trái cây đóng chai, tươi ngon', 250, 12, N'nuocep.jpg', '2024-11-06', 3, 4),
(N'Mì Gói', 5000, N'Mì gói ăn liền, tiện lợi', 500, 15, N'migoi.jpg', '2024-11-07', 3, 3),
(N'Bánh Bông Lan', 44000, N'Bánh bông lan mềm mịn, thơm ngon', 300, 5, N'banhbonglan.jpg', '2024-11-08', 3, 4),
(N'Váng Sữa', 30000, N'Váng sữa kem, thơm béo', 400, 8, N'vangsua.jpg', '2024-11-09', 3, 5),
(N'Tea Bag', 22000, N'Tea bag với nhiều loại hương vị trà', 350, 5, N'teabag.jpg', '2024-11-10', 3, 4);


-- Insert dữ liệu mẫu cho bảng Product (Đồ uống)
INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductAmount, ProductDiscount, ProductImage, ProductDateCreated, CategoryId, ProductRating) VALUES
(N'Trà Sữa', 25000, N'Trà sữa với topping trân châu, thơm ngon', 150, 10, N'trasua.jpg', '2024-11-01', 4, 5),
(N'Nước Mía', 10000, N'Nước mía tươi, mát lạnh', 200, 5, N'nuocmia.jpg', '2024-11-02', 4, 4),
(N'Trái Cây Ép', 15000, N'Nước ép trái cây tươi nguyên chất', 180, 8, N'traicayep.jpg', '2024-11-03', 4, 5),
(N'Nước Dừa', 15000, N'Nước dừa tươi, ngọt mát', 250, 10, N'nuocdua.jpg', '2024-11-04', 4, 4),
(N'Nước Chanh', 15000, N'Nước chanh tươi, chua ngọt', 300, 5, N'nuocchanh.jpg', '2024-11-05', 4, 5),
(N'Cà Phê', 28000, N'Cà phê đen đậm đà', 120, 8, N'caphe.jpg', '2024-11-06', 4, 5),
(N'Matcha Latte', 30000, N'Matcha latte thơm ngọt', 150, 5, N'matchalatte.jpg', '2024-11-07', 4, 4),
(N'Sinh Tố', 25000, N'Sinh tố trái cây mix, bổ dưỡng', 100, 12, N'sinhto.jpg', '2024-11-08', 4, 5),
(N'Beer', 35000, N'Bia lạnh, tươi ngon', 80, 15, N'beer.jpg', '2024-11-09', 4, 4),
(N'Cocktail', 50000, N'Cocktail pha chế từ các loại trái cây', 50, 10, N'cocktail.jpg', '2024-11-10', 4, 5);

INSERT INTO Blog (BlogName, BlogContent, BlogImage, BlogDateCreated) VALUES
-- Bài viết về món ăn vặt Việt Nam
(N'Bánh Tráng Nướng - Tinh Hoa Đường Phố Việt Nam', 
N'Bánh tráng nướng là một trong những món ăn vặt nổi tiếng nhất Việt Nam. Với lớp bánh giòn tan, kết hợp cùng trứng, hành lá, xúc xích và gia vị đặc trưng, món ăn này không chỉ hấp dẫn mà còn thể hiện sự sáng tạo của ẩm thực đường phố Việt Nam.', 
N'blog_banhtrangnuong.jpg', '2024-11-01'),

-- Bài viết về món ăn vặt quốc tế
(N'Sushi - Nghệ Thuật Ẩm Thực Nhật Bản', 
N'Sushi không chỉ là món ăn mà còn là một nghệ thuật. Với sự kết hợp tinh tế giữa cơm dẻo, cá tươi và rong biển, sushi mang đến hương vị đặc biệt và giá trị dinh dưỡng cao, rất phù hợp cho những người yêu thích ẩm thực quốc tế.', 
N'blog_sushi.jpg', '2024-11-02'),

-- Bài viết về đồ ăn vặt đóng gói
(N'Chips Khoai Tây - Món Ăn Vặt Quốc Dân', 
N'Chips khoai tây là món ăn vặt đóng gói phổ biến ở mọi nơi. Với vị giòn rụm và nhiều hương vị đa dạng như phô mai, BBQ, và muối, chips khoai tây luôn là lựa chọn hàng đầu cho những bữa ăn nhẹ nhanh gọn.', 
N'blog_chipskhoaitay.jpg', '2024-11-03'),

-- Bài viết về đồ uống
(N'Trà Sữa - Hương Vị Yêu Thích Của Giới Trẻ', 
N'Trà sữa là một trong những đồ uống phổ biến nhất tại Việt Nam và trên thế giới. Với hương vị ngọt ngào, kết hợp cùng các loại topping như trân châu, pudding, hay thạch, trà sữa luôn là lựa chọn hoàn hảo để giải nhiệt và thư giãn.', 
N'blog_trasua.jpg', '2024-11-04'),

-- Bài viết về món ăn vặt Việt Nam
(N'Nem Chua - Tinh Túy Ẩm Thực Miền Bắc', 
N'Nem chua là món ăn truyền thống nổi tiếng của Việt Nam, đặc biệt phổ biến ở miền Bắc. Với vị chua nhẹ, dai dai của thịt lợn lên men kết hợp cùng lá đinh lăng, tỏi ớt, nem chua là món ăn không thể thiếu trong các bữa tiệc hay những buổi họp mặt bạn bè.', 
N'blog_nemchua.jpg', '2024-11-05'),

-- Bài viết về món ăn vặt quốc tế
(N'Pizza - Biểu Tượng Ẩm Thực Ý', 
N'Pizza đã trở thành món ăn vặt nổi tiếng toàn cầu, nhưng nguồn gốc của nó đến từ nước Ý. Với lớp đế giòn, sốt cà chua đậm đà, phô mai béo ngậy và các loại topping đa dạng, pizza luôn là món ăn phù hợp cho mọi lứa tuổi.', 
N'blog_pizza.jpg', '2024-11-06'),

-- Bài viết về đồ uống
(N'Cà Phê Sữa - Hương Vị Của Sự Gắn Kết', 
N'Cà phê sữa là sự kết hợp hoàn hảo giữa vị đắng đậm của cà phê và vị ngọt dịu của sữa đặc. Đây không chỉ là một loại đồ uống mà còn là nét văn hóa gắn liền với đời sống người Việt, đặc biệt vào mỗi buổi sáng hay những khoảnh khắc cần thư giãn.', 
N'blog_caphesua.jpg', '2024-11-07');


-- Insert dữ liệu mẫu cho bảng Admin--Mật khẩu là 123
INSERT INTO Admin (AdminUserName, AdminPassword, AdminEmail, AdminImage, AdminDateCreated) VALUES
(N'admin', '20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'admin@gmail.com', N'admin.jpg', '2024-11-01')

-- Insert dữ liệu mẫu cho bảng Banner
INSERT INTO Banner (BannerName, ProductDiscount, BannerPrice, BannerDescription, BannerImage, BannerDateCreated) VALUES
(N'Bánh Tráng Nướng', 5, 15000, N'Bánh tráng nướng giòn với gia vị đặc trưng', N'banhtrangnuong.jpg', '2024-11-01'),
(N'Chè Ba Màu', 10, 25000, N'Chè ba màu thơm ngon với đậu xanh, đậu đỏ, thạch dừa', N'chebamau.jpg', '2024-11-02'),
(N'Bánh Xèo', 15, 30000, N'Bánh xèo giòn rụm với nhân tôm thịt', N'banhxeo.jpg', '2024-11-03'),
(N'Pizza Margherita', 5, 30000, N'Pizza Ý hương vị truyền thống', N'pizzamargherita.jpg', '2024-11-04'),
(N'Chips Khoai Tây', 10, 20000, N'Chips khoai tây giòn tan', N'chipskhoaitay.jpg', '2024-11-05'),
(N'Cocktail', 10, 50000, N'Cocktail trái cây tươi mát', N'cocktail.jpg', '2024-11-06'),
(N'Xoài Lắc', 8, 10000, N'Xoài xanh lắc muối ớt hấp dẫn', N'xoailac.jpg', '2024-11-07'),
(N'Trái Cây Ép', 8, 15000, N'Nước ép trái cây tươi nguyên chất', N'traicayep.jpg', '2024-11-08'),
(N'Bánh Bông Lan', 5, 44000, N'Bánh bông lan mềm xốp, thơm ngon', N'banhbonglan.jpg', '2024-11-09'),
(N'Fish & Chips', 5, 20000, N'Cá chiên giòn và khoai tây chiên', N'fishandchips.jpg', '2024-11-10');





