USE master
GO

-- CAMBIAR DB A MODO DE USO UNICO
--IF EXISTS (SELECT name FROM sys.databases WHERE name = 'BDAtelier')
--BEGIN
--    ALTER DATABASE [BDAtelier] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--    DROP DATABASE [BDAtelier];
--END
--GO

--CREATE DATABASE BDAtelier;

--GO

USE BDAtelier;

GO

DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql += 'ALTER TABLE [' + sch.name + '].[' + tab.name + '] DROP CONSTRAINT [' + fk.name + '];' + CHAR(13)
FROM sys.foreign_keys fk
INNER JOIN sys.tables tab ON fk.parent_object_id = tab.object_id
INNER JOIN sys.schemas sch ON tab.schema_id = sch.schema_id;

EXEC sp_executesql @sql;
-- DROP TABLES IN DEPENDENCY ORDER

DROP TABLE IF EXISTS FeaturedProductsByUser;
DROP TABLE IF EXISTS FeaturedProductsGeneral;
DROP TABLE IF EXISTS Refund;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS ShoppingCartProduct;
DROP TABLE IF EXISTS ShoppingCart;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS ProductCategory;
DROP TABLE IF EXISTS [Product];
DROP TABLE IF EXISTS Brand;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS MethodType;
DROP TABLE IF EXISTS RoleClaim;
DROP TABLE IF EXISTS Claim;
DROP TABLE IF EXISTS [Notification];
DROP TABLE IF EXISTS [Address];
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS [State];
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS [User];
DROP TABLE IF EXISTS [Role];
DROP TABLE IF EXISTS DocumentType;

-- CREATE TABLES WITH RENAMED IDS

CREATE TABLE DocumentType (
    DocumentTypeId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_DocumentType PRIMARY KEY (DocumentTypeId)
);

CREATE TABLE Role (
    RoleId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_Role PRIMARY KEY (RoleId)
);

CREATE TABLE [User] (
    UserId INT IDENTITY(1,1) NOT NULL,
    RoleId INT,
    Name NVARCHAR(100),
    Email NVARCHAR(150),
    Password NVARCHAR(100),
    Phone NVARCHAR(20),
    DocumentTypeId INT,
    CONSTRAINT PK_User PRIMARY KEY (UserId)
);

CREATE TABLE Country (
    CountryId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_Country PRIMARY KEY (CountryId)
);

CREATE TABLE [State] (
    StateId INT IDENTITY(1,1) NOT NULL,
    CountryId INT,
    Name NVARCHAR(100),
    CONSTRAINT PK_State PRIMARY KEY (StateId)
);

CREATE TABLE City (
    CityId INT IDENTITY(1,1) NOT NULL,
    StateId INT,
    Name NVARCHAR(100),
    CONSTRAINT PK_City PRIMARY KEY (CityId)
);

CREATE TABLE [Address] (
    AddressId INT IDENTITY(1,1) NOT NULL,
    UserId INT,
    Complement NVARCHAR(150),
    CountryId INT,
    StateId INT,
    CityId INT,
    PostalCode NVARCHAR(20),
    Description NVARCHAR(200),
    Number NVARCHAR(20),
    CONSTRAINT PK_Address PRIMARY KEY (AddressId)
);

CREATE TABLE [Notification] (
    NotificationId INT IDENTITY(1,1) NOT NULL,
    UserId INT,
    Message NVARCHAR(500),
    Status NVARCHAR(50),
    Date DATE,
    NotificationType NVARCHAR(50),
    CONSTRAINT PK_Notification PRIMARY KEY (NotificationId)
);

CREATE TABLE Brand (
    BrandId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_Brand PRIMARY KEY (BrandId)
);

CREATE TABLE [Product] (
    ProductId INT IDENTITY(1,1) NOT NULL,
    BrandId INT,
    Name NVARCHAR(100),
    Description NVARCHAR(500),
    Price FLOAT,
    Stock INT,
    CONSTRAINT PK_Product PRIMARY KEY (ProductId)
);

CREATE TABLE Category (
    CategoryId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_Category PRIMARY KEY (CategoryId)
);

