create database example;
create database erwinDB;

drop database example;
drop database erwinDB;

create database ciudad;
use ciudad;

create table persona
(
 
cedula int primary key,
nombres varchar(50),
apellidos varchar(50),
edad int,
direccion varchar(100)

);

insert into persona(cedula, nombres, apellidos, edad, direccion)
values (11068885, 'erwin' , 'sillo' , 20, 'av cochabamba');

select * from persona;


create table estudiante
(
cod_estudiante varchar(50) primary key,
nombres varchar(30),
apellidos varchar (50),
edad int,
celular int,
correo varchar(100)

);

insert into estudiante(cod_estudiante, nombres, apellidos, edad, celular, correo)
values (12324, 'sebastian' , 'gomez' , 27, 734234234,'sebas123@gmail.com');

select * from estudiante;

truncate table estudiante;