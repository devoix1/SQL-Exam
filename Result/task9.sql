USE [Turisma]
GO

-- 9
CREATE PROCEDURE regUserWithMail
    @firstname NVARCHAR(200),
    @lastname NVARCHAR(200),
    @mail NVARCHAR(200)
AS
INSERT INTO Users(FIrstName, LastName, Mail, FB) VALUES (@firstname, @lastname, @mail,NULL)