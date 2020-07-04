
CREATE LOGIN LinAGN1_Login WITH PASSWORD = '<StrongPassword>';
CREATE USER LinAGN1_User FOR LOGIN LinAGN1_Login;
CREATE LOGIN LinAGN1_Login2 WITH PASSWORD = '<StrongPassword>';
CREATE USER LinAGN1_User2 FOR LOGIN LinAGN1_Login2;
CREATE LOGIN LinAGN1_Login3 WITH PASSWORD = '<StrongPassword>';
CREATE USER LinAGN1_User3 FOR LOGIN LinAGN1_Login3;

create role FirstRole; 
GRANT  all privileges  TO  FirstRole;
exec sp_addrolemember 'FirstRole', 'LinAGN1_User'; 

create role SecondRoles authorization db_datareader; 
exec sp_addrolemember 'SecondRoles', 'LinAGN1_User3'; 

create login Dima with password =N'123'
CREATE USER User3 for login Dima
grant create table, create view
to User3;

create login Vitalik with password =N'123'
CREATE USER Devloper for login Vitalik
grant backup database
to Devloper 

CREATE USER LinAGN1_User5 FOR LOGIN LinAGN1_Login5;
CREATE LOGIN LinAGN1_Login5 WITH PASSWORD = '<StrongPassword>';
