-----Data 
INSERT INTO Brand (Name)
VALUES 
('UrbanStyle'),
('ClassicWear'),
('FreshLook'),
('TropicalVibes'),
('DenimEdge');

INSERT INTO Product (BrandId, Name, Description, Price, Stock)
VALUES 
(1, 'Camisa Clásica Blanca', 'Camisa de algodón blanca, manga larga.', 49.99, 100),
(1, 'Camisa Formal Azul', 'Camisa azul ideal para ocasiones formales.', 54.99, 80),
(1, 'Camisa Casual Rayada', 'Camisa de rayas horizontales, look relajado.', 39.99, 120),
(1, 'Camisa Denim Oscura', 'Camisa de mezclilla azul oscuro.', 59.99, 60),
(1, 'Camisa Polo Roja', 'Camisa tipo polo, cómoda y fresca.', 34.99, 90),
(1, 'Camisa Manga Corta Negra', 'Camisa negra ideal para el verano.', 29.99, 150),
(1, 'Camisa Slim Fit Blanca', 'Diseño entallado para un look moderno.', 52.99, 75),
(1, 'Camisa Estampada Tropical', 'Camisa con estampado floral, ideal para vacaciones.', 42.50, 50),
(1, 'Camisa de Lino Beige', 'Camisa de lino para climas cálidos.', 64.00, 40),
(1, 'Camisa de Franela Roja', 'Camisa de franela roja a cuadros.', 44.90, 110);

INSERT INTO [ProductImage] (ProductId, ImageUrl, IsMain) VALUES 
 (1, 'https://imgur.com/09FQv9N', 1)
,(1, 'https://imgur.com/eaijEJy', 0)
,(1, 'https://imgur.com/Gwbjy1K', 0)
,(2, 'https://imgur.com/eaijEJy', 1)
,(3, 'https://imgur.com/Gwbjy1K', 1)
,(4, 'https://imgur.com/09FQv9N', 1)
,(5, 'https://imgur.com/eaijEJy', 1)
,(6, 'https://imgur.com/Gwbjy1K', 1) 
,(7, 'https://imgur.com/09FQv9N', 1)
,(8, 'https://imgur.com/eaijEJy', 1)
,(9, 'https://imgur.com/Gwbjy1K', 1)
,(10, 'https://imgur.com/09FQv9N', 1); 