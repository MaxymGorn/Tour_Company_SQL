create table Dolcnost(
Id int not null identity,
Name nvarchar(max) not null,
Constraint Pk_D primary key(Id)
);
go




create table Worker
(
Id int not null identity,
Name nvarchar(max) not null,
Surname nvarchar(max) not null,
Phone nvarchar(max) not null,
Email nvarchar(max) not null,
Startwork date not null,
DolcnostId int not null,
Constraint Pk_ss primary key(Id),
Constraint Fk_ss foreign key(DolcnostId) references Dolcnost(Id)
);
go

create table Transport(
Id int not null identity,
Name nvarchar(max) not null,
Constraint Pk_Tr primary key(Id),
);
go

create table City(
Id int not null identity,
Name nvarchar(max) not null,
Constraint Pk_ci primary key(Id)
);
go

create table Country(
Id int not null identity,
Name nvarchar(max) not null,
Constraint Pk_co primary key(Id),
);
go

create table HistoryVisitCountry(
Id int not null identity,
DateVisit date not null,
CountryId int not null,
CityId int not null,
Constraint Pk_Hv primary key(Id),
Constraint Fk_Hv1 foreign key(CountryId) references Country(Id) ,
Constraint Fk_Hv2 foreign key(CityId) references City(Id) 

);
go

create table Attractions(
Id int not null identity,
Name nvarchar(max) not null,
Constraint Pk_At primary key(Id),
);

create table Tourist(
Id int not null identity,
Name nvarchar(max) not null,
Surname nvarchar(max) not null,
Constraint Pk_t primary key(Id)
);
go

create table PayTour(
Id int not null identity,
TouristId int not null,
Constraint Pk_Pt primary key(Id),
Constraint Fk_Pt foreign key(TouristId) references Tourist(Id) ,
);

create table InterestingTour(
Id int not null identity,
TouristId int not null,
Constraint Pk_It primary key(Id),
Constraint Fk_It foreign key(TouristId) references Tourist(Id) ,
);


create table Tour
(
Id int not null identity,
Name nvarchar(max) not null,
Cost money not null,
DateStart date not null,
DateEnd date not null,
TransportId int not null,
HistoryVisitCountryId int not null,
AttractionsId int not null,
UrlImageAttractions nvarchar(max) not null,
Description nvarchar(max) not null,
UrlImagehotel nvarchar(max) not null,
MaxClients int not null check(MaxClients>=0),
SotrId int not null,
PayTourId int not null,
InterestingTourId int not null,
Constraint Pk_so primary key(Id),
Constraint Ck_so check(Cost>=0),
Constraint Fk_so1 foreign key(TransportId) references Transport(Id) ,
Constraint Fk_so2 foreign key(HistoryVisitCountryId) references HistoryVisitCountry(Id) ,
Constraint Fk_so3 foreign key(AttractionsId) references Attractions(Id), 
Constraint Fk_soo4 foreign key(SotrId) references Sotrudnik(Id),
Constraint Fk_so5 foreign key(PayTourId) references PayTour(Id), 
Constraint Fk_soo6 foreign key(InterestingTourId) references InterestingTour(Id) 

);
go

create table Sotrudnik (
Id int not null identity,
WorkerId int not null,
Constraint Pk_soo1 primary key(Id),
Constraint Fk_soo2 foreign key(WorkerId) references Worker(Id) ,
);

create table HistoryTour(
Id int not null identity,
TourId int not null,
Constraint Pk_Ht primary key(Id),
Constraint Fk_Ht foreign key(TourId) references Tour(Id) ,
);


create table Clients(
Id int not null identity,
Name nvarchar(max) not null,
Surname nvarchar(max) not null,
Phone nvarchar(max) not null,
Email nvarchar(max) not null,
DateOfBirthday date not null,
NextTourId int not null,
HistoryTourId int not null,
Constraint Pk_cl primary key(Id),
Constraint Fk_cl1 foreign key(NextTourId) references Tour(Id),
Constraint Fk_cl2 foreign key(HistoryTourId) references HistoryTour(Id),
);


CREATE NONCLUSTERED  INDEX Ind1
ON Tour (Id)
WITH (fillfactor=80);

