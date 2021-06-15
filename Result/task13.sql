USE [Turisma]
GO

-- 13
CREATE PROCEDURE addComment
	@id INT,
    @idRoute INT,
	@idUser INT,
    @comment NVARCHAR(200),
	@date NVARCHAR(10)
AS
INSERT INTO [dbo].[FeedBack](Id,IdRoute,IdUser,Rating,Comment,Date) VALUES(@id, @idRoute, @idUser, NULL, @comment,@date)