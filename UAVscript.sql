USE [master]
GO
/****** Object:  Database [UAVHire]    Script Date: 3.05.2024 02:30:34 ******/
CREATE DATABASE [UAVHire]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UAVHire', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UAVHire.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UAVHire_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UAVHire_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UAVHire] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UAVHire].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UAVHire] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UAVHire] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UAVHire] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UAVHire] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UAVHire] SET ARITHABORT OFF 
GO
ALTER DATABASE [UAVHire] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UAVHire] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UAVHire] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UAVHire] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UAVHire] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UAVHire] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UAVHire] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UAVHire] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UAVHire] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UAVHire] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UAVHire] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UAVHire] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UAVHire] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UAVHire] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UAVHire] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UAVHire] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UAVHire] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UAVHire] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UAVHire] SET  MULTI_USER 
GO
ALTER DATABASE [UAVHire] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UAVHire] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UAVHire] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UAVHire] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UAVHire] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UAVHire] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UAVHire] SET QUERY_STORE = ON
GO
ALTER DATABASE [UAVHire] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UAVHire]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hire]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hire](
	[Hire_Id] [int] IDENTITY(1,1) NOT NULL,
	[UAV_Id] [int] NULL,
	[StartDate] [datetime] NULL,
	[FinishDate] [datetime] NULL,
	[Login_Id] [int] NULL,
 CONSTRAINT [PK_Hire] PRIMARY KEY CLUSTERED 
(
	[Hire_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HireLog]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HireLog](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Application] [nvarchar](50) NULL,
	[ApplicationPage] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Ip] [nvarchar](50) NULL,
 CONSTRAINT [PK_HireLog] PRIMARY KEY CLUSTERED 
(
	[Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Login_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Name_Surname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nchar](50) NULL,
	[Role_Id] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Login_Id] PRIMARY KEY CLUSTERED 
(
	[Login_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Menu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Role_Id] [int] NULL,
	[Active] [bit] NULL,
	[Icons] [nvarchar](50) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UAV]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UAV](
	[UAV_Id] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Weight] [int] NULL,
	[Category_Id] [int] NULL,
	[Communication_Range] [int] NULL,
	[Load_Capacity] [int] NULL,
	[StayInTheAir] [int] NULL,
	[Height] [int] NULL,
	[MaximumTakeoffWeight] [int] NULL,
 CONSTRAINT [PK_UAV] PRIMARY KEY CLUSTERED 
(
	[UAV_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActiveLogin]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ActiveLogin]
	-- Add the parameters for the stored procedure 
	@LoginId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  Active from Login where Login_Id = @LoginId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddHire]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddHire]
	-- Add the parameters for the stored procedure here
	@UAV_Id int,
	@StartDate datetime,
	@FinishDate datetime,
	@Login_Id int
	 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Hire]
           ([UAV_Id]
           ,[StartDate]
           ,[FinishDate]
           ,[Login_Id])
     VALUES
           (@UAV_Id , @StartDate , @FinishDate , @Login_Id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUAV]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddUAV]
	-- Add the parameters for the stored procedure here
	@SerialNumber int,
	@Brand  nvarchar(50),
	@Model nvarchar(50),
	@Weight int,
	@Category_Id int,
	@Communication_Range int,
	@Load_Capacity int,
	@StayInTheAir int,
	@Height int,
	@MaximumTakeoffWeight int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[UAV]
           ([SerialNumber]
           ,[Brand]
           ,[Model]
           ,[Weight]
           ,[Category_Id]
           ,[Communication_Range]
           ,[Load_Capacity]
           ,[StayInTheAir]
           ,[Height]
           ,[MaximumTakeoffWeight])
     VALUES
           (@SerialNumber,@Brand,@Model,@Weight,@Category_Id,@Communication_Range,@Load_Capacity,@StayInTheAir,@Height,@MaximumTakeoffWeight)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUsers]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddUsers]
	-- Add the parameters for the stored procedure here
	@name nvarchar(50),
	@email nvarchar(50),
	@username nvarchar(50),
	@password nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Login]
           ([Username]
           ,[Name_Surname]
           ,[Email]
           ,[Password]
           ,[Role_Id]
           ,[Active])
           
     VALUES
           (@username,@name,@email,@password,2 , 1 )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteHire]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteHire]
	-- Add the parameters for the stored procedure here
	@Hire_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Hire where Hire_Id = @Hire_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUAV]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteUAV]
	-- Add the parameters for the stored procedure here
	@UAV_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM UAV WHERE UAV_Id = @UAV_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_UserRole]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_UserRole] 
	-- Add the parameters for the stored procedure here
		@LoginId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Role_Id from Login where Login_Id = @LoginId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategory]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCategory]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Category
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHire]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetHire]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Hire
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHireEdit]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetHireEdit]
	-- Add the parameters for the stored procedure here
	@Hire_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from hire where Hire_Id = @Hire_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLog]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLog]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from HireLog
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLoginById]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLoginById]
	-- Add the parameters for the stored procedure here
	@Login_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Login where Login_Id = @Login_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLoginControl]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLoginControl]
	-- Add the parameters for the stored procedure here
	@username nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Login WHERE username = @username
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMenu]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMenu]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Menu
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMenuRole]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMenuRole]
	-- Add the parameters for the stored procedure here
      @MenuId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Role_Id from Menu where Menu_Id = @MenuId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUav]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUav]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From UAV
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUavEdit]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUavEdit]
	-- Add the parameters for the stored procedure here
	@UAV_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from UAV where UAV_Id = @UAV_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveLog]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveLog]
	-- Add the parameters for the stored procedure here

		 @UserId int,
         @Username nvarchar(50),
         @Application nvarchar(50),
         @ApplicationPage nvarchar(50),
         @Note nvarchar(50),
         @Date datetime,
         @Ip nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[HireLog]
           ([UserId]
           ,[Username]
           ,[Application]
           ,[ApplicationPage]
           ,[Note]
           ,[Date]
           ,[Ip])
     VALUES
          (@UserId,@Username,@Application,@ApplicationPage,@Note,@Date,@Ip)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateHire]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateHire]
	-- Add the parameters for the stored procedure here
	@Hire_Id int,
	@UAV_Id int,
	@StartDate datetime,
	@FinishDate datetime,
	@Login_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[Hire]
   SET [UAV_Id] = @UAV_Id
      ,[StartDate] = @StartDate
      ,[FinishDate] = @FinishDate
	  ,[Login_Id] = @Login_Id
 WHERE Hire_Id = @Hire_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUAV]    Script Date: 3.05.2024 02:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateUAV] 
	-- Add the parameters for the stored procedure here
	@UAV_Id int,
	@SerialNumber int,
	@Brand  nvarchar(50),
	@Model nvarchar(50),
	@Weight int,
	@Category_Id int,
	@Communication_Range int,
	@Load_Capacity int,
	@StayInTheAir int,
	@Height int,
	@MaximumTakeoffWeight int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[UAV]
   SET [SerialNumber] = @SerialNumber
      ,[Brand] = @Brand
      ,[Model] = @Model
      ,[Weight] = @Weight
      ,[Category_Id] = @Category_Id
      ,[Communication_Range] = @Communication_Range
      ,[Load_Capacity] = @Load_Capacity
      ,[StayInTheAir] = @StayInTheAir
      ,[Height] = @Height
      ,[MaximumTakeoffWeight] = @MaximumTakeoffWeight
 WHERE UAV_Id = @UAV_Id
END
GO
USE [master]
GO
ALTER DATABASE [UAVHire] SET  READ_WRITE 
GO
