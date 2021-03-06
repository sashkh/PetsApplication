USE [master]
GO
/****** Object:  Database [Aimia]    Script Date: 14-Oct-16 4:05:14 PM ******/
CREATE DATABASE [Aimia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aimia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Aimia.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Aimia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Aimia_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Aimia] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aimia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aimia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aimia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aimia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aimia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aimia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aimia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aimia] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Aimia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aimia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aimia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aimia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aimia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aimia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aimia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aimia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aimia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Aimia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aimia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aimia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aimia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aimia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aimia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aimia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aimia] SET RECOVERY FULL 
GO
ALTER DATABASE [Aimia] SET  MULTI_USER 
GO
ALTER DATABASE [Aimia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aimia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aimia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aimia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Aimia', N'ON'
GO
USE [Aimia]
GO
/****** Object:  Table [dbo].[customer_OrderDetails]    Script Date: 14-Oct-16 4:05:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_OrderDetails](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[qty] [int] NULL,
	[ProductName] [varchar](200) NULL,
	[Imageurl] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_Orders]    Script Date: 14-Oct-16 4:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[customer_id] [int] NULL,
	[order_total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_Products]    Script Date: 14-Oct-16 4:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[description] [varchar](1000) NULL,
	[ImageUrl] [varchar](200) NULL,
	[price] [int] NULL,
	[ProductName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_Register]    Script Date: 14-Oct-16 4:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_Register](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[password] [varchar](20) NULL,
	[email] [varchar](200) NULL,
	[city] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[customer_OrderDetails] ON 

INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (1, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (2, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (3, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (4, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (5, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (6, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (7, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (8, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (9, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (10, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (11, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (12, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (13, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (14, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (15, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (16, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (17, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (18, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (19, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (20, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (21, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (22, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (23, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (24, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (25, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (26, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (27, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (28, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (29, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (30, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (31, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (32, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (33, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (34, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (35, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (36, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (37, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (38, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (39, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (40, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (41, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (42, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (43, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (44, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (45, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (46, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (47, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (48, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (49, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (50, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (51, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (52, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (53, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (54, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (55, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (56, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (57, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (58, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (59, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (60, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (61, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (62, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (63, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (64, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (65, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (66, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (67, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (68, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (69, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (70, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (71, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (72, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (73, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (74, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (75, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (76, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (77, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (78, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (79, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (80, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (81, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (82, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (83, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (84, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (85, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (86, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (87, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (88, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (89, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (90, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (91, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (92, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (93, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (94, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (95, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (96, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (97, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (98, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (99, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
GO
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (100, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (101, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (102, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (103, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (104, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (105, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (106, 73, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (107, 73, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (108, 74, 34, N'Yorkshire Terrier Puppies For Sale', N'~/images/dogs/Puppy-time-free-license-CC0-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (109, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (110, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (111, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (112, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (113, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (114, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (115, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (116, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (117, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (118, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (119, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (120, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (121, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (122, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (123, 75, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (124, 66, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (125, 67, 29, N'Basset Hound Puppies For Sale', N'~/images/dogs/person-woman-summer-girl-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (126, 68, 29, N'Bichon Frise Puppies For Sale', N'~/images/dogs/pexels-photo-115064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (127, 69, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (128, 70, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (129, 71, 26, N'Chihuahua Puppies For Sale', N'~/images/dogs/pexels-photo-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (130, 72, 33, N'British Bull Dog Puppies For Sale', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (131, 75, 22, N'Spitz Puppies For Sale', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (132, 80, 27, N'Lhasa Apso Puppies For Sale', N'~/images/dogs/pexels-photo-59523-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (133, 80, 27, N'Lhasa Apso Puppies For Sale', N'~/images/dogs/pexels-photo-59523-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (134, 80, 27, N'Lhasa Apso Puppies For Sale', N'~/images/dogs/pexels-photo-59523-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (135, 80, 27, N'Lhasa Apso Puppies For Sale', N'~/images/dogs/pexels-photo-59523-medium.jpeg')
INSERT [dbo].[customer_OrderDetails] ([order_details_id], [order_id], [qty], [ProductName], [Imageurl]) VALUES (136, 80, 27, N'Lhasa Apso Puppies For Sale', N'~/images/dogs/pexels-photo-59523-medium.jpeg')
SET IDENTITY_INSERT [dbo].[customer_OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[customer_Orders] ON 

INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (21, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (22, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (23, 5, 9, 54000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (24, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (25, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (26, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (27, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (28, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (29, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (30, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (31, 4, 9, 9000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (32, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (33, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (34, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (35, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (36, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (37, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (38, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (39, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (40, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (41, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (42, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (43, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (44, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (45, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (46, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (47, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (48, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (49, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (50, 4, 9, 9000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (51, 4, 9, 9000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (52, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (53, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (54, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (55, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (56, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (57, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (58, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (59, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (60, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (61, 3, 9, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (62, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (63, 4, 9, 9000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (64, 5, 9, 54000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (65, 2, 9, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (66, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (67, 3, 10, 82000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (68, 4, 10, 9000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (69, 6, 10, 98000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (70, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (71, 6, 10, 98000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (72, 8, 10, 56000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (73, 2, 11, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (74, 7, 11, 91000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (75, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (76, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (77, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (78, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (79, 2, 10, 32000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (80, 10, 12, 45000)
INSERT [dbo].[customer_Orders] ([order_id], [product_id], [customer_id], [order_total]) VALUES (81, 4, 12, 9000)
SET IDENTITY_INSERT [dbo].[customer_Orders] OFF
SET IDENTITY_INSERT [dbo].[customer_Products] ON 

INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (2, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/a97c4a1614b53d6f55ae2464b06ba6aa-medium.jpg', 32000, N'Spitz Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (3, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/person-woman-summer-girl-medium.jpg', 82000, N'Basset Hound Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (4, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/pexels-photo-115064-medium.jpeg', 9000, N'Bichon Frise Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (5, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/pexels-photo-53769-medium.jpeg', 54000, N'Lhasa Apso Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (6, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/pexels-photo-medium.jpg', 98000, N'Chihuahua Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (7, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/Puppy-time-free-license-CC0-medium.jpg', 91000, N'Yorkshire Terrier Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (8, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/theme-candid-portraits-smile-woman-girl-40064-medium.jpeg', 56000, N'British Bull Dog Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (9, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/pexels-photo-58997-medium.jpeg', 11000, N'Bichon Frise Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (10, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/pexels-photo-59523-medium.jpeg', 45000, N'Lhasa Apso Puppies For Sale')
INSERT [dbo].[customer_Products] ([product_id], [name], [description], [ImageUrl], [price], [ProductName]) VALUES (11, N'dog', N' Affectionate, lazy, devoted, quiet, and peaceful, the Basset Hound does exceptionally well with a family. This breed loves children, and generally does well with other animals. They can be taught tricks.', N'~/images/dogs/pexels-photo-69372-medium.jpeg', 45000, N'Chihuahua Puppies For Sale')
SET IDENTITY_INSERT [dbo].[customer_Products] OFF
SET IDENTITY_INSERT [dbo].[customer_Register] ON 

INSERT [dbo].[customer_Register] ([id], [name], [password], [email], [city]) VALUES (9, N'khadarbabu', N'Khadar@123', N'khadarbabu.sj@gmail.com', N'chennai')
INSERT [dbo].[customer_Register] ([id], [name], [password], [email], [city]) VALUES (10, N'sathish', N'sash@123', N'sash@gmail.com', N'chennai')
INSERT [dbo].[customer_Register] ([id], [name], [password], [email], [city]) VALUES (11, N'ram', N'ram@123', N'ram@gmail.com', N'HYDERABAD')
INSERT [dbo].[customer_Register] ([id], [name], [password], [email], [city]) VALUES (12, N'test', N'123456', N'test@test.com', N'test')
SET IDENTITY_INSERT [dbo].[customer_Register] OFF
ALTER TABLE [dbo].[customer_OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[customer_Orders] ([order_id])
GO
ALTER TABLE [dbo].[customer_Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer_Register] ([id])
GO
ALTER TABLE [dbo].[customer_Orders]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[customer_Products] ([product_id])
GO
USE [master]
GO
ALTER DATABASE [Aimia] SET  READ_WRITE 
GO
