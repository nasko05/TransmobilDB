create or alter proc udp_UpdateContracts
	@IdContract int,
	@IdRenter int = null,
	@IdCar int = null,
	@RentDate datetime = null,
	@ReturnDate datetime = null,
	@RentMileage int = null,
	@ReturnMileage int = null,
	@MoneyInAdvance int = null
as
begin
	declare @maxId1 int = cast((select max(IdContract) from Contracts) as int)
	declare @maxId2 int = cast((select max(IdRenter) from Renters) as int)
	declare @maxId3 int = cast((select max(IdCar) from Cars) as int)

	if @IdContract <= 0 or @IdContract > @maxId1
		print N'Invalid dogovor id!'
		return

	if @IdRenter is not null and @IdRenter > 0 and @IdRenter <= @maxId2
		update Contracts
		set IdRenter = @IdRenter
		where Contracts.IdContract = @IdContract

	if @IdCar is not null and @IdCar > 0 and @IdCar <= @maxId3
		update Contracts
		set IdCar = @IdCar
		where Contracts.IdContract = @IdContract

	if @RentDate is not null
		update Contracts
		set RentDate = @RentDate
		where Contracts.IdContract = @IdContract

	if @ReturnDate is not null
		update Contracts
		set ReturnDate = @ReturnDate
		where Contracts.IdContract = @IdContract

	if @RentMileage is not null
		update Contracts
		set RentMileage = @RentMileage
		where Contracts.IdContract = @IdContract

	if @ReturnMileage is not null
		update Contracts
		set ReturnMileage = @ReturnMileage
		where Contracts.IdContract = @IdContract

	if @MoneyInAdvance is not null
		update Contracts
		set MoneyInAdvance = @MoneyInAdvance
		where Contracts.IdContract = @IdContract
end

go

create or alter proc DeleteContracts
	@IdContract int
as
begin
	declare @maxId int = cast((select max(IdContract) from Contracts) as int)

	if @IdContract < 1 or @IdContract > @maxId
		print N'Invalid dogovor id!'
	else
		delete from Contracts
		where IdContract = @IdContract
end

go

create or alter proc udp_InsertContracts
	@IdRenter int = null,
	@IdCar int = null,
	@RentDate datetime = null,
	@ReturnDate datetime = null,
	@RentMileage int = null,
	@ReturnMileage int = null,
	@MoneyInAdvance int = null
as
begin
	declare @maxId1 int = cast((select max(IdRenter) from Renters) as int)
	declare @maxId2 int = cast((select max(IdCar) from Cars) as int)
	if(@IdRenter is null or @IdRenter < 1 or @IdRenter > @maxId1 or @IdCar is null or @IdCar < 1 or @IdCar > @maxId2 or @RentDate is null or @ReturnDate is null or @RentMileage is null or @ReturnMileage is null or @MoneyInAdvance is null)
		print N'Има грешни или невалидни данни!'
	else
		insert into Contracts values(@IdRenter, @IdCar, @RentDate, @ReturnDate, @RentMileage, @ReturnMileage, @MoneyInAdvance)
end

go