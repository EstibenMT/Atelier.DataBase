CREATE TABLE ProductImage (
    ProductImageId INT  IDENTITY(1,1) NOT NULL,
    ProductId INT NOT NULL,
    ImageUrl NVARCHAR(MAX) NOT NULL,
	IsMain BIT NOT NULL DEFAULT(0),
	CONSTRAINT PK_Image PRIMARY KEY(ProductImageId),
    CONSTRAINT FK_Image_Product FOREIGN KEY (ProductId) REFERENCES [Product](ProductId)
);