CREATE TABLE [Color] (
    ColorId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Color PRIMARY KEY (ColorId)
);

CREATE TABLE [Size] (
    SizeId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Size PRIMARY KEY (SizeId)
);

CREATE TABLE [ProductVariant] (
    ProductVariantId INT IDENTITY(1,1) NOT NULL,
    ProductId INT NOT NULL,
    ColorId INT NOT NULL,
    SizeId INT NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    IsMain BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_ProductVariant PRIMARY KEY (ProductVariantId),
    CONSTRAINT FK_ProductVariant_Product FOREIGN KEY (ProductId) REFERENCES [Product](ProductId),
    CONSTRAINT FK_ProductVariant_Color FOREIGN KEY (ColorId) REFERENCES Color(ColorId),
    CONSTRAINT FK_ProductVariant_Size FOREIGN KEY (SizeId) REFERENCES Size(SizeId),
    CONSTRAINT UQ_ProductVariant UNIQUE (ProductId, ColorId, SizeId)
);

CREATE UNIQUE INDEX UX_ProductVariant_ProductId_IsMain
ON [ProductVariant](ProductId)
WHERE IsMain = 1;