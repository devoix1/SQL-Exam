USE [Turisma]
GO

-- 12
CREATE PROCEDURE addRoutePoint
	@idRoute INT,
	@title NVARCHAR(200),
	@description NVARCHAR(200),
	@latitude NVARCHAR(20),
	@longitude NVARCHAR(20)
AS
INSERT INTO RoutePoints (IdRoute,Title,Description,Latitude,Longitude)
     VALUES (@idRoute, @title, @description, @latitude, @longitude)