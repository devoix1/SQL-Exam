USE [Turisma]
GO

-- 8
CREATE PROCEDURE routeComments
    @title NVARCHAR(200)
AS
SELECT fb.Rating, fb.Comment FROM FeedBack fb JOIN Routes r ON fb.IdRoute = r.Id WHERE r.Title = @title;