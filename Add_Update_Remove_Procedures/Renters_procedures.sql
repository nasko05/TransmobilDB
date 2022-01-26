create or alter proc dbo.usp_UpdateRenters
	@IdRenter int,
	@nRenterName nvarchar(50) = Null,
	@nRenterAddress nvarchar(100) = Null,
	@IsCompany bit = Null,
	@nPhone nvarchar(13) = Null
as
begin
	declare @maxId int = cast((select top 1 IdRenter from Renters order by IdRenter desc) as int)

	if(@IdRenter <= 0 or @IdRenter > @maxId)
		print N'Invalid naematel id!'
		return

    if @nRenterName is not null
		update Renters
		set RenterName = @nRenterName
		where Renters.IdRenter = @IdRenter

    if @nRenterAddress is not null
		update Renters
		set RenterAddress = @nRenterAddress
		where Renters.IdRenter = @IdRenter

    if @IsCompany is not null
		update Renters
		set IsCompany = @IsCompany
		where Renters.IdRenter = @IdRenter

    if @nPhone is not null
		update Renters
		set Phone = @nPhone
		where Renters.IdRenter = @IdRenter
end

go

create or alter proc udp_DeleteNaemateli
	@IdRenter int
as
begin
	declare @maxId int = cast((select top 1 IdRenter from Renters order by IdRenter desc) as int)

	if(@IdRenter <= 0 or @IdRenter > @maxId)
		print N'Invalid id!'
		return
	delete from Renters
	where IdRenter = @IdRenter
end

go

create or alter proc udp_InsertNaemateli
	@nRenterName nvarchar(50) = Null,
	@nRenterAddress nvarchar(100) = Null,
	@IsCompany bit = Null,
	@nPhone nvarchar(13) = Null
as
begin
	if(@nRenterName is null or @nRenterAddress is null or @IsCompany is null or @nPhone is null)
		print N'Има грешни или невалидни данни!'
	else
		insert into Renters values(@nRenterName, @nRenterAddress, @IsCompany, @nPhone)
end

go