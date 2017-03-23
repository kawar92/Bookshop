USE [master]
GO
/****** Object:  Database [BooksDB]    Script Date: 19.03.2017 19:39:14 ******/
CREATE DATABASE [BooksDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CoffeeDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BooksDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CoffeeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BooksDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BooksDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BooksDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BooksDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BooksDB] SET  MULTI_USER 
GO
ALTER DATABASE [BooksDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BooksDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BooksDB]
GO
/****** Object:  Table [dbo].[book]    Script Date: 19.03.2017 19:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[author] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[genre] [varchar](20) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[image] [varchar](255) NULL,
	[review] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 19.03.2017 19:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client] [varchar](50) NOT NULL,
	[book] [varchar](250) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL,
	[date] [date] NOT NULL,
	[orderShipped] [bit] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 19.03.2017 19:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](250) NOT NULL,
	[user_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([id], [name], [author], [price], [genre], [country], [image], [review]) VALUES (1, N'A Criminal Defense', N'Myers', 11.51, N'thriller', N'USA', N'../Images/Book/a_criminal_defense.jpg', N'When a young reporter is found dead and a prominent Philadelphia businessman is accused of her murder, Mick McFarland finds himself involved in the case of his life. The defendant, David Hanson, was Mick’s close friend in law school, and the victim, a TV news reporter, had reached out to Mick for legal help only hours before her death.')
INSERT [dbo].[book] ([id], [name], [author], [price], [genre], [country], [image], [review]) VALUES (9, N'1984', N'Orwell', 22, N'classics', N'England', N'../Images/Book/1984.jpg', N'Written in 1948, 1984 was George Orwell’s chilling prophecy about the future. And while 1984 has come and gone, his dystopian vision of a government that will do anything to control the narrative is timelier than ever...')
INSERT [dbo].[book] ([id], [name], [author], [price], [genre], [country], [image], [review]) VALUES (10, N'Animal Farm', N'Orwell', 7.99, N'classics', N'England', N'../Images/Book/animal farm.jpg', N'George Orwell''s timeless and timely allegorical novel—a scathing satire on a downtrodden society’s blind march towards totalitarianism.')
INSERT [dbo].[book] ([id], [name], [author], [price], [genre], [country], [image], [review]) VALUES (11, N'Martin Eden', N'London', 15.67, N'classics', N'USA', N'../Images/Book/martin_eden.jpg', N'The semiautobiographical Martin Eden is the most vital and original character Jack London ever created. Set in San Francisco, this is the story of Martin Eden, an impoverished seaman who pursues, obsessively and aggressively, dreams of education and literary fame. ')
INSERT [dbo].[book] ([id], [name], [author], [price], [genre], [country], [image], [review]) VALUES (12, N'Murder on the Orient Express', N'Christie', 9.99, N'Mystery', N'England', N'../Images/Book/murder_on_the_orient.jpg', N'he Queen of Mystery has come to Harper Collins! Agatha Christie, the acknowledged mistress of suspense—creator of indomitable sleuth Miss Marple, meticulous Belgian detective Hercule Poirot, and so many other unforgettable characters—brings her entire oeuvre of ingenious whodunits, locked room mysteries, and perplexing puzzles to Harper Paperbacks')
INSERT [dbo].[book] ([id], [name], [author], [price], [genre], [country], [image], [review]) VALUES (13, N'Fool Me Once', N'Coben', 19, N'Mystery', N'USA', N'../Images/Book/fool_me_once.jpg', N'Former special ops pilot Maya, home from the war, sees an unthinkable image captured by her nanny cam while she is at work: her two-year-old daughter playing with Maya’s husband, Joe—who was brutally murdered two weeks earlier.')
SET IDENTITY_INSERT [dbo].[book] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (1, N'Robert', N'1984', 1, 22, CAST(N'2017-03-06' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (2, N'Robert', N'A Criminal Defense', 2, 11.51, CAST(N'2017-03-17' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (3, N'Robert', N'1984', 1, 22, CAST(N'2017-03-17' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (4, N'Robert', N'A Criminal Defense', 1, 11.51, CAST(N'2017-03-17' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (5, N'Robert', N'1984', 1, 22, CAST(N'2017-03-17' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (6, N'Robert', N'A Criminal Defense', 1, 11.51, CAST(N'2017-03-17' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (7, N'Robert', N'1984', 3, 22, CAST(N'2017-03-17' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (8, N'Robert', N'1984', 4, 22, CAST(N'2017-03-18' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (9, N'Robert', N'A Criminal Defense', 3, 11.51, CAST(N'2017-03-18' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (10, N'Robert', N'A Criminal Defense', 2, 11.51, CAST(N'2017-03-18' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (11, N'Robert', N'1984', 3, 22, CAST(N'2017-03-18' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (12, N'Robert', N'A Criminal Defense', 1, 11.51, CAST(N'2017-03-18' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (13, N'Robert', N'1984', 2, 22, CAST(N'2017-03-18' AS Date), 1)
INSERT [dbo].[orders] ([id], [client], [book], [amount], [price], [date], [orderShipped]) VALUES (1002, N'Robert', N'A Criminal Defense', 1, 11.51, CAST(N'2017-03-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (1, N'Robert', N'haslo', N'kawar@wit.edu.pl', N'administrator')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (2, N'lenka', N'lenka', N'ksks@o2.pl', N'user')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (3, N'lucek', N'lucek', N'lucek@lucek.pl', N'user')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (4, N'wawrzyn', N'wawrzyn', N'wawrzyn@o2.pl', N'user')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (7, N'asd', N'asd', N'asd@asd.pl', N'asd')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (8, N'asdasd', N'asdsad', N'asdasd@as.pl', N'asdasdasd')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (9, N'sad1', N'asd', N'asd@o2.pl', N'askaskd')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (10, N'sad2', N'asd2', N'asd@asd.pl', N'kasd')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (14, N'sdfdsfdsf', N'sdfsdfsdf', N'sdfsdf@asd.pl', N'asd')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (15, N'sdfffff', N'sffff', N'sf@sdasd.pl', N'asd')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (16, N'sdfsdfsdfdsf', N'sdfdsfdsfdsfsdf', N'sdfdsfddf', N'bvvbcvcbcbvcvb')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (17, N'cxvcxvxcvxcv', N'xcvcxvcxvcxv', N'xcv', N'xcvxcvcxvxcvcxv')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (18, N'ksks', N'sksks', N'ksks@o2.pl', N'ksks')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (19, N'Roberth', N'aslo', N'so@o2.pl', N'kjsks')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (20, N'Roberts', N'haslo', N'ksks@o2.pl', N'ksksks')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (21, N'Robert222', N'haslo', N'kas', N'ks')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (22, N'Magdalena Ignatiukddd', N'ddffd', N'fdfdfd@wsd.pl', N'sdfsdfsdf')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (23, N'Robertsdsdsdds', N'has', N'hssh@o2.pl', N'kjsks')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (25, N'ddddf', N'asd', N'asd', N'user')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (26, N'ddddfsdfsdf', N'sdf', N'kaw@o2.pl', N'user')
INSERT [dbo].[users] ([id], [name], [password], [email], [user_type]) VALUES (28, N'asdasdsssss', N'asd', N'asd@o2.pl', N'user')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  StoredProcedure [dbo].[spGetGroupedOrders]    Script Date: 19.03.2017 19:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetGroupedOrders]
@date1 as DATE,
@date2 as DATE,
@shipped as BIT	
AS
BEGIN
	select client, date, SUM(total) as total
		FROM (
				SELECT client, date, (amount*price) AS total
				FROM [BooksDB].[dbo].[orders]
				WHERE date >= @date1
				AND date <= @date2
				AND orderShipped = @shipped
			) as result
			GROUP BY client, date
END
GO
/****** Object:  StoredProcedure [dbo].[spGetOrdersDetailed]    Script Date: 19.03.2017 19:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetOrdersDetailed]
@client AS nvarchar(30),
@date AS DATE
AS
BEGIN
SELECT
	book,
	SUM(amount) AS amount,
	price,
	orderShipped,
	SUM(amount * price) AS total
FROM
	orders
WHERE
	client = @client
AND 
	date = @date
GROUP BY
	book, price, orderShipped
END

	

GO
/****** Object:  StoredProcedure [dbo].[spGetOrdersDetailed1]    Script Date: 19.03.2017 19:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetOrdersDetailed1]
@client AS nvarchar(30),
@date AS DATE
AS
BEGIN
SELECT
	product,
	SUM(amount) AS amount,
	price,
	orderShipped,
	SUM(amount * price) AS total
FROM
	orders
WHERE
	client = @client
AND 
	date = @date
GROUP BY
	product, price, orderShipped
END

	
GO
USE [master]
GO
ALTER DATABASE [BooksDB] SET  READ_WRITE 
GO
