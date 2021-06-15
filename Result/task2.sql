USE [Turisma]
GO

-- 2
CREATE PROCEDURE cityRoutesWithType
    @city NVARCHAR(200),
	@type NVARCHAR(200)
AS
SELECT Title FROM Routes r JOIN City c ON r.IdCity = c.Id 
JOIN RouteTypes rt ON r.IdRouteTypes = rt.Id WHERE c.NAME = @city AND rt.NAME = @type;