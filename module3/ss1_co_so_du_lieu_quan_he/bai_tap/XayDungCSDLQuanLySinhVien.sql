DROP DATABASE IF EXISTS student_manegement;
CREATE DATABASE student_manegement;

CREATE TABLE Student (
    id INT PRIMARY KEY,
    `name` VARCHAR(100),
    age INT,
    country VARCHAR(100)
);

insert into Student
values
(1,'Nguyen Van A',18,'Viet Nam'),
(2,'Nguyen Van B',18,'Viet Nam'),
(3,'Nguyen Van C',18,'Viet Nam');

USE student_management;

create table Class(
id int primary key,
`name` varchar(45)
);

insert into Class
values
(1,'Nguyen Van A'),
(2,'Nguyen Van B'),
(3,'Nguyen Van C');

create table Teacher(
id int,
`name` varchar(45),
age int,
country varchar(20)
);

insert into Teacher
values
(1,'Nguyen Van N',25,'Viet Nam'),
(2,'Nguyen Van M',35,'Viet Nam'),
(3,'Nguyen Van K',27,'Viet Nam');
