USE [Turisma]
GO

-- 11
CREATE PROCEDURE addRoute
	@id INT,
	@idUser INT,
	@idRouteTypes INT,
	@idCity INT,
	@time Time,
	@title NVARCHAR(200),
	@description NVARCHAR(200)
AS
INSERT INTO [dbo].[Routes](Id,IdUser,IdRouteTypes,IdCity,Time,Title,Description)
     VALUES (@id,@idUser,@idRouteTypes,@idCity,@time,@title,@description)