CREATE TABLE ProductCategory (
    ProductCategoryId INT IDENTITY(1,1) NOT NULL,
    CategoryId INT,
    ProductId INT,
    CONSTRAINT PK_ProductCategory PRIMARY KEY (ProductCategoryId)
);

CREATE TABLE ShoppingCart (
    ShoppingCartId INT IDENTITY(1,1) NOT NULL,
    UserId INT,
    Total FLOAT,
    Tax FLOAT,
    Subtotal FLOAT,
    Active BIT,
    CONSTRAINT PK_ShoppingCart PRIMARY KEY (ShoppingCartId)
);

CREATE TABLE ShoppingCartProduct (
    ShoppingCartProductId INT IDENTITY(1,1) NOT NULL,
    ShoppingCartId INT,
    ProductId INT,
    Quantity INT,
    CONSTRAINT PK_ShoppingCartProduct PRIMARY KEY (ShoppingCartProductId)
);

CREATE TABLE Sale (
    SaleId INT IDENTITY(1,1) NOT NULL,
    ShoppingCartId INT,
    AddressId INT,
    Time TIME,
    Date DATE,
    TotalAmount FLOAT,
    RefundId INT,
    Reason INT NOT NULL,
    CONSTRAINT PK_Sale PRIMARY KEY (SaleId)
);

CREATE TABLE Refund (
    RefundId INT IDENTITY(1,1) NOT NULL,
    SaleId INT,
    ShoppingCartProductId INT,
    RefundDate DATE,
    RefundedAmount FLOAT,
    RefundedQuantity INT,
    RefundReason INT,
    CONSTRAINT PK_Refund PRIMARY KEY (RefundId)
);

CREATE TABLE Review (
    ReviewId INT IDENTITY(1,1) NOT NULL,
    UserId INT,
    ProductId INT,
    Rating INT,
    Comment NVARCHAR(500),
    CreateDate DATE,
    UpdateDate DATE,
    Opinion NVARCHAR(250),
    CONSTRAINT PK_Review PRIMARY KEY (ReviewId)
);

CREATE TABLE Claim (
    ClaimId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_Claim PRIMARY KEY (ClaimId)
);

CREATE TABLE RoleClaim (
    RoleClaimId INT IDENTITY(1,1) NOT NULL,
    RoleId INT,
    ClaimId INT,
    CONSTRAINT PK_RoleClaim PRIMARY KEY (RoleClaimId)
);

CREATE TABLE MethodType (
    MethodTypeId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    CONSTRAINT PK_MethodType PRIMARY KEY (MethodTypeId)
);

CREATE TABLE PaymentMethod (
    PaymentMethodId INT IDENTITY(1,1) NOT NULL,
    UserId INT,
    MethodTypeId INT,
    EncryptedCardName NVARCHAR(100),
    EncryptedCardNumber NVARCHAR(100),
    EncryptedCardCode NVARCHAR(10),
    Details NVARCHAR(200),
    Active BIT,
    CONSTRAINT PK_PaymentMethod PRIMARY KEY (PaymentMethodId)
);

CREATE TABLE Payment (
    PaymentId INT IDENTITY(1,1) NOT NULL,
    PaymentMethodId INT,
    SaleId INT,
    Status INT NOT NULL,
    CONSTRAINT PK_Payment PRIMARY KEY (PaymentId)
);

