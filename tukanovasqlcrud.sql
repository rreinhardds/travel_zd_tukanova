USE [master]
GO
/****** Object:  Database [Travel]    Script Date: 19.12.2022 15:12:14 ******/
CREATE DATABASE [Travel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Travel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Travel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Travel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Travel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Travel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Travel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Travel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Travel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Travel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Travel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Travel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Travel] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Travel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Travel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Travel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Travel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Travel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Travel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Travel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Travel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Travel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Travel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Travel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Travel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Travel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Travel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Travel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Travel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Travel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Travel] SET  MULTI_USER 
GO
ALTER DATABASE [Travel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Travel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Travel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Travel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Travel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Travel] SET QUERY_STORE = OFF
GO
USE [Travel]
GO
/****** Object:  Table [dbo].[basa_tours]    Script Date: 19.12.2022 15:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[basa_tours](
	[Toursid] [int] IDENTITY(1,1) NOT NULL,
	[name_tours] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Toursid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 19.12.2022 15:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[Countryid] [int] IDENTITY(1,1) NOT NULL,
	[name_country] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Countryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[form]    Script Date: 19.12.2022 15:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form](
	[formid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[Countryid] [int] NULL,
	[Toursid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[formid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip_coordination]    Script Date: 19.12.2022 15:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_coordination](
	[Tripid] [int] IDENTITY(1,1) NOT NULL,
	[formid] [int] NULL,
	[user_typeid] [int] NULL,
	[userid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tripid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_users]    Script Date: 19.12.2022 15:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_users](
	[user_typeid] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 19.12.2022 15:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[user_typeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[basa_tours] ON 

INSERT [dbo].[basa_tours] ([Toursid], [name_tours]) VALUES (1, N'Токио')
INSERT [dbo].[basa_tours] ([Toursid], [name_tours]) VALUES (2, N'Шанхай')
INSERT [dbo].[basa_tours] ([Toursid], [name_tours]) VALUES (3, N'Амстердам')
INSERT [dbo].[basa_tours] ([Toursid], [name_tours]) VALUES (4, N'Сеул')
INSERT [dbo].[basa_tours] ([Toursid], [name_tours]) VALUES (5, N'Брангкок')
SET IDENTITY_INSERT [dbo].[basa_tours] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([Countryid], [name_country]) VALUES (1, N'Япония')
INSERT [dbo].[country] ([Countryid], [name_country]) VALUES (2, N'Китай')
INSERT [dbo].[country] ([Countryid], [name_country]) VALUES (3, N'Нидерладны')
INSERT [dbo].[country] ([Countryid], [name_country]) VALUES (4, N'Южная корея')
INSERT [dbo].[country] ([Countryid], [name_country]) VALUES (5, N'Тайланд')
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[form] ON 

INSERT [dbo].[form] ([formid], [userid], [Countryid], [Toursid]) VALUES (1, 2, 2, 2)
INSERT [dbo].[form] ([formid], [userid], [Countryid], [Toursid]) VALUES (2, 3, 3, 3)
INSERT [dbo].[form] ([formid], [userid], [Countryid], [Toursid]) VALUES (3, 5, 5, 5)
SET IDENTITY_INSERT [dbo].[form] OFF
GO
SET IDENTITY_INSERT [dbo].[trip_coordination] ON 

INSERT [dbo].[trip_coordination] ([Tripid], [formid], [user_typeid], [userid]) VALUES (1, 1, 1, 1)
INSERT [dbo].[trip_coordination] ([Tripid], [formid], [user_typeid], [userid]) VALUES (2, 2, 1, 4)
INSERT [dbo].[trip_coordination] ([Tripid], [formid], [user_typeid], [userid]) VALUES (3, 3, 1, 4)
SET IDENTITY_INSERT [dbo].[trip_coordination] OFF
GO
SET IDENTITY_INSERT [dbo].[type_users] ON 

INSERT [dbo].[type_users] ([user_typeid], [type]) VALUES (1, N'agent')
INSERT [dbo].[type_users] ([user_typeid], [type]) VALUES (2, N'travel')
SET IDENTITY_INSERT [dbo].[type_users] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userid], [login], [password], [name], [user_typeid]) VALUES (1, N'rreinhardds@gmail.com', N'qwerty', N'Елизавета', 1)
INSERT [dbo].[users] ([userid], [login], [password], [name], [user_typeid]) VALUES (2, N'fifa@gmail.com', N'qwe', N'Екатерина', 2)
INSERT [dbo].[users] ([userid], [login], [password], [name], [user_typeid]) VALUES (3, N'pupa@gmail.com', N'rty', N'Мария', 2)
INSERT [dbo].[users] ([userid], [login], [password], [name], [user_typeid]) VALUES (4, N'soul@gmail.com', N'wery', N'Даша', 1)
INSERT [dbo].[users] ([userid], [login], [password], [name], [user_typeid]) VALUES (5, N'nikitochka@gmail.com', N'qwrt', N'Никита', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[form]  WITH CHECK ADD FOREIGN KEY([Countryid])
REFERENCES [dbo].[country] ([Countryid])
GO
ALTER TABLE [dbo].[form]  WITH CHECK ADD FOREIGN KEY([Toursid])
REFERENCES [dbo].[basa_tours] ([Toursid])
GO
ALTER TABLE [dbo].[form]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[trip_coordination]  WITH CHECK ADD FOREIGN KEY([formid])
REFERENCES [dbo].[form] ([formid])
GO
ALTER TABLE [dbo].[trip_coordination]  WITH CHECK ADD FOREIGN KEY([user_typeid])
REFERENCES [dbo].[type_users] ([user_typeid])
GO
ALTER TABLE [dbo].[trip_coordination]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([user_typeid])
REFERENCES [dbo].[type_users] ([user_typeid])
GO
USE [master]
GO
ALTER DATABASE [Travel] SET  READ_WRITE 
GO
