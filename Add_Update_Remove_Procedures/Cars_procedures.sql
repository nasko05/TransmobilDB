--create or alter proc dbo.udp_UpdateKoli
--	@IdCar int,
--	@nAutomobileNumber nvarchar(13) = Null,
--	@nBrand nvarchar(200) = Null,
--	@nModel nvarchar(20) = Null,
--	@nCostPerKm decimal(18, 6) = Null,
--	@nIdCategory int = Null
--as
--begin
--	declare @maxId1 int = cast((select max(IdCar) from Cars) as int)
--	declare @maxId2 int = cast((select max(IdCategory) from Categories) as int)

--	if @IdCar < 1 or @IdCar > @maxId1
--	begin
--		print N'Invalid kola id!'
--		return
--	end

--	if @nAutomobileNumber is not null
--	begin
--		update Cars
--		set AutomobileNumber = @nAutomobileNumber
--		where Cars.IdCar = @IdCar
--	end

--	if @nBrand is not null
--	begin
--		update Cars
--		set Brand = @nBrand
--		where Cars.IdCar = @IdCar
--	end
		
--	if @nModel is not null
--	begin
--		update Cars
--		set Model = @nModel
--		where Cars.IdCar = @IdCar
--	end
		
--	if @nCostPerKm is not null
--	begin
--		update Cars
--		set CostPerKm = @nCostPerKm
--		where Cars.IdCar = @IdCar
--	end
		
--	if @nIdCategory is not null and @nIdCategory > 0 and @nIdCategory <= @maxId2
--	begin
--		update Cars
--		set IdCategory = @nIdCategory
--		where Cars.IdCar = @IdCar
--	end

--	print 'Gotovo'

--end

--go

----exec dbo.udp_UpdateKoli @IdCar = 5, @nBrand= N'BMW'
--go

--create or alter proc udp_DeleteKoli
--	@IdCar int
--as
--begin
--	declare @maxId1 int = cast((select max(IdCar) from Cars) as int)
--	if @IdCar > @maxId1 or @IdCar <= 0
--		print N'Invalid kola id!'
--	else
--		delete from Cars
--		where IdCar = @IdCar
--end

--go
----exec udp_DeleteKoli 12
--go
--create or alter proc udp_InsertKoli
--	@nAutomobileNumber nvarchar(13) = Null,
--	@nBrand nvarchar(200) = Null,
--	@nModel nvarchar(20) = Null,
--	@nCostPerKm decimal(18, 6) = Null,
--	@nIdCategory int = Null
--as
--begin
--	declare @maxId int = cast((select max(IdCar) from Cars) as int)
--	if(@nAutomobileNumber is null or @nBrand is null or @nModel is null or @nCostPerKm is null or @nIdCategory is null or @nIdCategory > @maxId or @nIdCategory <= 0)
--		print N'Има грешни или невалидни данни!'
--	else
--		insert into Cars values(@nAutomobileNumber, @nBrand, @nModel, @nCostPerKm, @nIdCategory)
--end

--go