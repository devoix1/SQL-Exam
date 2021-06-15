USE [Turisma]
GO

-- 7
CREATE PROCEDURE routePointskart
    @title NVARCHAR(200)
AS
SELECT rp.Latitude, rp.Longitude FROM RoutePoints rp JOIN Routes r ON rp.IdRoute = r.Id WHERE r.Title = @title;