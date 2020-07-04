--Отобразите информацию о всех турах, которые стартуют
--в указанном диапазоне дат. Диапазон дат передаётся в качестве параметра
create FUNCTION ShowDate (@date1 date, @date2 date)
RETURNS @result_table2 
TABLE(Name nvarchar(max), Cost money, DateStart date, DateEnd date,
Desciption nvarchar(max), MaxClients int,Fullname nvarchar(max), Country nvarchar(max)) 
AS
BEGIN
    insert into @result_table2
	select  t.Name,T.Cost, T.DateStart, T.DateEnd, T.Description,
	T.MaxClients, w.Name+' '+w.Surname as N'Full name sotrudink', 
	co.Name
	from Tour T inner join Sotrudnik s on s.Id=t.SotrId, Worker w, HistoryVisitCountry hv, Country co
	where T.DateStart  BETWEEN @date1  AND @date2   and w.Id=s.WorkerId and co.Id=hv.CountryId and hv.Id=T.HistoryVisitCountryId
	return;
END
go

--Отобразите информацию о всех турах, которые посетят
--указанную страну. Страна передаётся в качестве параметра
create FUNCTION ShowCountry (@Country_name nvarchar(max))
RETURNS @result_table2 
TABLE(Name nvarchar(max), Cost money, DateStart date, DateEnd date,
Desciption nvarchar(max), MaxClients int,Fullname nvarchar(max), Country nvarchar(max)) 
AS
BEGIN
    insert into @result_table2
	select  t.Name,T.Cost, T.DateStart, T.DateEnd, T.Description,
	T.MaxClients, w.Name+' '+w.Surname as N'Full name sotrudink', 
	co.Name
	from Tour T inner join Sotrudnik s on s.Id=t.SotrId, Worker w, HistoryVisitCountry hv, Country co
	where   w.Id=s.WorkerId and co.Id=hv.CountryId and hv.Id=T.HistoryVisitCountryId
	return;
END
go

--Показать для конкретного туриста по ФИО список всех
--его туров. ФИО туриста передаётся в качестве параметра
create FUNCTION ShowTourByTourist (@Name nvarchar(max), @Surname nvarchar(max))
RETURNS @result_table2 
TABLE(NameTour nvarchar(max)) 
AS
BEGIN
    insert into @result_table2
	select t.Name
	from Tourist touri, Tour t, InterestingTour It, PayTour Pt
	where t.InterestingTourId=It.Id and t.PayTourId=Pt.Id and touri.Id=It.TouristId and touri.Id=Pt.TouristId
	and touri.Name=@Name  and touri.Surname=@Surname
	return;
END
go



--Проверить для конкретного туриста по ФИО находится
--ли он сейчас в туре. ФИО туриста передаётся в качестве
--параметра
CREATE function ISTour(@Name nvarchar(max), @Surname nvarchar(max)) 
returns nvarchar(max)
as
BEGIN
declare @res int
set @res=(select count(tour.Id)
from Tour t, Tourist tour, PayTour Pt
where t.PayTourId=Pt.Id and tour.Id=Pt.TouristId and( GETDATE() between t.DateStart and t.DateEnd)
and @Name=tour.Name and @Surname=tour.Surname)
RETURN  case @res 
when 0 then 'No'
else 'Yes' end
END
go

--Отобразить информацию о том, где находится конкретный турист по ФИО. Если турист не в туре сгенерировать
--ошибку с описанием возникшей проблемы. ФИО туриста
--передаётся в качестве параметра
CREATE function WhereToStay(@Name nvarchar(max), @Surname nvarchar(max)) 
returns nvarchar(max)
as
BEGIN
declare @res int, @country nvarchar(max)
set @res=(select count(tour.Id)
from Tour t, Tourist tour, PayTour Pt, Country co, HistoryVisitCountry hv
where t.PayTourId=Pt.Id and tour.Id=Pt.TouristId and( GETDATE() between t.DateStart and t.DateEnd)
and @Name=tour.Name and @Surname=tour.Surname and co.Id=hv.CountryId and hv.Id=t.HistoryVisitCountryId)
set @country=(select co.Name
from Tour t, Tourist tour, PayTour Pt, Country co, HistoryVisitCountry hv
where t.PayTourId=Pt.Id and tour.Id=Pt.TouristId and( GETDATE() between t.DateStart and t.DateEnd)
and @Name=tour.Name and @Surname=tour.Surname and co.Id=hv.CountryId and hv.Id=t.HistoryVisitCountryId)
RETURN  case @res 
when 0 then 'Eror!!!'
else @country end
END
go

--
create FUNCTION ShowTourByTransport (@Name nvarchar(max))
RETURNS @result_table2 
TABLE(Name nvarchar(max), Cost money, DateStart date, DateEnd date,
Desciption nvarchar(max), MaxClients int,Fullname nvarchar(max), Country nvarchar(max)) 
AS
BEGIN
  insert into @result_table2
	select  t.Name,T.Cost, T.DateStart, T.DateEnd, T.Description,
	T.MaxClients, w.Name+' '+w.Surname as N'Full name sotrudink', 
	co.Name
	from Tour T inner join Sotrudnik s on s.Id=t.SotrId, Worker w, HistoryVisitCountry hv, Country co, Transport tr
	where T.DateStart  BETWEEN @date1  AND @date2   and w.Id=s.WorkerId and co.Id=hv.CountryId and hv.Id=T.HistoryVisitCountryId
	and tr.Id=T.TransportId and tr.Name=@Name
	return;
END
go


