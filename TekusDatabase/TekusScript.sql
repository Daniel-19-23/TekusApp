USE [master]
GO
/****** Object:  Database [TekusApp]    Script Date: 2/20/2023 12:51:24 AM ******/
CREATE DATABASE [TekusApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TekusApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TekusApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TekusApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TekusApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TekusApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TekusApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TekusApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TekusApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TekusApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TekusApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TekusApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [TekusApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TekusApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TekusApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TekusApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TekusApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TekusApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TekusApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TekusApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TekusApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TekusApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TekusApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TekusApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TekusApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TekusApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TekusApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TekusApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TekusApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TekusApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TekusApp] SET  MULTI_USER 
GO
ALTER DATABASE [TekusApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TekusApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TekusApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TekusApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TekusApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TekusApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TekusApp] SET QUERY_STORE = OFF
GO
USE [TekusApp]
GO
/****** Object:  Table [dbo].[TA_Countries]    Script Date: 2/20/2023 12:51:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Countries](
	[Id_Country] [int] IDENTITY(1,1) NOT NULL,
	[Name_Country] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TA_Country] PRIMARY KEY CLUSTERED 
(
	[Id_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TA_FK_Supplier_Country]    Script Date: 2/20/2023 12:51:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_FK_Supplier_Country](
	[Id_fk_Supplier_Country] [int] IDENTITY(1,1) NOT NULL,
	[fk_Id_Supplier] [int] NOT NULL,
	[fk_Id_Country] [int] NOT NULL,
 CONSTRAINT [PK_TA_FK_Supplier_Country] PRIMARY KEY CLUSTERED 
(
	[Id_fk_Supplier_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TA_FK_Supplier_Service]    Script Date: 2/20/2023 12:51:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_FK_Supplier_Service](
	[Id_fk_Supplier_Service] [int] IDENTITY(1,1) NOT NULL,
	[fk_Id_Supplier] [int] NOT NULL,
	[fk_Id_Service] [int] NOT NULL,
 CONSTRAINT [PK_TA_FK_Supplier_Service] PRIMARY KEY CLUSTERED 
(
	[Id_fk_Supplier_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TA_Services]    Script Date: 2/20/2023 12:51:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Services](
	[Id_Service] [int] IDENTITY(1,1) NOT NULL,
	[Name_Service] [varchar](100) NOT NULL,
	[HourValue_Service] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TA_Services] PRIMARY KEY CLUSTERED 
(
	[Id_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TA_Suppliers]    Script Date: 2/20/2023 12:51:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Suppliers](
	[Id_Supplier] [int] IDENTITY(1,1) NOT NULL,
	[Nit_Supplier] [varchar](100) NOT NULL,
	[Name_Supplier] [varchar](100) NOT NULL,
	[Email_Supplier] [varchar](100) NULL,
 CONSTRAINT [PK_TA_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TA_Users]    Script Date: 2/20/2023 12:51:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Users](
	[Id_User] [int] IDENTITY(1,1) NOT NULL,
	[Name_User] [varchar](100) NOT NULL,
	[Email_User] [varchar](100) NOT NULL,
	[Password_User] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TA_Users] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TA_Countries] ON 

INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (1, N'Colombia')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (2, N'Perú')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (3, N'México')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (4, N'Estados Unidos')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (5, N'Canadá')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (6, N'Chile')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (7, N'Argentina')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (8, N'Zona 12 (M)')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (9, N'Zona 32 (L)')
INSERT [dbo].[TA_Countries] ([Id_Country], [Name_Country]) VALUES (10, N'India')
SET IDENTITY_INSERT [dbo].[TA_Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[TA_FK_Supplier_Country] ON 

INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (1, 1, 1)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (2, 1, 2)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (3, 1, 3)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (4, 2, 3)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (5, 2, 4)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (6, 2, 5)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (7, 3, 5)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (8, 3, 6)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (9, 3, 7)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (10, 4, 7)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (11, 4, 8)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (12, 4, 9)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (13, 5, 9)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (14, 5, 10)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (15, 5, 1)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (16, 6, 2)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (17, 6, 3)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (18, 6, 4)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (19, 7, 8)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (20, 7, 5)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (21, 8, 9)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (22, 9, 10)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (23, 9, 1)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (24, 9, 4)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (25, 9, 3)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (26, 9, 8)
INSERT [dbo].[TA_FK_Supplier_Country] ([Id_fk_Supplier_Country], [fk_Id_Supplier], [fk_Id_Country]) VALUES (27, 10, 1)
SET IDENTITY_INSERT [dbo].[TA_FK_Supplier_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[TA_FK_Supplier_Service] ON 

INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (1, 1, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (2, 1, 2)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (3, 1, 3)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (4, 1, 4)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (5, 1, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (6, 2, 6)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (7, 2, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (8, 2, 4)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (9, 2, 7)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (15, 4, 2)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (16, 4, 10)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (17, 4, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (18, 4, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (19, 4, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (20, 4, 8)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (21, 5, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (22, 5, 4)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (23, 5, 10)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (24, 5, 9)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (26, 5, 6)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (27, 5, 7)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (29, 7, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (30, 7, 2)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (31, 7, 9)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (32, 7, 4)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (33, 7, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (35, 9, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (36, 9, 2)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (37, 9, 3)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (38, 9, 4)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (39, 9, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (40, 10, 6)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (41, 10, 7)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (42, 10, 8)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (43, 10, 9)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (44, 10, 10)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (45, 11, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (46, 11, 2)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (47, 11, 3)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (48, 11, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (49, 11, 6)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (50, 12, 4)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (51, 12, 5)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (53, 12, 2)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (54, 13, 1)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (55, 13, 9)
INSERT [dbo].[TA_FK_Supplier_Service] ([Id_fk_Supplier_Service], [fk_Id_Supplier], [fk_Id_Service]) VALUES (56, 13, 10)
SET IDENTITY_INSERT [dbo].[TA_FK_Supplier_Service] OFF
GO
SET IDENTITY_INSERT [dbo].[TA_Services] ON 

INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (1, N'Descarga espacial de contenidos', N'5000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (2, N'Desaparición 
forzada de bytes', N'10000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (3, N'Ubicar nueva casa', N'2500')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (4, N'Reubicación Planetaria', N'50000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (5, N'Desmantelado Por m2 Espacial', N'4000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (6, N'Jugar PingPong', N'7000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (7, N'Busqueda de hogar "nuevos horizonte"', N'9000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (8, N'Hacer algo aleatorio', N'60000')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (9, N'Encontrar a tu mascota', N'1')
INSERT [dbo].[TA_Services] ([Id_Service], [Name_Service], [HourValue_Service]) VALUES (10, N'Busqueda del tesoro', N'800')
SET IDENTITY_INSERT [dbo].[TA_Services] OFF
GO
SET IDENTITY_INSERT [dbo].[TA_Suppliers] ON 

INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (1, N'001', N'Importaciones Tekus S.A.S.', N'tekus@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (2, N'002', N'Importaciones Admin nuevo Local', N'admin@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (4, N'003', N'Nuevo Horizonte', N'newh@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (5, N'004', N'Alguna empresa', N'alguna@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (7, N'005', N'Reubicaciónes expres', N'reuexpres@outlook.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (9, N'006', N'GlobalStar', N'global@global.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (10, N'007', N'Agente', N'confidencial@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (11, N'008', N'Algun Proveedor', N'proveedor@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (12, N'009', N'ContactEarth', N'earth@gmail.com')
INSERT [dbo].[TA_Suppliers] ([Id_Supplier], [Nit_Supplier], [Name_Supplier], [Email_Supplier]) VALUES (13, N'010', N'Reubicaciones Lejos de aquí', N'lejos@gmail.com')
SET IDENTITY_INSERT [dbo].[TA_Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[TA_Users] ON 

INSERT [dbo].[TA_Users] ([Id_User], [Name_User], [Email_User], [Password_User]) VALUES (1, N'Daniel', N'daniiel.19.23@gmail.com', N'abc123')
INSERT [dbo].[TA_Users] ([Id_User], [Name_User], [Email_User], [Password_User]) VALUES (2, N'Admin', N'admin@gmail.com', N'admin')
SET IDENTITY_INSERT [dbo].[TA_Users] OFF
GO
ALTER TABLE [dbo].[TA_FK_Supplier_Service]  WITH CHECK ADD  CONSTRAINT [FK_TA_FK_Supplier_Service_TA_Services] FOREIGN KEY([fk_Id_Service])
REFERENCES [dbo].[TA_Services] ([Id_Service])
GO
ALTER TABLE [dbo].[TA_FK_Supplier_Service] CHECK CONSTRAINT [FK_TA_FK_Supplier_Service_TA_Services]
GO
ALTER TABLE [dbo].[TA_FK_Supplier_Service]  WITH CHECK ADD  CONSTRAINT [FK_TA_FK_Supplier_Service_TA_Suppliers] FOREIGN KEY([fk_Id_Supplier])
REFERENCES [dbo].[TA_Suppliers] ([Id_Supplier])
GO
ALTER TABLE [dbo].[TA_FK_Supplier_Service] CHECK CONSTRAINT [FK_TA_FK_Supplier_Service_TA_Suppliers]
GO
ALTER TABLE [dbo].[TA_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_TA_Suppliers_TA_Suppliers] FOREIGN KEY([Id_Supplier])
REFERENCES [dbo].[TA_Suppliers] ([Id_Supplier])
GO
ALTER TABLE [dbo].[TA_Suppliers] CHECK CONSTRAINT [FK_TA_Suppliers_TA_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [TekusApp] SET  READ_WRITE 
GO
