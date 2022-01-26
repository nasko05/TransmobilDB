--create or alter proc udp_UpdateCenorazpis
--	@IdCategory int,
--	@nCategory nvarchar(20) = null,
--	@nRentPerDay int = null
--as
--begin
--	declare @maxId int = cast((select max(IdCategory) from Categories) as int)

--	if(@IdCategory <= 0 or @IdCategory > @maxId)
--	begin
--		print N'Invalid kategoriq id!'
--		return
--	end

--	if @nCategory is not null
--	begin
--		update Categories
--		set Categories.Name = @nCategory
--		where Categories.IdCategory = @IdCategory
--	end

--	if @nRentPerDay is not null
--	begin
--		update Categories
--		set RentPerDay = @nRentPerDay
--		where Categories.IdCategory = @IdCategory
--	end

--end

--go

--	--exec udp_UpdateCenorazpis 3, @nRentPerDay = 500

--go
--create or alter proc udp_DeleteCenorazpis
--	@IdCategory int
--as
--begin
--	declare @maxId int = cast((select max(IdCategory) from Categories) as int)

--	if @IdCategory > @maxId or @IdCategory <= 0
--		print N'Invalid kategoriq id!'
--	else
--		delete from Categories
--		where IdCategory = @IdCategory
--end

--go

--	--exec udp_DeleteCenorazpis 5

--go
--create or alter proc udp_InsertCenorazpis
--	@nCategory nvarchar(20) = null,
--	@nRentPerDay int = null
--as
--begin
--	if @nCategory is null or @nRentPerDay is null
--		print N'Invalid information!'
--	else
--	begin
--		insert into Categories
--		values(@nCategory, @nRentPerDay)
--	end
--end

--go

----exec udp_InsertCenorazpis N'Джип', 200