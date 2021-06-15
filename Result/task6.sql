USE [Turisma]
GO

-- 6
CREATE PROCEDURE routePointsList
    @title NVARCHAR(200)
AS
SELECT rp.Title, rp.Description FROM RoutePoints rp JOIN Routes r ON rp.IdRoute = r.Id WHERE r.Title = @title;