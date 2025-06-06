INSERT INTO City(Name, StateId)
SELECT c.Name,
       s.StateId
FROM Ciudades c
INNER JOIN State s ON s.StateId = c.IdStateProvinceRegion