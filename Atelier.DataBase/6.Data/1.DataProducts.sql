-----Data 
INSERT INTO Brand (Name)
VALUES 
('UrbanStyle'),
('ClassicWear'),
('FreshLook'),
('TropicalVibes'),
('DenimEdge');

INSERT INTO Product (BrandId, Name, Description, Price)
VALUES 
(1, 'Camisa Clásica Blanca', 'Camisa de algodón blanca, manga larga.', 20000),
(1, 'Camisa Formal Azul', 'Camisa azul ideal para ocasiones formales.', 40000),
(1, 'Camisa Casual Rayada', 'Camisa de rayas horizontales, look relajado.', 100000),
(1, 'Camisa Denim Oscura', 'Camisa de mezclilla azul oscuro.', 200000),
(1, 'Camisa Polo Roja', 'Camisa tipo polo, cómoda y fresca.', 150000),
(1, 'Camisa Manga Corta Negra', 'Camisa negra ideal para el verano.', 35000),
(1, 'Camisa Slim Fit Blanca', 'Diseño entallado para un look moderno.', 50000),
(1, 'Camisa Estampada Tropical', 'Camisa con estampado floral, ideal para vacaciones.', 30000),
(1, 'Camisa de Lino Beige', 'Camisa de lino para climas cálidos.', 80000),
(1, 'Camisa de Franela Roja', 'Camisa de franela roja a cuadros.', 70000);

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