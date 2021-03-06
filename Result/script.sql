USE [master]
GO
/****** Object:  Database [Turisma]    Script Date: 23.02.2021 22:28:56 ******/
CREATE DATABASE [Turisma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Turisma', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Turisma.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Turisma_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Turisma_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Turisma] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Turisma].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Turisma] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Turisma] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Turisma] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Turisma] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Turisma] SET ARITHABORT OFF 
GO
ALTER DATABASE [Turisma] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Turisma] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Turisma] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Turisma] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Turisma] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Turisma] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Turisma] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Turisma] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Turisma] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Turisma] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Turisma] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Turisma] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Turisma] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Turisma] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Turisma] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Turisma] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Turisma] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Turisma] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Turisma] SET  MULTI_USER 
GO
ALTER DATABASE [Turisma] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Turisma] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Turisma] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Turisma] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Turisma] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Turisma] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Turisma] SET QUERY_STORE = OFF
GO
USE [Turisma]
GO
/****** Object:  Table [dbo].[City]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_City_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[Id] [int] NOT NULL,
	[IdRoute] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutePoints]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutePoints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRoute] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Latitude] [nvarchar](20) NOT NULL,
	[Longitude] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_RoutePoints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteRate]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteRate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRoute] [int] NOT NULL,
	[Rating] [numeric](2, 1) NOT NULL,
 CONSTRAINT [PK_RouteRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] NOT NULL,
	[IdUser] [int] NULL,
	[IdRouteTypes] [int] NULL,
	[IdCity] [int] NULL,
	[Time] [time](7) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Routes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteTypes]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_RouteTypes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIrstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Mail] [nvarchar](max) NULL,
	[FB] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users_UserId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'Baku')
INSERT [dbo].[City] ([Id], [Name]) VALUES (2, N'New Zeland')
INSERT [dbo].[City] ([Id], [Name]) VALUES (3, N'Ukraine')
INSERT [dbo].[City] ([Id], [Name]) VALUES (4, N'Dubai')
INSERT [dbo].[City] ([Id], [Name]) VALUES (5, N'Japan')
INSERT [dbo].[City] ([Id], [Name]) VALUES (6, N'Turkey')
INSERT [dbo].[City] ([Id], [Name]) VALUES (7, N'Russia')
INSERT [dbo].[City] ([Id], [Name]) VALUES (8, N'USA')
GO
INSERT [dbo].[FeedBack] ([Id], [IdRoute], [IdUser], [Rating], [Comment], [Date]) VALUES (1, 1, 2, 5, N'Very good', CAST(N'2021-01-22' AS Date))
INSERT [dbo].[FeedBack] ([Id], [IdRoute], [IdUser], [Rating], [Comment], [Date]) VALUES (2, 1, 2, 3, N'Bad', CAST(N'2021-01-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[RoutePoints] ON 

INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (1, 1, N'Vorontsov monument', N'Vorontsov is Novorossiysk and Bessarabian governor-general. It is the second monument in Odessa, built in 1863.', N'46.484122', N'30.731614')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (2, 1, N'Monument to Leonid Utyosov', N'It is a bronze sculpture, erected in memory of the Odessa Soviet artist and singer Leonid Utesov in 2000.', N'46.484739', N'30.734435')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (3, 1, N'The sculpture "Laocoon"', N'It is a marble sculpture, a copy of the famous sculpture "Laocoon and His Sons", set in front of the Odessa Archaeological Museum.', N'46.485326', N'30.742525')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (4, 1, N'Monument to Alexander Pushkin', N'It was built in 1887-1889 in Odessa on the Primorskiy Boulevard with funds donated by Odessa citizens. It is the third monument in Odessa.', N'46.486105', N'30.743592')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (5, 1, N'Monument to Duke de Richelieu', N'It is a bronze statue, dedicated to Armand Emmanuel du Plessis, Duc de Richelieu, opened in 1828. The first monument erected in Odessa.', N'46.488151', N'30.741154')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (6, 1, N'Monument to the founders of Odessa', N'Monument to Catherine the Great and her companions: de Ribas de flounce, Potemkin and Zubov. Located in Odessa on Catherine Square.', N'46.487331', N'30.73925')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (7, 1, N'The monument to the heart', N'On the art object "Heart in love" Odessa couples hang their locks, concluding loyalty and strength of love.', N'46.490534', N'30.736055')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (8, 1, N'Golden child', N'It is a bronze sculpture by sculptor Ernst Neizvestny, set at the Odessa Marine Station in 1995.', N'46.490118', N'30.745318')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (9, 1, N'Potemkin monument', N'The monument shows the scene of shotting of rebellious sailors, set in 1965.', N'46.484938', N'30.74705')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (10, 1, N'Babel monument', N'The monument to the writer Isaac Babel, set on Zhukovsky Street in 2011.', N'46.479804', N'30.739711')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (11, 1, N'Gotsman monument', N'It is dedicated to the image of the Odessa police officer after wartime. Gotsman - the main hero of the television series "Liquidation".', N'46.478095', N'30.742946')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (12, 1, N'Monument to Taras Shevchenko', N'Taras Shevchenko is Ukrainian and Russian poet, writer and artist. The monument was erected in 1966.', N'46.479349', N'30.750722')
INSERT [dbo].[RoutePoints] ([Id], [IdRoute], [Title], [Description], [Latitude], [Longitude]) VALUES (13, 1, N'Monument to soldiers-internationalists', N'The monument is dedicated to the 220 died Odessa soldiers in Afghanistan, set in 2000.', N'46.479432', N'30.758744')
SET IDENTITY_INSERT [dbo].[RoutePoints] OFF
GO
SET IDENTITY_INSERT [dbo].[RouteRate] ON 

INSERT [dbo].[RouteRate] ([Id], [IdRoute], [Rating]) VALUES (1, 1, CAST(4.0 AS Numeric(2, 1)))
SET IDENTITY_INSERT [dbo].[RouteRate] OFF
GO
INSERT [dbo].[Routes] ([Id], [IdUser], [IdRouteTypes], [IdCity], [Time], [Title], [Description]) VALUES (1, 1, 1, 1, CAST(N'04:30:00' AS Time), N'Monuments of Odessa', N'The most interesting and popular monuments in the center of Odessa')
INSERT [dbo].[Routes] ([Id], [IdUser], [IdRouteTypes], [IdCity], [Time], [Title], [Description]) VALUES (2, 1, 2, 2, CAST(N'04:30:00' AS Time), N'Monuments of Kiev', N'The most interesting and popular monuments in the center of Kiev')
INSERT [dbo].[Routes] ([Id], [IdUser], [IdRouteTypes], [IdCity], [Time], [Title], [Description]) VALUES (3, 2, 1, 3, CAST(N'04:30:00' AS Time), N'First Step in Baku', N'The most interesting and popular places in the center of Baku')
GO
INSERT [dbo].[RouteTypes] ([Id], [Name]) VALUES (1, N'Walking')
INSERT [dbo].[RouteTypes] ([Id], [Name]) VALUES (2, N'Transit')
INSERT [dbo].[RouteTypes] ([Id], [Name]) VALUES (3, N'Driving')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [Mail], [FB]) VALUES (1, N'Billy', N'Herrington', N'billyistheboss@gmail.com', N'Boss of the @GYM')
INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [Mail], [FB]) VALUES (2, N'Van', N'Darkholme', N'vanistheslave@gmail.com', N'Slave of the @GYM')
INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [Mail], [FB]) VALUES (3, N'Ivan', N'Petrov', N'ttt@mail.ru', NULL)
INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [Mail], [FB]) VALUES (4, N'Андрей', N'Сидоров', N'Finder@mail.ru', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_IdRoute] FOREIGN KEY([IdRoute])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_IdRoute]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_IdUser]
GO
ALTER TABLE [dbo].[RoutePoints]  WITH CHECK ADD  CONSTRAINT [FK_RoutePoints_IdRoute] FOREIGN KEY([IdRoute])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[RoutePoints] CHECK CONSTRAINT [FK_RoutePoints_IdRoute]
GO
ALTER TABLE [dbo].[RouteRate]  WITH CHECK ADD  CONSTRAINT [FK_RouteRate_IdRoute] FOREIGN KEY([IdRoute])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[RouteRate] CHECK CONSTRAINT [FK_RouteRate_IdRoute]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_IdCity] FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_IdCity]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_IdRouteTypes] FOREIGN KEY([IdRouteTypes])
REFERENCES [dbo].[RouteTypes] ([Id])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_IdRouteTypes]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_IdUser]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [CHK_City_Firstname] CHECK  (([Name]<>N'%[0-9]%' AND [Name] IS NOT NULL AND [Name]<>N''))
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [CHK_City_Firstname]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [CHK_City_Id] CHECK  (([Id] IS NOT NULL))
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [CHK_City_Id]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [CHK_Routes_Description] CHECK  (([Description] IS NOT NULL AND [Description]<>N''))
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [CHK_Routes_Description]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [CHK_Routes_Id] CHECK  (([Id] IS NOT NULL))
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [CHK_Routes_Id]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [CHK_Routes_Time] CHECK  (([Time] IS NOT NULL))
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [CHK_Routes_Time]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [CHK_Routes_Title] CHECK  (([Title] IS NOT NULL AND [Title]<>N''))
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [CHK_Routes_Title]
GO
ALTER TABLE [dbo].[RouteTypes]  WITH CHECK ADD  CONSTRAINT [CHK_RouteTypes_Id] CHECK  (([Id] IS NOT NULL))
GO
ALTER TABLE [dbo].[RouteTypes] CHECK CONSTRAINT [CHK_RouteTypes_Id]
GO
ALTER TABLE [dbo].[RouteTypes]  WITH CHECK ADD  CONSTRAINT [CHK_RouteTypes_Name] CHECK  (([Name] IS NOT NULL AND [Name]<>N''))
GO
ALTER TABLE [dbo].[RouteTypes] CHECK CONSTRAINT [CHK_RouteTypes_Name]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Users_FB] CHECK  (([FB] like N'%[@]%' AND [FB]<>N''))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Users_FB]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Users_Firstname] CHECK  (([FirstName]<>N'%[0-9]%' AND [FirstName] IS NOT NULL AND [FirstName]<>N''))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Users_Firstname]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Users_Id] CHECK  (([Id] IS NOT NULL))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Users_Id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Users_Lastname] CHECK  (([LastName]<>N'%[0-9]%' AND [LastName] IS NOT NULL AND [LastName]<>N''))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Users_Lastname]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Users_Mail] CHECK  (([Mail] like N'%[@]%' AND [Mail]<>N''))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Users_Mail]
GO
/****** Object:  StoredProcedure [dbo].[cityRoutes]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 1
CREATE PROCEDURE [dbo].[cityRoutes]
    @city NVARCHAR(200)
AS
SELECT Title FROM Routes r JOIN City c ON r.IdCity = c.Id WHERE NAME = @city;
GO
/****** Object:  StoredProcedure [dbo].[cityRoutesWithType]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 2
CREATE PROCEDURE [dbo].[cityRoutesWithType]
    @city NVARCHAR(200),
	@type NVARCHAR(200)
AS
SELECT Title FROM Routes r JOIN City c ON r.IdCity = c.Id 
JOIN RouteTypes rt ON r.IdRouteTypes = rt.Id WHERE c.NAME = @city AND rt.NAME = @type;
GO
/****** Object:  StoredProcedure [dbo].[cityRoutesWithTypeSortedByRate]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 2
CREATE PROCEDURE [dbo].[cityRoutesWithTypeSortedByRate]
    @city NVARCHAR(200),
	@type NVARCHAR(200)
AS
SELECT Title, Rating FROM Routes r JOIN City c ON r.IdCity = c.Id 
JOIN RouteTypes rt ON r.IdRouteTypes = rt.Id
JOIN RouteRate fb ON fb.IdRoute = r.Id WHERE c.NAME = @city AND rt.NAME = @type ORDER BY Rating;
GO
/****** Object:  StoredProcedure [dbo].[regUserWithFB]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 10
CREATE PROCEDURE [dbo].[regUserWithFB]
    @firstname NVARCHAR(200),
    @lastname NVARCHAR(200),
    @fb NVARCHAR(200)
AS
INSERT INTO Users(FIrstName, LastName, Mail, FB) VALUES (@firstname, @lastname, NULL, @fb)
GO
/****** Object:  StoredProcedure [dbo].[regUserWithMail]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 9
CREATE PROCEDURE [dbo].[regUserWithMail]
    @firstname NVARCHAR(200),
    @lastname NVARCHAR(200),
    @mail NVARCHAR(200)
AS
INSERT INTO Users(FIrstName, LastName, Mail, FB) VALUES (@firstname, @lastname, @mail,NULL)
GO
/****** Object:  StoredProcedure [dbo].[routeComments]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 8
CREATE PROCEDURE [dbo].[routeComments]
    @title NVARCHAR(200)
AS
SELECT fb.Rating, fb.Comment FROM FeedBack fb JOIN Routes r ON fb.IdRoute = r.Id WHERE r.Title = @title;
GO
/****** Object:  StoredProcedure [dbo].[routeInfo]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 5
CREATE PROCEDURE [dbo].[routeInfo]
    @id INT
AS
SELECT Title, Time, Description FROM Routes  WHERE Id = @id;
GO
/****** Object:  StoredProcedure [dbo].[routePointskart]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 7
CREATE PROCEDURE [dbo].[routePointskart]
    @title NVARCHAR(200)
AS
SELECT rp.Latitude, rp.Longitude FROM RoutePoints rp JOIN Routes r ON rp.IdRoute = r.Id WHERE r.Title = @title;
GO
/****** Object:  StoredProcedure [dbo].[routePointsList]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 6
CREATE PROCEDURE [dbo].[routePointsList]
    @title NVARCHAR(200)
AS
SELECT rp.Title, rp.Description FROM RoutePoints rp JOIN Routes r ON rp.IdRoute = r.Id WHERE r.Title = @title;
GO
/****** Object:  StoredProcedure [dbo].[userRoutes]    Script Date: 23.02.2021 22:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 4
CREATE PROCEDURE [dbo].[userRoutes]
    @firstname NVARCHAR(200),
    @lastname NVARCHAR(200)
AS
SELECT Title FROM Routes r JOIN Users u ON r.IdUser = u.Id WHERE FIrstName = @firstname AND LastName = @lastname;
GO
USE [master]
GO
ALTER DATABASE [Turisma] SET  READ_WRITE 
GO
