USE [master]
GO

  IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'MovieDB')
  BEGIN
    CREATE DATABASE MovieDB
    END

 

GO
USE [MovieDB]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 8/26/2022 7:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 8/26/2022 7:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Overview] [varchar](1024) NOT NULL,
	[Genre] [varchar](20) NOT NULL,
	[Language] [varchar](20) NOT NULL,
	[Duration] [int] NOT NULL,
	[Rating] [decimal](2, 1) NULL,
	[PosterPath] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 8/26/2022 7:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](40) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[UserTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 8/26/2022 7:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Watchlist]    Script Date: 8/26/2022 7:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Watchlist](
	[WatchlistId] [varchar](36) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WatchlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchlistItems]    Script Date: 8/26/2022 7:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchlistItems](
	[WatchlistItemId] [int] IDENTITY(1,1) NOT NULL,
	[WatchlistId] [varchar](36) NOT NULL,
	[MovieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WatchlistItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (2, N'Animation')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (3, N'Comedy')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (4, N'Drama')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (5, N'Mystery')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (6, N'Science Fiction')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
USE [master]
GO
ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO
