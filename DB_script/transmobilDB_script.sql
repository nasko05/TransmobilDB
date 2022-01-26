USE [master]
GO
/****** Object:  Database [TransmobilDB]    Script Date: 1/25/2022 6:30:30 PM ******/
CREATE DATABASE [TransmobilDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransmobilDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TransmobilDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransmobilDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TransmobilDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TransmobilDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransmobilDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransmobilDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransmobilDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransmobilDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransmobilDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransmobilDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransmobilDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TransmobilDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransmobilDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransmobilDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransmobilDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransmobilDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransmobilDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransmobilDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransmobilDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransmobilDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TransmobilDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransmobilDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransmobilDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransmobilDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransmobilDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransmobilDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TransmobilDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransmobilDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TransmobilDB] SET  MULTI_USER 
GO
ALTER DATABASE [TransmobilDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransmobilDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransmobilDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransmobilDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TransmobilDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TransmobilDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TransmobilDB', N'ON'
GO
ALTER DATABASE [TransmobilDB] SET QUERY_STORE = OFF
GO
USE [TransmobilDB]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_avans_doplashtane]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[udf_avans_doplashtane]()
returns @rtnTable table(contractsId int, avans int, ostatuk real)
as
begin
	declare @ostatuk int
	declare @avans int

	insert into @rtnTable
	select IdContract as [Договор №], MoneyInAdvance as [Плащане в аванс], iif(IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm - MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) - MoneyInAdvance) as [Доплащане]
	from Contracts as contracts
	inner join Cars as Cars
	on contracts.IdCar = Cars.IdCar
	inner join  Renters as Renters
	on contracts.IdRenter = Renters.IdRenter
	inner join Categories as Categories
	on Cars.IdCategory = Categories.IdCategory

	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[udf_last_10]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[udf_last_10]()
returns @rtn_table table(IdContracts int, NaematelName nvarchar(30), Avtomobil nvarchar(50), AvtomonilNum nvarchar(10), DataNaemane datetime, ReturnDate datetime)
as
begin
	insert into @rtn_table
	select TOP(10) IdContract as [Договор №], RenterName as [Име на наемателя], Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобил №], RentDate as [Дата на наемане], ReturnDate as [Дата на връщане]
	from Contracts as contracts
	inner join Cars as Cars
	on contracts.IdCar = Cars.IdCar
	inner join  Renters as Renters
	on contracts.IdRenter = Renters.IdRenter
	inner join Categories as Categories
	on Cars.IdCategory = Categories.IdCategory
	order by RentDate desc, ReturnDate desc, IdContract desc
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[udf_prihod]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------
------------     Задача 1.1     ------------
--------------------------------------------
--create or alter proc SearchByCategory @kat nvarchar(30)
--as
--    select Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобилен №], cast(CostPerKm as real) as[Цена на км], categories.Name as [Категория], RentPerDay as [Наем на ден]
--	from Cars as cars
--    inner join Categories as categories
--    on cars.IdCategory = categories.IdCategory
--    where categories.Name = @kat
--go

--exec SearchByCategory @kat = N'Лимузина'
--------------------------------------------
------------     Задача 1.2     ------------
--------------------------------------------
--create or alter proc SearchByNaem @naem int
--as
--    select Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобилен №], cast(CostPerKm as real) as[Цена на км], categories.Name as [Категория], RentPerDay as [Наем на ден]
--	from Cars as cars
--	inner join Categories as categories
--    on cars.IdCategory = categories.IdCategory
--    where RentPerDay = @naem
--go

--exec SearchByNaem @naem = 35
--------------------------------------------
------------     Задача 2.1     ------------
--------------------------------------------
--create or alter proc KilometrajMejduDati @date2 datetime
--as 
--    select Brand + ' ' + Model as [Автомобил], MAX(ReturnMileage) as [Текущ километраж]
--	from Contracts as contracts
--    inner join Cars as cars
--    on cars.IdCar = contracts.IdCar
--    where ReturnDate <= @date2
--	group by Brand + ' ' + Model
--go

--exec KilometrajMejduDati @date2 = '2021-11-06 00:00:00.000'
--------------------------------------------
------------     Задача 3.1     ------------
--------------------------------------------
create   function [dbo].[udf_prihod](
	@avto_nomer nvarchar(30)
	)
returns @rtn_table table(Avtomobil nvarchar(30), Obsht_prihod real)
as
begin
	insert into @rtn_Table
	select Brand + ' ' + Model as [Автомобил], SUM(iif( IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm + MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) + MoneyInAdvance)) as [Общ приход]
	from Contracts as contracts
	inner join Cars as cars
	on contracts.IdCar = cars.IdCar
	inner join  Renters as renters
	on contracts.IdRenter = renters.IdRenter
	inner join Categories as categories
	on cars.IdCategory = categories.IdCategory
	where AutomobileNumber = @avto_nomer
	group by Brand + ' ' + Model
	return

