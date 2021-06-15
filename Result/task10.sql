USE [Turisma]
GO

-- 10
CREATE PROCEDURE regUserWithFB
    @firstname NVARCHAR(200),
    @lastname NVARCHAR(200),
    @fb NVARCHAR(200)
AS
INSERT INTO Users(FIrstName, LastName, Mail, FB) VALUES (@firstname, @lastname, NULL, @fb)