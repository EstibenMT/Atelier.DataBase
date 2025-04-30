INSERT INTO Category (Name) VALUES 
('Camisas'),
('Casual'),
('Formal'),
('Verano'),
('Estampadas'),
('Polo'),
('Franela'),
('Slim Fit');

-- Producto 3: Camisa Casual Rayada → Camisas, Casual
INSERT INTO ProductCategory (CategoryId, ProductId) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),

-- Producto 4: Camisa Denim Oscura → Camisas, Casual
(1, 4),
(2, 4),

-- Producto 5: Camisa Polo Roja → Camisas, Polo
(1, 5),
(6, 5),

-- Producto 6: Camisa Manga Corta Negra → Camisas, Verano
(1, 6),
(4, 6),

-- Producto 7: Camisa Slim Fit Blanca → Camisas, Slim Fit
(1, 7),
(8, 7),

-- Producto 8: Camisa Estampada Tropical → Camisas, Estampadas, Verano
(1, 8),
(4, 8),
(5, 8),

-- Producto 9: Camisa de Lino Beige → Camisas, Verano
(1, 9),
(4, 9),

-- Producto 10: Camisa de Franela Roja → Camisas, Franela
(1, 10),
(7, 10);