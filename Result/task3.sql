USE [Turisma]
GO

-- 3
CREATE PROCEDURE cityRoutesWithTypeSortedByRate
    @city NVARCHAR(200),
	@type NVARCHAR(200)
AS
SELECT Title, Rating FROM Routes r JOIN City c ON r.IdCity = c.Id 
JOIN RouteTypes rt ON r.IdRouteTypes = rt.Id
JOIN RouteRate fb ON fb.IdRoute = r.Id WHERE c.NAME = @city AND rt.NAME = @type ORDER BY Rating;