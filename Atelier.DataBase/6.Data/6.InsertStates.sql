INSERT INTO State (Name, CountryId)
SELECT es.Name,
       c.CountryId
FROM Estados es
INNER JOIN Country c ON c.CountryId = es.IdCountry