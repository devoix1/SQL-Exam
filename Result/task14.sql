USE [Turisma]
GO

-- 14
CREATE PROCEDURE addRate
	@id INT,
    @idRoute INT,
	@idUser INT,
	@rate INT,
	@date NVARCHAR(10)
AS
INSERT INTO [dbo].[FeedBack](Id,IdRoute,IdUser,Rating,Comment,Date) VALUES(@id, @idRoute, @idUser, @rate, NULL, @date)