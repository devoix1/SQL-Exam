USE [Turisma]
GO

-- 4
CREATE PROCEDURE userRoutes
    @firstname NVARCHAR(200),
    @lastname NVARCHAR(200)
AS
SELECT Title FROM Routes r JOIN Users u ON r.IdUser = u.Id WHERE FIrstName = @firstname AND LastName = @lastname;