end
GO
/****** Object:  UserDefinedFunction [dbo].[udf_prihod_ime]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[udf_prihod_ime](
	@client nvarchar(30)
)
returns @rtn_table table(Avtomobil nvarchar(30), Obsht_prihod real)
as
begin
	insert into @rtn_Table
	select RenterName as [Име],  SUM(iif( IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm + MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) + MoneyInAdvance)) as [Общ приход]
	from Contracts as contracts
	inner join Cars as cars
	on contracts.IdCar = cars.IdCar
	inner join  Renters as renters
	on contracts.IdRenter = renters.IdRenter
	inner join Categories as categories
	on cars.IdCategory = categories.IdCategory
	where RenterName like '%' + N'Ради' + '%'
	group by RenterName
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[udf_prihod_kategoriq]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[udf_prihod_kategoriq](
	@kategoriq nvarchar(30)
)
returns @rtn_table table(Avtomobil nvarchar(30), Obsht_prihod real)
as
begin
	insert into @rtn_Table
	select Brand + ' ' + Model as [Автомобил], SUM(iif( IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm + MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) + MoneyInAdvance)) as [Общ приход]
	from Contracts as contracts
	inner join Cars as cars
	on contracts.IdCar = cars.IdCar
	inner join  Renters as renters
	on contracts.IdRenter = renters.IdRenter
	inner join Categories as categories
	on cars.IdCategory = categories.IdCategory
	where Name = @kategoriq
	group by Brand + ' ' + Model
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[udf_puti_naemane]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[udf_puti_naemane](
	@startdate datetime,
	@enddate datetime
)
returns @rtn_table table(Model nvarchar(40), Puti int)
as
begin
	insert into @rtn_table
	select Model, count(Model) as Puti
	from Contracts
	inner join Cars as Cars
	on Contracts.IdCar = Cars.IdCar
	where RentDate>= @startdate and
	RentDate <= @enddate
	group by Cars.Model
return
end
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[IdCar] [int] IDENTITY(1,1) NOT NULL,
	[AutomobileNumber] [nvarchar](13) NOT NULL,
	[Brand] [nvarchar](20) NOT NULL,
	[Model] [nvarchar](20) NOT NULL,
	[CostPerKm] [decimal](18, 6) NOT NULL,
	[IdCategory] [int] NULL,
 CONSTRAINT [PK__Koli__617AB8615B420322] PRIMARY KEY CLUSTERED 
(
	[IdCar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[IdCategory] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[RentPerDay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[IdContract] [int] IDENTITY(1,1) NOT NULL,
	[IdRenter] [int] NULL,
	[IdCar] [int] NULL,
	[RentDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[RentMileage] [int] NOT NULL,
	[ReturnMileage] [int] NOT NULL,
	[MoneyInAdvance] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renters]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renters](
	[IdRenter] [int] NOT NULL,
	[RenterName] [nvarchar](50) NOT NULL,
	[RenterAddress] [nvarchar](100) NOT NULL,
	[IsCompany] [bit] NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
 CONSTRAINT [PK__Naematel__5C4872351378BC08] PRIMARY KEY CLUSTERED 
(
	[IdRenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Renters] ADD  CONSTRAINT [DF__Naemateli__Firma__24927208]  DEFAULT ((1)) FOR [IsCompany]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Categories] ([IdCategory])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([IdCar])
REFERENCES [dbo].[Cars] ([IdCar])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK__Dogovori__IdNaem__2C3393D0] FOREIGN KEY([IdRenter])
REFERENCES [dbo].[Renters] ([IdRenter])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK__Dogovori__IdNaem__2C3393D0]
GO
/****** Object:  StoredProcedure [dbo].[KilometrajMejduDati]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[KilometrajMejduDati] @date2 datetime
as 
    select Brand + ' ' + Model as [Автомобил], MAX(ReturnMileage) as [Текущ километраж]
	from Contracts as contracts
    inner join Cars as cars
    on cars.IdCar = contracts.IdCar
    where ReturnDate <= @date2
	group by Brand + ' ' + Model
GO
/****** Object:  StoredProcedure [dbo].[SearchByCategory]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[SearchByCategory] @kat nvarchar(30)
as
    select Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобилен №], cast(CostPerKm as real) as[Цена на км], categories.Name as [Категория], RentPerDay as [Наем на ден]
	from Cars as cars
    inner join Categories as categories
    on cars.IdCategory = categories.IdCategory
    where categories.Name = @kat
GO
/****** Object:  StoredProcedure [dbo].[SearchByNaem]    Script Date: 1/25/2022 6:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[SearchByNaem] @naem int
as
    select Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобилен №], cast(CostPerKm as real) as[Цена на км], categories.Name as [Категория], RentPerDay as [Наем на ден]
	from Cars as cars
	inner join Categories as categories
    on cars.IdCategory = categories.IdCategory
    where RentPerDay = @naem
GO
USE [master]
GO
ALTER DATABASE [TransmobilDB] SET  READ_WRITE 
GO
