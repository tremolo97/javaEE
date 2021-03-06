USE [master]
GO
/****** Object:  Database [ShopGameDB]    Script Date: 11/3/2017 12:19:45 AM ******/
CREATE DATABASE [ShopGameDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGameDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopGameDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopGameDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopGameDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopGameDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGameDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGameDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGameDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGameDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGameDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGameDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGameDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGameDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGameDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGameDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGameDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGameDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGameDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGameDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGameDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGameDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGameDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGameDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGameDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGameDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopGameDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGameDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGameDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGameDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGameDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShopGameDB]
GO
/****** Object:  Table [dbo].[AccountRoleTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoleTBL](
	[AccountID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillTBL](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[AccountID] [int] NOT NULL,
	[State] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](4000) NOT NULL,
	[Payment] [nchar](30) NOT NULL,
	[Note] [nvarchar](4000) NULL,
 CONSTRAINT [PK__BillTBL__C3905BAF9D4A5AE8] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartTBL](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[BillID] [int] NOT NULL,
 CONSTRAINT [PK__CartTBL__51BCD797E0544190] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTBL](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryTBL] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTBL](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[UnitPrice] [money] NULL,
	[Amount] [int] NOT NULL,
	[Details] [nvarchar](4000) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK__ProductT__B40CC6EDFE213ED1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RattingTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RattingTBL](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Comment] [nvarchar](150) NULL,
 CONSTRAINT [PK_RattingTBL] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTBL](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[AccType] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__RoleTBL__8AFACE3ACD4E26EB] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubEmailTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubEmailTBL](
	[Email] [nchar](255) NOT NULL,
	[Subscribed] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[URLImageTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[URLImageTBL](
	[ProductID] [int] NOT NULL,
	[URLImage] [varchar](1000) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTBL]    Script Date: 11/3/2017 12:19:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTBL](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK__UserTBL__349DA58639E70D74] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AccountRoleTBL] ([AccountID], [RoleID]) VALUES (1, 1)
INSERT [dbo].[AccountRoleTBL] ([AccountID], [RoleID]) VALUES (2, 2)
INSERT [dbo].[AccountRoleTBL] ([AccountID], [RoleID]) VALUES (3, 2)
SET IDENTITY_INSERT [dbo].[BillTBL] ON 

INSERT [dbo].[BillTBL] ([BillID], [OrderDate], [AccountID], [State], [Address], [Payment], [Note]) VALUES (1, CAST(0x0000A81F00000000 AS DateTime), 2, N'Not confirmed', N'SSD', N'GOD                           ', N'asdasd á dá á á á k your order information on the right since this information cannot be changed after we confirm your order.
- Divine Shop will not confirm your order via SMS so please check your order information in our notification email.
- In order to protect our individual buyers, Divine Shop will limit the quantity of product per order.
- Divine Shop does not provide door-to-door delivery service for apartment or office building.
Don''t forget to give us your requested delivery day in Note segment')
SET IDENTITY_INSERT [dbo].[BillTBL] OFF
SET IDENTITY_INSERT [dbo].[CartTBL] ON 

INSERT [dbo].[CartTBL] ([CartID], [ProductID], [Quantity], [BillID]) VALUES (1, 24, 1, 1)
SET IDENTITY_INSERT [dbo].[CartTBL] OFF
SET IDENTITY_INSERT [dbo].[CategoryTBL] ON 

INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (1, N'Action                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (2, N'Adventure                                         ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (3, N'Casual                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (4, N'Indie                                             ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (5, N'Massively Multiplayer                             ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (6, N'Racing                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (7, N'RPG                                               ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (8, N'Simulation                                        ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (9, N'Sports                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (10, N'Strategy                                          ')
SET IDENTITY_INSERT [dbo].[CategoryTBL] OFF
SET IDENTITY_INSERT [dbo].[ProductTBL] ON 

INSERT [dbo].[ProductTBL] ([ProductID], [ProductName], [UnitPrice], [Amount], [Details], [CategoryID]) VALUES (24, N'99 Levels To Hell', 70.0000, 6, N'99 Levels to Hell is a platform shooter with lots of guns, upgrades, magic, traps and monsters to kill. 99 Levels to Hell is a rogue-like, which means surviving is key and every time you play you get a new set of levels to play. When you complete 10 levels, the 10th being a boss-fight you unlock a door to the next dungeon.', 1)
INSERT [dbo].[ProductTBL] ([ProductID], [ProductName], [UnitPrice], [Amount], [Details], [CategoryID]) VALUES (31, N'60 Seconds!', 130000.0000, 5, N'60 Seconds! is a dark comedy atomic adventure of scavenge and survival. Collect supplies and rescue your family before the nuke hits. Stay alive in your fallout shelter. Make difficult decisions, ration food and hunt mutant cockroaches. And maybe survive. Or not.', 2)
INSERT [dbo].[ProductTBL] ([ProductID], [ProductName], [UnitPrice], [Amount], [Details], [CategoryID]) VALUES (32, N'Coffin Dodgers', 170000.0000, 2, N'Pimp up your mobility scooter and take on the Grim Reaper and his Zombie army in a race for your soul. Armed with a variety of homemade weapons and gadgets, battle your way through 13 unique & exhilarating tracks. Can you survive the retirement village?', 6)
INSERT [dbo].[ProductTBL] ([ProductID], [ProductName], [UnitPrice], [Amount], [Details], [CategoryID]) VALUES (51, N'Fieldrunners 2', 50.0000, 7, N'Get ready to DEFEND THE WORLD! The biggest sequel in tower defense history is finally here: Fieldrunners 2 has arrived! From Subatomic Studios, creators of the award winning classic strategy game comes an all new adventure that was years in the making.', 1)
SET IDENTITY_INSERT [dbo].[ProductTBL] OFF
SET IDENTITY_INSERT [dbo].[RoleTBL] ON 

INSERT [dbo].[RoleTBL] ([RoleID], [AccType]) VALUES (1, N'admin')
INSERT [dbo].[RoleTBL] ([RoleID], [AccType]) VALUES (2, N'customer')
SET IDENTITY_INSERT [dbo].[RoleTBL] OFF
INSERT [dbo].[SubEmailTBL] ([Email], [Subscribed]) VALUES (N'crustyratspam@gmail.com                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[SubEmailTBL] ([Email], [Subscribed]) VALUES (N'crustyratspam@gmail.com                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (24, N'imgs/24_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (31, N'imgs/31_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (32, N'imgs/32_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (51, N'imgs/51_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (24, N'imgs/24_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (31, N'imgs/31_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (32, N'imgs/32_0.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (51, N'imgs/51_0.png')
SET IDENTITY_INSERT [dbo].[UserTBL] ON 

INSERT [dbo].[UserTBL] ([AccountID], [Name], [Address], [Email], [PhoneNumber], [password]) VALUES (1, N'admin', N'se1112', N'admin@prj321.com', N'0', N'1')
INSERT [dbo].[UserTBL] ([AccountID], [Name], [Address], [Email], [PhoneNumber], [password]) VALUES (2, N'Huy Hoàng Phan', N'Here! Right here!', N'crustyrat271@gmail.com', N'0102030405', N'321Rat!')
INSERT [dbo].[UserTBL] ([AccountID], [Name], [Address], [Email], [PhoneNumber], [password]) VALUES (3, N'truong minh giang', N'ha noi', N'giangtmse04802@gmail.com', N'9671596925', N'1')
SET IDENTITY_INSERT [dbo].[UserTBL] OFF
ALTER TABLE [dbo].[AccountRoleTBL]  WITH CHECK ADD  CONSTRAINT [FK_AccountRoleTBL_UserTBL] FOREIGN KEY([AccountID])
REFERENCES [dbo].[UserTBL] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountRoleTBL] CHECK CONSTRAINT [FK_AccountRoleTBL_UserTBL]
GO
ALTER TABLE [dbo].[AccountRoleTBL]  WITH CHECK ADD  CONSTRAINT [RoleEach] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleTBL] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountRoleTBL] CHECK CONSTRAINT [RoleEach]
GO
ALTER TABLE [dbo].[BillTBL]  WITH CHECK ADD  CONSTRAINT [FK_BillTBL_UserTBL] FOREIGN KEY([AccountID])
REFERENCES [dbo].[UserTBL] ([AccountID])
GO
ALTER TABLE [dbo].[BillTBL] CHECK CONSTRAINT [FK_BillTBL_UserTBL]
GO
ALTER TABLE [dbo].[CartTBL]  WITH CHECK ADD  CONSTRAINT [CartProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTBL] ([ProductID])
GO
ALTER TABLE [dbo].[CartTBL] CHECK CONSTRAINT [CartProduct]
GO
ALTER TABLE [dbo].[ProductTBL]  WITH CHECK ADD  CONSTRAINT [FK_ProductTBL_CategoryTBL] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CategoryTBL] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTBL] CHECK CONSTRAINT [FK_ProductTBL_CategoryTBL]
GO
ALTER TABLE [dbo].[RattingTBL]  WITH CHECK ADD  CONSTRAINT [RattCustomer] FOREIGN KEY([AccountID])
REFERENCES [dbo].[UserTBL] ([AccountID])
GO
ALTER TABLE [dbo].[RattingTBL] CHECK CONSTRAINT [RattCustomer]
GO
ALTER TABLE [dbo].[RattingTBL]  WITH CHECK ADD  CONSTRAINT [RattProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTBL] ([ProductID])
GO
ALTER TABLE [dbo].[RattingTBL] CHECK CONSTRAINT [RattProduct]
GO
ALTER TABLE [dbo].[URLImageTBL]  WITH CHECK ADD  CONSTRAINT [FK_URLImageTBL_ProductTBL] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTBL] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[URLImageTBL] CHECK CONSTRAINT [FK_URLImageTBL_ProductTBL]
GO
USE [master]
GO
ALTER DATABASE [ShopGameDB] SET  READ_WRITE 
GO
