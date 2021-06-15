USE [Turisma]
GO

-- 1
CREATE PROCEDURE cityRoutes
    @city NVARCHAR(200)
AS
SELECT Title FROM Routes r JOIN City c ON r.IdCity = c.Id WHERE NAME = @city;