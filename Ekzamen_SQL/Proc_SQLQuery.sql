create proc CreateContentTransport as
begin
	declare  @name nvarchar(max),@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Transport - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
	
		INSERT INTO Transport(Name)
		VALUES (@name)
		end
end
go

create proc CreateContentDolcnost as
begin
	declare @name nvarchar(max), 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Dolcnost - '+convert(nvarchar,ROUND((1 + rand() * 100),0))

		INSERT INTO Dolcnost(Name)
		VALUES (@name)
		end
end
go

create proc CreateContentWorker as
begin
	declare @name nvarchar(max),@surname nvarchar(max),
	@i int, @Date date, @phone nvarchar(max), @email nvarchar(max)
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Name - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @surname=N'Surname - '+convert(nvarchar,ROUND((1 + rand() * 200),0))
			declare @ii int 
			set @ii=0
	
			set @email= (
				CASE
				WHEN ROUND((0 + rand() * 2),0) = 0 
				THEN Char(ROUND((50 + rand() * 90),0)) 
				else convert(nvarchar,ROUND((1 + rand() * 100),0)) end)
				+N'@gmail.com'

			set @phone=N'+0'+convert(nvarchar,ROUND(( 100000+ rand() * 9999999),0))
			set @Date = dateadd(DAY,round((rand()*400),0),'2019-01-01')
		INSERT INTO Worker(Name,DolcnostId,Email,Phone,Startwork,Surname)
		VALUES (@name,ROUND((1 + rand() * 100),0),@email,@phone,@Date,@surname )
		end
end
go


create proc CreateContentSotrudnikkk as
begin
	declare @iid int, 
	@i int
	set @i=401
	while @i<500
		begin
			set @i=@i+1
			set @iid=ROUND((401 + rand() * 500),0)

		INSERT INTO Sotrudnik(WorkerId)
		VALUES (@iid)
		end
end
go

create proc CreateContentTourisr as
begin
	declare @name nvarchar(max),@surname nvarchar(max) , 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Name - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @surname=N'Surname - '+convert(nvarchar,ROUND((1 + rand() * 200),0))
		INSERT INTO Tourist(Name,Surname)
		VALUES (@name, @surname)
		end
end
go

create proc CreateContentPayTour as
begin
	declare @iid int, 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @iid=ROUND((1 + rand() * 100),0)

		INSERT INTO PayTour(TouristId)
		VALUES (@iid)
		end
end
go

create proc CreateContentInterstingTour as
begin
	declare @iid int, 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @iid=ROUND((1 + rand() * 100),0)

		INSERT INTO InterestingTour(TouristId)
		VALUES (@iid)
		end
end
go

create proc CreateContentAtrraction as
begin
	declare @name nvarchar(max), 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Attraction - '+convert(nvarchar,ROUND((1 + rand() * 100),0))

		INSERT INTO Attractions(Name)
		VALUES (@name)
		end
end
go

create proc CreateContentCountry as
begin
	declare @name nvarchar(max), 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Country - '+convert(nvarchar,ROUND((1 + rand() * 100),0))

		INSERT INTO Country(Name)
		VALUES (@name)
		end
end
go

create proc CreateContentCity as
begin
	declare @name nvarchar(max), 
	@i int
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'City - '+convert(nvarchar,ROUND((1 + rand() * 100),0))

		INSERT INTO City(Name)
		VALUES (@name)
		end
end
go

create proc CreateContentHistoryVisitCountry as
begin
	declare @cityId int, @countryId int,
	@i int, @Date date
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @cityId=ROUND((1 + rand() * 100),0)
			set @countryId=ROUND((1 + rand() * 100),0)
			set @Date = dateadd(DAY,round((rand()*400),0),'2019-01-01')
		INSERT INTO HistoryVisitCountry(CityId,CountryId,DateVisit)
		VALUES (@cityId,@countryId,@Date)
		end
end
go

create proc CreateContentTour as
begin
	declare @name nvarchar(max),@AttractionsId int, @cost int ,@HistoryVisitCountryId int,
	@InterestingTourId int, @MaxClients int, @PayTourId int,@TransportId int,
	@i int, @DateEnd date, @DateStart date,@SotrId int
	set @i=0
	while @i<1000
		begin
			set @i=@i+1
			set @name=N'Name - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @AttractionsId=ROUND((1 + rand() * 100),0)
			set @cost=ROUND((100000 + rand() * 100),0)
			set @HistoryVisitCountryId=ROUND((0 + rand() * 100),0)
			set @InterestingTourId=ROUND((0 + rand() * 100),0)
			set @MaxClients=ROUND((10 + rand() * 100),0)
			set @PayTourId=ROUND((0 + rand() * 100),0)
			set @TransportId=ROUND((0 + rand() * 100),0)
			set @SotrId=ROUND((1106 + rand() * 1200),0)
			set @DateStart = dateadd(DAY,round((rand()*400),0),'2019-01-01')
			set @DateEnd = dateadd(DAY,round((rand()*400),0),@DateStart)
		INSERT INTO Tour(AttractionsId,Cost,DateEnd,DateStart,Description,
		HistoryVisitCountryId,InterestingTourId,MaxClients,Name,
		PayTourId,SotrId,TransportId,UrlImageAttractions,UrlImagehotel)
		VALUES (@AttractionsId,@cost, @DateEnd,@DateStart,N'',@HistoryVisitCountryId,
		@InterestingTourId, @MaxClients,@name,
		@PayTourId,@SotrId, @TransportId,N'...\\',N'...\\' )
		end
end
go


create proc CreateContentHistoryTour as
begin
	declare @iid int, 
	@i int
	set @i=0
	while @i<10000
		begin
			set @i=@i+1
			set @iid=ROUND((2400 + rand() * 2500),0)

		INSERT INTO HistoryTour(TourId)
		VALUES (@iid)
		end
end
go

alter  proc CreateContentCl as
begin
	declare @name nvarchar(max),@surname nvarchar(max),@NextTourId int,@HistoryTourId int,
	@i int, @Date date, @phone nvarchar(max) ,@Email nvarchar(max)
	set @i=0
	while @i<10000
		begin
			set @i=@i+1
			set @name=N'Name - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @surname=N'Surname - '+convert(nvarchar,ROUND((1 + rand() * 200),0))
			set @phone=N'+0'+convert(nvarchar,ROUND(( 100000+ rand() * 9999999),0))
			set @Date = dateadd(DAY,round((rand()*400),0),'2019-01-01')
			set @NextTourId=ROUND(( 2000+ rand() *  2599),0)
			set @HistoryTourId=ROUND(( 0+ rand() *2000),0)
			set @Email= (
				CASE
				WHEN ROUND((0 + rand() * 2),0) = 0 
				THEN Char(ROUND((50 + rand() * 90),0)) 
				else convert(nvarchar,ROUND((1 + rand() * 100),0)) end)
				+N'@gmail.com'

		INSERT INTO Clients(Name, Surname, Phone,NextTourId,HistoryTourId,Email,DateOfBirthday)
		VALUES (@name, @surname,@phone,@NextTourId,@HistoryTourId, @Email,@Date)
		end
end
go


