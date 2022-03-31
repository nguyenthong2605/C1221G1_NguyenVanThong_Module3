create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table Customer(
cID int primary key auto_increment,
cName varchar(20),
cAge int 
);

create table Product(
pID int primary key auto_increment,
pName varchar(20),
pPrice double
);

create table Orders(
oID int primary key auto_increment,
cID int, foreign key (cID) references Customer(cID),
oDate datetime,
oTotalPrice double
);

create table OderDetail(
oID int, foreign key (oID) references Orders(oID),
pID int, foreign key (pID) references Product(pID),
primary key (oID,pID),
odQTY int  
);
