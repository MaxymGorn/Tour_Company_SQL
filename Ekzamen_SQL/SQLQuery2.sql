











exec CreateContentCl
select * from Tour
select * from Clients
select * from HistoryTour


alter  proc CreateContentCl as
begin
	declare @name nvarchar(max),@surname nvarchar(max),@NextTourId int,@HistoryTourId int,
	@i int, @Date date, @phone nvarchar(max) ,@Email nvarchar(max)
	set @i=0
	while @i<10
		begin
			set @i=@i+1
			set @name=N'Name - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @surname=N'Surname - '+convert(nvarchar,ROUND((1 + rand() * 200),0))
			set @phone=N'+0'+convert(nvarchar,ROUND(( 100000+ rand() * 9999999),0))
			set @Date = dateadd(DAY,round((rand()*400),0),'2019-01-01')
			set @NextTourId=2299
			set @HistoryTourId=665
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