CREATE TABLE ProductViewLog (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductId INT NOT NULL,
    ViewedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

CREATE TABLE FeaturedProductsGeneral (
	FeaturedProductsGeneralId INT IDENTITY(1,1) NOT NULL,
    ProductId INT NOT NULL,
    FeaturedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_FeaturedProductsGeneral PRIMARY KEY (FeaturedProductsGeneralId),
    CONSTRAINT FK_FeaturedProductsGeneral_ProductId_Product FOREIGN KEY (ProductId) REFERENCES [Product](ProductId)
);

CREATE TABLE FeaturedProductsByUser (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
    FeaturedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_FeaturedProductsByUser_UserId_User FOREIGN KEY (UserId) REFERENCES [User](UserId),
    CONSTRAINT FK_FeaturedProductsByUser_ProductId_Product FOREIGN KEY (ProductId) REFERENCES [Product](ProductId)
);

ALTER TABLE [User] ADD
    CONSTRAINT FK_User_RoleId_Role FOREIGN KEY (RoleId) REFERENCES Role(RoleId),
    CONSTRAINT FK_User_DocumentTypeId_DocumentType FOREIGN KEY (DocumentTypeId) REFERENCES DocumentType(DocumentTypeId);

ALTER TABLE Address ADD
    CONSTRAINT FK_Address_UserId_User FOREIGN KEY (UserId) REFERENCES [User](UserId),
    CONSTRAINT FK_Address_CountryId_Country FOREIGN KEY (CountryId) REFERENCES Country(CountryId),
    CONSTRAINT FK_Address_StateId_State FOREIGN KEY (StateId) REFERENCES State(StateId),
    CONSTRAINT FK_Address_CityId_City FOREIGN KEY (CityId) REFERENCES City(CityId);

ALTER TABLE Notification ADD
    CONSTRAINT FK_Notification_UserId_User FOREIGN KEY (UserId) REFERENCES [User](UserId);

ALTER TABLE [Product] ADD
    CONSTRAINT FK_Product_BrandId_Brand FOREIGN KEY (BrandId) REFERENCES Brand(BrandId);

ALTER TABLE ShoppingCart ADD
    CONSTRAINT FK_ShoppingCart_UserId_User FOREIGN KEY (UserId) REFERENCES [User](UserId);

ALTER TABLE ShoppingCartProduct ADD
    CONSTRAINT FK_ShoppingCartProduct_ShoppingCartId_ShoppingCart FOREIGN KEY (ShoppingCartId) REFERENCES ShoppingCart(ShoppingCartId),
    CONSTRAINT FK_ShoppingCartProduct_ProductId_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

ALTER TABLE Refund ADD
    CONSTRAINT FK_Refund_SaleId_Sale FOREIGN KEY (SaleId) REFERENCES Sale(SaleId),
    CONSTRAINT FK_Refund_ShoppingCartProductId_ShoppingCartProduct FOREIGN KEY (ShoppingCartProductId) REFERENCES ShoppingCartProduct(ShoppingCartProductId);

ALTER TABLE Review ADD
    CONSTRAINT FK_Review_UserId_User FOREIGN KEY (UserId) REFERENCES [User](UserId),
    CONSTRAINT FK_Review_ProductId_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

ALTER TABLE ProductCategory ADD
    CONSTRAINT FK_ProductCategory_CategoryId_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId),
    CONSTRAINT FK_ProductCategory_ProductId_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

ALTER TABLE RoleClaim ADD
    CONSTRAINT FK_RoleClaim_RoleId_Role FOREIGN KEY (RoleId) REFERENCES Role(RoleId),
    CONSTRAINT FK_RoleClaim_ClaimId_Claim FOREIGN KEY (ClaimId) REFERENCES Claim(ClaimId);

ALTER TABLE Payment ADD
    CONSTRAINT FK_Payment_PaymentMethodId_PaymentMethod FOREIGN KEY (PaymentMethodId) REFERENCES PaymentMethod(PaymentMethodId),
    CONSTRAINT FK_Payment_SaleId_Sale FOREIGN KEY (SaleId) REFERENCES Sale(SaleId);

ALTER TABLE PaymentMethod ADD
    CONSTRAINT FK_PaymentMethod_UserId_User FOREIGN KEY (UserId) REFERENCES [User](UserId),
    CONSTRAINT FK_PaymentMethod_MethodTypeId_MethodType FOREIGN KEY (MethodTypeId) REFERENCES MethodType(MethodTypeId);

ALTER TABLE Sale ADD
    CONSTRAINT FK_Sale_ShoppingCartId_ShoppingCart FOREIGN KEY (ShoppingCartId) REFERENCES ShoppingCart(ShoppingCartId),
    CONSTRAINT FK_Sale_AddressId_Address FOREIGN KEY (AddressId) REFERENCES Address(AddressId),
    CONSTRAINT FK_Sale_RefundId_Refund FOREIGN KEY (RefundId) REFERENCES Refund(RefundId);
