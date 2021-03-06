use master
go

create database TransmobilDB collate Cyrillic_General_CI_AS
go

USE [TransmobilDB]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 1/26/2022 11:07:02 AM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 1/26/2022 11:07:02 AM ******/
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
/****** Object:  Table [dbo].[Contracts]    Script Date: 1/26/2022 11:07:02 AM ******/
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
/****** Object:  Table [dbo].[Renters]    Script Date: 1/26/2022 11:07:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renters](
	[IdRenter] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (1, N'СА 3456 СХ', N'Мерцедес', N'S - 300 Long', CAST(0.070000 AS Decimal(18, 6)), 1)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (2, N'СА 1783 ВА', N'Фолксваген', N'Пасат', CAST(0.045000 AS Decimal(18, 6)), 2)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (3, N'В 1222 АВ', N'Форд', N'Мондео', CAST(0.050000 AS Decimal(18, 6)), 2)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (4, N'В 9786 ТА', N'Фиат', N'Стило', CAST(0.035000 AS Decimal(18, 6)), 3)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (5, N'В 1088 А', N'Фолксваген', N'Голф 4', CAST(0.032500 AS Decimal(18, 6)), 3)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (6, N'СВ 0102 АВ', N'Ауди', N'A8 Quattro', CAST(0.065000 AS Decimal(18, 6)), 1)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (7, N'В 0599 СН', N'Рено', N'Меган', CAST(0.045000 AS Decimal(18, 6)), 2)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (8, N'В 4501 Н', N'Мерцедес', N'Спринтер', CAST(0.075000 AS Decimal(18, 6)), 4)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (9, N'С 2222 РТ', N'Порше', N'Panamera Turbo S', CAST(0.105000 AS Decimal(18, 6)), 1)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (10, N'СА 2332 АС', N'Рено', N'Клио', CAST(0.035000 AS Decimal(18, 6)), 3)
INSERT [dbo].[Cars] ([IdCar], [AutomobileNumber], [Brand], [Model], [CostPerKm], [IdCategory]) VALUES (11, N'В 3313 С', N'Тойота', N'Ярис', CAST(0.030000 AS Decimal(18, 6)), 3)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([IdCategory], [Name], [RentPerDay]) VALUES (1, N'Лимузина', 100)
INSERT [dbo].[Categories] ([IdCategory], [Name], [RentPerDay]) VALUES (2, N'Комби', 35)
INSERT [dbo].[Categories] ([IdCategory], [Name], [RentPerDay]) VALUES (3, N'Лека кола', 25)
INSERT [dbo].[Categories] ([IdCategory], [Name], [RentPerDay]) VALUES (4, N'Микробус', 75)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (1, 7, 1, CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-15T00:00:00.000' AS DateTime), 17340, 18050, 200)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (2, 10, 2, CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2021-01-23T00:00:00.000' AS DateTime), 20108, 22430, 250)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (3, 9, 3, CAST(N'2021-01-24T00:00:00.000' AS DateTime), CAST(N'2021-02-02T00:00:00.000' AS DateTime), 55463, 57234, 300)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (4, 6, 4, CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-02-04T00:00:00.000' AS DateTime), 81210, 83545, 125)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (5, 11, 5, CAST(N'2021-02-01T00:00:00.000' AS DateTime), CAST(N'2021-02-08T00:00:00.000' AS DateTime), 30404, 32120, 175)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (6, 1, 1, CAST(N'2021-03-19T00:00:00.000' AS DateTime), CAST(N'2021-03-24T00:00:00.000' AS DateTime), 18230, 20223, 500)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (7, 1, 6, CAST(N'2021-03-29T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime), 31456, 33103, 600)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (8, 8, 2, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2021-04-25T00:00:00.000' AS DateTime), 22870, 23656, 105)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (9, 9, 4, CAST(N'2021-04-23T00:00:00.000' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime), 84560, 85044, 100)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (10, 11, 6, CAST(N'2021-04-26T00:00:00.000' AS DateTime), CAST(N'2021-04-29T00:00:00.000' AS DateTime), 36789, 37505, 250)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (11, 8, 7, CAST(N'2021-04-29T00:00:00.000' AS DateTime), CAST(N'2021-05-01T00:00:00.000' AS DateTime), 50133, 51056, 70)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (12, 10, 3, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), 57313, 61033, 250)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (13, 7, 7, CAST(N'2021-05-24T00:00:00.000' AS DateTime), CAST(N'2021-05-27T00:00:00.000' AS DateTime), 52003, 53255, 105)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (14, 9, 2, CAST(N'2021-05-27T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime), 24000, 26056, 210)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (15, 4, 8, CAST(N'2021-06-07T00:00:00.000' AS DateTime), CAST(N'2021-06-12T00:00:00.000' AS DateTime), 32000, 34567, 400)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (16, 6, 1, CAST(N'2021-06-24T00:00:00.000' AS DateTime), CAST(N'2021-06-28T00:00:00.000' AS DateTime), 20975, 22500, 300)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (17, 2, 9, CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'2021-07-07T00:00:00.000' AS DateTime), 56789, 57890, 700)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (18, 9, 6, CAST(N'2021-07-10T00:00:00.000' AS DateTime), CAST(N'2021-07-21T00:00:00.000' AS DateTime), 42007, 44234, 1000)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (19, 9, 7, CAST(N'2021-08-02T00:00:00.000' AS DateTime), CAST(N'2021-08-07T00:00:00.000' AS DateTime), 54011, 56200, 175)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (20, 11, 1, CAST(N'2021-08-05T00:00:00.000' AS DateTime), CAST(N'2021-08-12T00:00:00.000' AS DateTime), 25300, 26123, 700)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (21, 9, 2, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 26340, 27504, 140)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (22, 3, 8, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-27T00:00:00.000' AS DateTime), 34804, 37345, 550)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (23, 2, 3, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-31T00:00:00.000' AS DateTime), 61419, 63599, 230)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (24, 4, 2, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 27700, 29355, 230)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (25, 8, 4, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 93567, 94707, 200)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (26, 4, 5, CAST(N'2021-09-13T00:00:00.000' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime), 32300, 34512, 220)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (27, 4, 10, CAST(N'2021-09-13T00:00:00.000' AS DateTime), CAST(N'2021-09-24T00:00:00.000' AS DateTime), 49023, 50350, 250)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (28, 8, 3, CAST(N'2021-09-26T00:00:00.000' AS DateTime), CAST(N'2021-10-03T00:00:00.000' AS DateTime), 63877, 65274, 215)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (29, 10, 5, CAST(N'2021-09-29T00:00:00.000' AS DateTime), CAST(N'2021-10-20T00:00:00.000' AS DateTime), 35208, 38233, 500)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (30, 2, 4, CAST(N'2021-09-29T00:00:00.000' AS DateTime), CAST(N'2021-10-02T00:00:00.000' AS DateTime), 96245, 97000, 80)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (31, 1, 2, CAST(N'2021-09-30T00:00:00.000' AS DateTime), CAST(N'2021-10-03T00:00:00.000' AS DateTime), 30243, 31026, 95)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (32, 8, 11, CAST(N'2021-10-06T00:00:00.000' AS DateTime), CAST(N'2021-10-16T00:00:00.000' AS DateTime), 21133, 22673, 250)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (33, 5, 2, CAST(N'2021-10-30T00:00:00.000' AS DateTime), CAST(N'2021-11-06T00:00:00.000' AS DateTime), 31500, 33340, 270)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (34, 1, 8, CAST(N'2021-11-03T00:00:00.000' AS DateTime), CAST(N'2021-11-13T00:00:00.000' AS DateTime), 38053, 41408, 700)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (35, 10, 3, CAST(N'2021-11-13T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 65550, 68277, 250)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (36, 2, 7, CAST(N'2021-11-17T00:00:00.000' AS DateTime), CAST(N'2021-11-22T00:00:00.000' AS DateTime), 57101, 58890, 150)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (37, 6, 7, CAST(N'2021-11-25T00:00:00.000' AS DateTime), CAST(N'2021-11-29T00:00:00.000' AS DateTime), 59122, 61335, 140)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (38, 7, 9, CAST(N'2021-11-25T00:00:00.000' AS DateTime), CAST(N'2021-11-29T00:00:00.000' AS DateTime), 59003, 59827, 300)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (39, 11, 11, CAST(N'2021-12-03T00:00:00.000' AS DateTime), CAST(N'2021-12-11T00:00:00.000' AS DateTime), 23062, 23994, 200)
INSERT [dbo].[Contracts] ([IdContract], [IdRenter], [IdCar], [RentDate], [ReturnDate], [RentMileage], [ReturnMileage], [MoneyInAdvance]) VALUES (40, 3, 9, CAST(N'2021-12-31T00:00:00.000' AS DateTime), CAST(N'2022-01-02T00:00:00.000' AS DateTime), 62454, 62890, 200)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Renters] ON
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (1, N'Галена Малинова', N'Разград, ул. "Лудогорец" № 10', 0, N'0899101101')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (2, N'Дафка Екатериновска', N'Чепеларе, ул. "Васил Левски" № 11', 0, N'0893203040')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (3, N'Иванка Лилиева', N'Кубрат, ул. "Княз Борис" № 1 Б', 0, N'0876000111')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (4, N'Никола Пенчев', N'Варна, ул. "Поп Ставри" № 31', 0, N'0874321123')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (5, N'Панайот Владигеров', N'Добрич, ул. "Петко Стайнов" № 12', 0, N'0883288880')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (6, N'Ради Руменов', N'Хасково, ул. "Речна" блок 13, вход А, ап. 3', 0, N'0877654321')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (7, N'Сирма ООД', N'София, бул. "Цариградско шосе" № 234, ет. 10', 1, N'0884202404')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (8, N'Сторми хилс', N'Габрово, ул. "Рачо ковача" № 1 Д', 1, N'0888001123')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (9, N'Трифон Славев', N'Плевен, ул. "Цар Асен" блок 1, етаж 3', 0, N'0878121314')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (10, N'Хепи холидейз', N'Тутракан, ул. "Иван Вазов" № 22, ет. 2', 1, N'0894100200')
INSERT [dbo].[Renters] ([IdRenter], [RenterName], [RenterAddress], [IsCompany], [Phone]) VALUES (11, N'Хюве фарма', N'Разград, ул. "Лудогорец" № 21, ет. 13, офис 2', 1, N'0876543345')
SET IDENTITY_INSERT [dbo].[Renters] OFF
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
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD CHECK  (([CostPerKm]>(0)))
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD CHECK  (([RentPerDay]>(0)))
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD CHECK  (([ReturnMileage]>[RentMileage]))
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD CHECK  (([ReturnDate]>=[RentDate]))
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD CHECK  (([MoneyInAdvance]>=(0)))
GO
