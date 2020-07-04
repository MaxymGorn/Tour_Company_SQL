
CREATE TRIGGER tr1
ON Clients
FOR INSERT, update
AS
IF 2 = (SELECT COUNT(P.Stud_ID)
        FROM Clients cl, INSERTED I
        WHERE cl.Name=I.Name and cl.Surname=I.Surname)
        BEGIN
            ROLLBACK TRAN
            raiserror ('Клиент уже есть', 16, 10)
        END
		go

create trigger TrigTour
on Tour
for delete
as
begin
set nocount on;
insert into dbo.HistoryTour (TourId)
select[Id]
from deleted;
end;
go
