ALTER TABLE [product]
ADD CountryId INT NULL

ALTER TABLE [product]
ADD CONSTRAINT FK_Product_Country FOREIGN KEY (CountryId) REFERENCES Country(CountryId)