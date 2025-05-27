ALTER TABLE ShoppingCart
ADD SessionId NVARCHAR(50) NULL;
GO

CREATE UNIQUE INDEX IX_ShoppingCartProduct_SessionId
ON ShoppingCart(SessionId)
WHERE SessionId IS NOT NULL;
GO

ALTER TABLE ShoppingCart
ADD CreationDate DATETIME2 NOT NULL DEFAULT GETDATE();
GO

---------------------------------------------------------------------------
ALTER TABLE ShoppingCartProduct
ADD ProductVariantId INT NULL;
GO

ALTER TABLE ShoppingCartProduct
ADD Price FLOAT NOT NULL DEFAULT 0;
GO


ALTER TABLE ShoppingCartProduct
ADD CONSTRAINT FK_ShoppingCartProduct_ProductVariantId FOREIGN KEY(ProductVariantId) REFERENCES ProductVariant(ProductVariantId);

-----------------------------------------------------------------------------
ALTER TABLE ShoppingCart
ALTER COLUMN UserId INT NULL;
-----------------------------------------------------------------------------
ALTER TABLE ShoppingCart
ADD AddressId INT NULL;

ALTER TABLE ShoppingCart
ADD CONSTRAINT FK_ShoppingCart_AddressId FOREIGN KEY(AddressId) REFERENCES [Address](AddressId);

ALTER TABLE Sale
ADD Email NVARCHAR(225) NULL,
	Document NVARCHAR(50) NULL;

--------------------------------------------------------------------------
INSERT INTO MethodType(Name) VALUES ('Pagos contra entrega')

UPDATE PaymentMethod SET 
	UserId = NULL	
	,MethodTypeId = 4
	,EncryptedCardName = NULL
	,EncryptedCardNumber = NULL	
	,EncryptedCardCode = NULL	
	,Details = 'Contra entrega'
	,Active = 1
WHERE PaymentMethodId = 1
---------------------------------------------------------------------------
ALTER TABLE Redfund
DROP COLUMN RefundId
----------------------------------------
select * from Address


ALTER TABLE Address
ADD StreetTypeId INT NOT NULL DEFAULT 0;

