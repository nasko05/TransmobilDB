create or alter proc dbo.udp_UpdateKoli
	@IdCar int,
	@nAutomobileNumber nvarchar(13) = Null,
	@nBrand nvarchar(200) = Null,
	@nModel nvarchar(20) = Null,
	@nCostPerKm decimal(18, 6) = Null,
	@nIdCategory int = Null
as
begin
	declare @maxId1 int = cast((select max(IdCar) from Cars) as int)
	declare @maxId2 int = cast((select max(IdCategory) from Categories) as int)

	if(@IdCar <= 0 or @IdCar > @maxId1)
		print N'Invalid kola id!'
		return

	if @nAutomobileNumber is not null
		update Cars
		set AutomobileNumber = @nAutomobileNumber
		where Cars.IdCar = @IdCar

	if @nBrand is not null
		update Cars
		set Brand = @nBrand
		where Cars.IdCar = @IdCar
		
	if @nModel is not null
		update Cars
		set Model = @nModel
		where Cars.IdCar = @IdCar
		
	if @nCostPerKm is not null
		update Cars
		set CostPerKm = @nCostPerKm
		where Cars.IdCar = @IdCar
		
	if @nIdCategory is not null and @nIdCategory > 0 and @nIdCategory <= @maxId2
		update Cars
		set IdCategory = @nIdCategory
		where Cars.IdCar = @IdCar
	else
		print N'Ivalid kategoriq id!'

end

go

create or alter proc udp_DeleteKoli
	@IdCar int
as
begin
	declare @maxId1 int = cast((select max(IdCar) from Cars) as int)
	if @IdCar > @maxId1 or @IdCar <= 0
		print N'Invalid kola id!'
	else
		delete from Cars
		where IdCar = @IdCar
end

go

create or alter proc udp_InsertKoli
	@nAutomobileNumber nvarchar(13) = Null,
	@nBrand nvarchar(200) = Null,
	@nModel nvarchar(20) = Null,
	@nCostPerKm decimal(18, 6) = Null,
	@nIdCategory int = Null
as
begin
	declare @maxId int = cast((select max(IdCar) from Cars) as int)
	if(@nAutomobileNumber is null or @nBrand is null or @nModel is null or @nCostPerKm is null or @nIdCategory is null or @nIdCategory > @maxId or @nIdCategory <= 0)
		print N'Има грешни или невалидни данни!'
	else
		insert into Cars values(@nAutomobileNumber, @nBrand, @nModel, @nCostPerKm, @nIdCategory)
end

go