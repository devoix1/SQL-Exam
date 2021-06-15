USE [Turisma]
GO

-- 5
CREATE PROCEDURE routeInfo
    @id INT
AS
SELECT Title, Time, Description FROM Routes  WHERE Id = @id;
