
--1
select * from ViewTour
--2
select * from ShowDate('2000-10-10 00:00:00','2020-10-10 00:00:00')
--3
select * from ShowCountry(N'Ukraine')

--4 Показать самый популярный актуальный тур (по максимальному количеству купленных туристических путевок)
CREATE TABLE #Max
(Value int, Name nvarchar(max))
INSERT INTO #Max
select  count(cl.NextTourId),t.Name
from Clients cl, Tour t where cl.NextTourId=t.Id group by t.Name
select Name as 'Most popular tour' from #Max where Value=(select max(m.Value) from #Max m)
drop table #Max


--5 Показать самый популярный архивный тур (по максимальному количеству купленных туристических путевок)
CREATE TABLE #Max
(Value int, Name nvarchar(max))
INSERT INTO #Max
select  count(cl.HistoryTourId),t.Name
from Clients cl, Tour t where cl.HistoryTourId=t.Id group by t.Name
select Name as 'Most popular tour' from #Max where Value=(select max(m.Value) from #Max m)
drop table #Max

--6 Показать самый непопулярный актуальный тур (по минимальному количеству купленных туристических путевок)
CREATE TABLE #Max
(Value int, Name nvarchar(max))
INSERT INTO #Max
select  count(cl.NextTourId),t.Name
from Clients cl, Tour t where cl.NextTourId=t.Id group by t.Name
select Name as 'Most popular tour' from #Max where Value=(select min(m.Value) from #Max m)
drop table #Max


--7
select * from ShowTourByTourist(N'Name-1',N'Surname-2')
--8
select  dbo.ISTour('r','e') as N'Is tour'
--9
select dbo.WhereToStay('','') as N'Country'
--10
CREATE TABLE #Max
(Value int, Name nvarchar(max))
INSERT INTO #Max
	select  count(t.Id),tour.Name+' '+ tour.Surname as N'Full name tourist'
	from Tourist tour, PayTour pt, Tour t 
	where pt.TouristId=tour.Id and t.PayTourId=pt.Id 
	group  by tour.Name+' '+ tour.Surname
select Name as 'Most active tourist' from #Max where Value=(select max(m.Value) from #Max m)
drop table #Max
--11
select* from ShowTourByTransport('Tr') 
go
--12,13,15 - TrigerSQLQuery.sql
--14
CREATE TABLE #Max
(Value int, Name nvarchar(max))
INSERT INTO #Max
	select  count(t.Id), att.Name
	from Tourist tour, PayTour pt, Tour t , Attractions att
	where pt.TouristId=tour.Id and t.PayTourId=pt.Id and att.Id=t.AttractionsId 
	group  by att.Name
select Name as 'Most active Attraction' from #Max where Value=(select max(m.Value) from #Max m)
drop table #Max
--16 Back up image.docx



