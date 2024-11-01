USE [master]
GO
/****** Object:  Database [WEBSITEBANHANG]    Script Date: 20/10/2024 9:28:22 CH ******/
CREATE DATABASE [WEBSITEBANHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBSITEBANHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WEBSITEBANHANG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WEBSITEBANHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WEBSITEBANHANG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WEBSITEBANHANG] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBSITEBANHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBSITEBANHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBSITEBANHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBSITEBANHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEBSITEBANHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBSITEBANHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBSITEBANHANG] SET  MULTI_USER 
GO
ALTER DATABASE [WEBSITEBANHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBSITEBANHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBSITEBANHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBSITEBANHANG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WEBSITEBANHANG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEBSITEBANHANG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEBSITEBANHANG', N'ON'
GO
ALTER DATABASE [WEBSITEBANHANG] SET QUERY_STORE = ON
GO
ALTER DATABASE [WEBSITEBANHANG] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WEBSITEBANHANG]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/10/2024 9:28:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/10/2024 9:28:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Image] [varchar](255) NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Nike')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Puma')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Adidas')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (1, N'Nike Air Max 270', CAST(150.00 AS Decimal(10, 2)), 60, N'Comfortable and stylish Nike Air Max shoes', N'AIR+MAX+270.png', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (2, N'Nike Jordan Retro', CAST(220.00 AS Decimal(10, 2)), 20, N'Retro edition of Jordan basketball shoes', N'AIR+JORDAN+1+RETRO+HIGH+OG.jpg', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (3, N'Nike React Infinity Run', CAST(160.00 AS Decimal(10, 2)), 35, N'Running shoes with Nike React foam for better support', N'Nike_React_Infinity_Run.jpg', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (4, N'Nike Air Force 1', CAST(120.00 AS Decimal(10, 2)), 50, N'Classic Nike Air Force 1 sneakers', N'AIR+FORCE+1+07.png', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (5, N'Nike ZoomX Vaporfly', CAST(250.00 AS Decimal(10, 2)), 15, N'High-performance running shoes for marathon runners', N'Nike_ZoomX_Vaporfly.jpg', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (6, N'Puma RS-X3 Puzzle', CAST(110.00 AS Decimal(10, 2)), 50, N'Puma running shoes with futuristic design', N'Puma_RS-X3_Puzzle.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (7, N'Puma Future Rider', CAST(90.00 AS Decimal(10, 2)), 45, N'Classic Puma running shoes with modern color combinations', N'Puma_Future_Rider.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (8, N'Puma Cali Sport', CAST(120.00 AS Decimal(10, 2)), 38, N'Sporty Puma sneakers with a thick sole', N'Puma_Cali_Sport.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (9, N'Puma Suede Classic', CAST(85.00 AS Decimal(10, 2)), 65, N'Timeless Puma suede shoes', N'Puma Suede Classic.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (10, N'Puma Ignite Limitless', CAST(130.00 AS Decimal(10, 2)), 28, N'Running shoes with energy return technology', N'Puma_Ignite_Limitless.jpg', 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (11, N'Adidas NMD_R1', CAST(140.00 AS Decimal(10, 2)), 55, N'Adidas NMD_R1 running shoes with Boost technology', N'Adidas_NMD_R1.jpg', 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (12, N'Adidas Yeezy Boost 350', CAST(300.00 AS Decimal(10, 2)), 15, N'Popular Adidas Yeezy shoes designed by Kanye West', N'Adidas_Yeezy_Boost_350.jpg', 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (13, N'Adidas Superstar', CAST(85.00 AS Decimal(10, 2)), 70, N'Classic Adidas Superstar shoes with a timeless design', N'Adidas_Superstar.jpg', 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (14, N'Adidas Ultraboost 21', CAST(180.00 AS Decimal(10, 2)), 25, N'High-performance running shoes with Boost midsole', N'Adidas_Ultraboost_21.jpg', 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Quantity], [Description], [Image], [CategoryId]) VALUES (15, N'Adidas Stan Smith', CAST(100.00 AS Decimal(10, 2)), 45, N'Iconic Adidas Stan Smith tennis shoes', N'Adidas_Stan_Smith.png', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [WEBSITEBANHANG] SET  READ_WRITE 
GO
