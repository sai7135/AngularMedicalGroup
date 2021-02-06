create database angularmedicalgroupmaterial
create table Organization(
	organizationId nvarchar(20) primary key,
	category nvarchar(50),
	organizationName nvarchar(100) not null,
	organizationLongName nvarchar(200) not null,
	accountingSystemName nvarchar(50),
	taxId nvarchar(9),
	organizationNpi nvarchar(10),
	ssn nvarchar(10),
	taxonomyCode nvarchar(10) not null,
	capitationAccount nvarchar(20),
	claimsAccount nvarchar(10),
	
	ptoAddress1 nvarchar(200) not null,
	ptoAddress2 nvarchar(200),
	ptoCity nvarchar(50) not null,
	ptoState nvarchar(2) not null,
	ptoZip nvarchar(15)not null,
	ptoInternationalZip nvarchar(15),
	ptoCountryDistict nvarchar(15),
	ptoCountry nvarchar(15),
	ptoPhone nvarchar(50),
	ptoFax nvarchar(50),
	ptoEmail nvarchar(100),
	ptoContactPerson nvarchar(100),
	
	blAddress1 nvarchar(200),
	blAddress2 nvarchar(200),
	blCity nvarchar(50),
	blState nvarchar(2),
	blZip nvarchar(15),
	blInternationalZip nvarchar(15),
	blCountryDistict nvarchar(15),
	blCountry nvarchar(15),
	blPhone nvarchar(50),
	blFax nvarchar(50),
	blEmail nvarchar(100),
	blContactPerson nvarchar(100)
)


alter proc sporgcrud @organizationId nvarchar(20)=null,
	@category nvarchar(50)=null,
	@organizationName nvarchar(100)=null,
	@organizationLongName nvarchar(200)= null,
	@accountingSystemName nvarchar(50)=null,
	@taxId nvarchar(9)=null,
	@organizationNpi nvarchar(10)=null,
	@ssn nvarchar(10)=null,
	@taxonomyCode nvarchar(10)= null,
	@capitationAccount nvarchar(20)=null,
	@claimsAccount nvarchar(10)=null,
	@ptoAddress1 nvarchar(200)=null,
	@ptoAddress2 nvarchar(200)=null,
	@ptoCity nvarchar(50)= null,
	@ptoState nvarchar(2)= null,
	@ptoZip nvarchar(15)= null,
	@ptoInternationalZip nvarchar(15)=null,
	@ptoCountryDistict nvarchar(15)=null,
	@ptoCountry nvarchar(15)=null,
	@ptoPhone nvarchar(50)=null,
	@ptoFax nvarchar(50)=null,
	@ptoEmail nvarchar(100)=null,
	@ptoContactPerson nvarchar(100)=null,
	@blAddress1 nvarchar(200)=null,
	@blAddress2 nvarchar(200)=null,
	@blCity nvarchar(50)=null,
	@blState nvarchar(2)=null,
	@blZip nvarchar(15)=null,
	@blInternationalZip nvarchar(15)=null,
	@blCountryDistict nvarchar(15)=null,
	@blCountry nvarchar(15)=null,
	@blPhone nvarchar(50)=null,
	@blFax nvarchar(50)=null,
	@blEmail nvarchar(100)=null,
	@blContactPerson nvarchar(100)=null,
	@operation nvarchar,
	@condition nvarchar(1000)=null
	as
	begin
		if(@operation='c')
		begin
			insert into Organization values(@organizationId,@category,@organizationName,@organizationLongName,@accountingSystemName,@taxId,@organizationNpi,@ssn,@taxonomyCode,@capitationAccount,@claimsAccount,@ptoAddress1,@ptoAddress2,@ptoCity,@ptoState,@ptoZip,@ptoInternationalZip,@ptoCountryDistict,@ptoCountry,@ptoPhone,@ptoFax,@ptoEmail,@ptoContactPerson,@blAddress1,@blAddress2,@blCity,@blState,@blZip,@blInternationalZip,@blCountryDistict,@blCountry,@blPhone,@blFax,@blEmail,@blContactPerson);
			select * from Organization where organizationId=@organizationId;
		end
		else if(@operation='r')
		begin
			declare @sqlr nvarchar(1100);
			if(@condition is null)
			begin
				set @sqlr='select * from Organization';
			end
			else
			begin
				set @sqlr='select * from Organization where ' +@condition;
			end
			exec sp_executesql @sqlr;
		end
		else if(@operation='u')
		begin
			declare @sqlu nvarchar(500);
			set @sqlu='update Organization set '+@condition;
			exec sp_executesql @sqlu;
		end
		else if(@operation='d')
		begin
			delete from Organization where organizationId=@organizationId
		end
	end
	
