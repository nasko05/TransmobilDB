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
create or alter proc SearchByNaem @naem int
as
    select Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобилен №], cast(CostPerKm as real) as[Цена на км], categories.Name as [Категория], RentPerDay as [Наем на ден]
	from Cars as cars
	inner join Categories as categories
    on cars.IdCategory = categories.IdCategory
    where RentPerDay = @naem
go

exec SearchByNaem @naem = 35
--------------------------------------------
------------     Задача 2.1     ------------
--------------------------------------------
--create or alter function udf_Kilometri_data(
--	@date datetime
--)
--returns @rtn_table table(CarId int, CarName nvarchar(40), Km int)
--as
--begin
--	insert into @rtn_table
--	select Cars.IdCar, Brand + ' ' + Model as [Car], SUM(ReturnMileage - RentMileage)
--	from Cars
--	left outer join (select * from Contracts where ReturnDate <= @date) as contracts
--	on contracts.IdCar = Cars.IdCar
--	group by Brand + ' ' + Model, Cars.IdCar
--return
--end

--go

--	select *
--	from udf_Kilometri_data('2022-01-27 00:00:00.000')
--------------------------------------------
------------     Задача 2.2     ------------
--------------------------------------------
--create or alter proc udp_Kilometri_period
--	@date1 datetime,
--	@date2 datetime
--as
--begin
--	select Cars.IdCar, Brand + ' ' + Model as [Car], SUM(ReturnMileage - RentMileage) as [Km]
--	from Cars
--	left outer join (select * from Contracts where RentDate >= @date1 and ReturnDate <= @date2) as contracts
--	on contracts.IdCar = Cars.IdCar
--	group by Brand + ' ' + Model, Cars.IdCar
--end

--go

--exec udp_Kilometri_period @date1 = '2021-08-22 00:00:00.000', @date2 = '2021-09-10 00:00:00.000'
--------------------------------------------
------------     Задача 3.1     ------------
--------------------------------------------
--create or alter function udf_prihod(
--	@avto_nomer nvarchar(30)
--	)
--returns @rtn_table table(Avtomobil nvarchar(30), Obsht_prihod real)
--as
--begin
--	insert into @rtn_Table
--	select Brand + ' ' + Model as [Автомобил], SUM(iif( IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm + MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) + MoneyInAdvance)) as [Общ приход]
--	from Contracts as contracts
--	inner join Cars as cars
--	on contracts.IdCar = cars.IdCar
--	inner join  Renters as renters
--	on contracts.IdRenter = renters.IdRenter
--	inner join Categories as categories
--	on cars.IdCategory = categories.IdCategory
--	where AutomobileNumber = @avto_nomer
--	group by Brand + ' ' + Model
--	return

--end
--go

--declare @avto_nomer nvarchar(30) = N'СА 3456 СХ'
--select *
--from dbo.udf_prihod(@avto_nomer)

--go
--------------------------------------------
------------     Задача 3.2     ------------
--------------------------------------------
--create or alter function udf_prihod_kategoriq(
--	@kategoriq nvarchar(30)
--)
--returns @rtn_table table(Avtomobil nvarchar(30), Obsht_prihod real)
--as
--begin
--	insert into @rtn_Table
--	select Brand + ' ' + Model as [Автомобил], SUM(iif( IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm + MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) + MoneyInAdvance)) as [Общ приход]
--	from Contracts as contracts
--	inner join Cars as cars
--	on contracts.IdCar = cars.IdCar
--	inner join  Renters as renters
--	on contracts.IdRenter = renters.IdRenter
--	inner join Categories as categories
--	on cars.IdCategory = categories.IdCategory
--	where Name = @kategoriq
--	group by Brand + ' ' + Model
--	return
--end
--go

--declare @kategoriq nvarchar(30) = N'Лимузина'
--select *
--from dbo.udf_prihod_kategoriq(@kategoriq)

--go
--------------------------------------------
------------     Задача 3.3     ------------
--------------------------------------------
--create or alter function udf_prihod_ime(
--	@client nvarchar(30)
--)
--returns @rtn_table table(Avtomobil nvarchar(30), Obsht_prihod real)
--as
--begin
--	insert into @rtn_Table
--	select RenterName as [Име],  SUM(iif( IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm + MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) + MoneyInAdvance)) as [Общ приход]
--	from Contracts as contracts
--	inner join Cars as cars
--	on contracts.IdCar = cars.IdCar
--	inner join  Renters as renters
--	on contracts.IdRenter = renters.IdRenter
--	inner join Categories as categories
--	on cars.IdCategory = categories.IdCategory
--	where RenterName like '%' + @client + '%'
--	group by RenterName
--	return
--end
--go

--declare @client nvarchar(30) = N'РА'
--select *
--from dbo.udf_prihod_ime(@client)

--go
--------------------------------------------
------------      Задача 4      ------------
--------------------------------------------
--create or alter function udf_avans_doplashtane()
--returns @rtnTable table(contractsId int, avans int, ostatuk real)
--as
--begin
--	declare @ostatuk int
--	declare @avans int

--	insert into @rtnTable
--	select IdContract as [Договор №], MoneyInAdvance as [Плащане в аванс], iif(IsCompany = 1,(datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*CostPerKm - MoneyInAdvance, (datediff(day, RentDate, ReturnDate)+1)*RentPerDay + (ReturnMileage - RentMileage)*(CostPerKm*0.9) - MoneyInAdvance) as [Доплащане]
--	from Contracts as contracts
--	inner join Cars as Cars
--	on contracts.IdCar = Cars.IdCar
--	inner join  Renters as Renters
--	on contracts.IdRenter = Renters.IdRenter
--	inner join Categories as Categories
--	on Cars.IdCategory = Categories.IdCategory

--	return
--	end
--	go

--	select *
--	from udf_avans_doplashtane()
--	go
------------------------------------------
------------      Задача 5      ------------
--------------------------------------------
--create or alter function udf_puti_naemane(
--	@startdate datetime,
--	@enddate datetime
--)
--returns @rtn_table table(Model nvarchar(40), Puti int)
--as
--begin
--	insert into @rtn_table
--	select Model, count(Model) as Puti
--	from Contracts
--	inner join Cars as Cars
--	on Contracts.IdCar = Cars.IdCar
--	where RentDate>= @startdate and
--	RentDate <= @enddate
--	group by Cars.Model
--return
--end
--go

--select *
--from udf_puti_naemane('2021-10-16 00:00:00.000', '2021-12-3 00:00:00.000')
--------------------------------------------
------------      Задача 6      ------------
--------------------------------------------
--create or alter function udf_last_10()
--returns @rtn_table table(IdContracts int, NaematelName nvarchar(30), Avtomobil nvarchar(50), AvtomonilNum nvarchar(10), DataNaemane datetime, ReturnDate datetime)
--as
--begin
--	insert into @rtn_table
--	select TOP(10) IdContract as [Договор №], RenterName as [Име на наемателя], Brand + ' ' + Model as [Автомобил], AutomobileNumber as [Автомобил №], RentDate as [Дата на наемане], ReturnDate as [Дата на връщане]
--	from Contracts as contracts
--	inner join Cars as Cars
--	on contracts.IdCar = Cars.IdCar
--	inner join  Renters as Renters
--	on contracts.IdRenter = Renters.IdRenter
--	inner join Categories as Categories
--	on Cars.IdCategory = Categories.IdCategory
--	order by RentDate desc, ReturnDate desc, IdContract desc
--	return
--end
--	go

--	select *
--	from dbo.udf_last_10()