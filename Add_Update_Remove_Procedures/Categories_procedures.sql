create or alter proc udp_UpdateCenorazpis
	@IdCategory int,
	@nCategory nvarchar(20) = null,
	@nRentPerDay int = null
as
begin
	declare @maxId int = cast((select max(IdCategory) from Categories) as int)
	if(@IdCategory <= 0 or @IdCategory > @maxId)
		print N'Invalid kategoriq id!'
		return

	if @nCategory is not null
		update Categories
		set Categories.Name = @nCategory
		where Categories.IdCategory = @IdCategory

	if @nRentPerDay is not null
		update Categories
		set RentPerDay = @nRentPerDay
		where Categories.IdCategory = @IdCategory
end

go

create or alter proc udp_DeleteCenorazpis
	@IdCategory int
as
begin
	declare @maxId int = cast((select max(IdCategory) from Categories) as int)

	if @IdCategory > @maxId or @IdCategory <= 0
		print N'Invalid kategoriq id!'
	else
		delete from Categories
		where IdCategory = @IdCategory
end

go

create or alter proc udp_InsertCenorazpis
	@nCategory nvarchar(20) = null,
	@nRentPerDay int = null
as
begin
	if @nCategory is null or @nRentPerDay is null
		print 'Invalid information!'
	else
		insert into Categories
		values(@nCategory, @nRentPerDay)
end

go