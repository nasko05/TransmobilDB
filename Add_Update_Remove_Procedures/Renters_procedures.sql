--create or alter proc dbo.usp_UpdateRenters
--	@IdRenter int,
--	@nRenterName nvarchar(50) = Null,
--	@nRenterAddress nvarchar(100) = Null,
--	@IsCompany bit = Null,
--	@nPhone nvarchar(13) = Null
--as
--begin
--	declare @maxId int = cast((select top 1 IdRenter from Renters order by IdRenter desc) as int)

--	if(@IdRenter <= 0 or @IdRenter > @maxId)
--	begin
--		print N'Invalid naematel id!'
--		return
--	end

--    if @nRenterName is not null
--	begin
--		update Renters
--		set RenterName = @nRenterName
--		where Renters.IdRenter = @IdRenter
--	end

--    if @nRenterAddress is not null
--	begin
--		update Renters
--		set RenterAddress = @nRenterAddress
--		where Renters.IdRenter = @IdRenter
--	end

--    if @IsCompany is not null
--	begin
--		update Renters
--		set IsCompany = @IsCompany
--		where Renters.IdRenter = @IdRenter
--	end

--    if @nPhone is not null
--	begin
--		update Renters
--		set Phone = @nPhone
--		where Renters.IdRenter = @IdRenter
--	end
--end

--go

--create or alter proc udp_DeleteNaemateli
--	@IdRenter int
--as
--begin
--	declare @maxId int = cast((select top 1 IdRenter from Renters order by IdRenter desc) as int)

--	if(@IdRenter <= 0 or @IdRenter > @maxId)
--		print N'Invalid id!'
--	else
--		delete from Renters
--		where IdRenter = @IdRenter
--end

--go

--	--exec udp_DeleteNaemateli 12

--go
--create or alter proc udp_InsertNaemateli
--	@nRenterName nvarchar(50) = Null,
--	@nRenterAddress nvarchar(100) = Null,
--	@IsCompany bit = Null,
--	@nPhone nvarchar(13) = Null
--as
--begin
--	if(@nRenterName is null or @nRenterAddress is null or @IsCompany is null or @nPhone is null)
--		print N'Има грешни или невалидни данни!'
--	else
--		insert into Renters values(@nRenterName, @nRenterAddress, @IsCompany, @nPhone)
--end

--go

----exec udp_InsertNaemateli 'Toshko', 'Levski', 0, '0874826195'