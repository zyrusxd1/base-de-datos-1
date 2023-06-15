CREATE DATABASE hito_4_2023;

USE hito_4_2023;


CREATE TABLE escuela

(

  id_esc INTEGER IDENTITY PRIMARY KEY NOT NULL,

  nombre VARCHAR(100),

  direccion VARCHAR(100)

);

GO


CREATE TABLE materias

(

  id_mat INTEGER IDENTITY PRIMARY KEY NOT NULL,

  nombre_mat VARCHAR(100),

  cod_mat VARCHAR(100)

);

GO


CREATE TABLE periodo

(

  id_per INTEGER IDENTITY PRIMARY KEY NOT NULL,

  ano_gestion INTEGER,

  semestre VARCHAR(50)

);

GO


CREATE TABLE estudiantes

(

  id_est_cedula INTEGER PRIMARY KEY NOT NULL,

  nombres VARCHAR(100),

  apellidos VARCHAR(100),

  sexo VARCHAR(10),

  direccion VARCHAR(200),

  telefono INTEGER,

  email VARCHAR(50),

  edad INTEGER,

  id_esc INTEGER,

  FOREIGN KEY (id_esc) REFERENCES escuela(id_esc)

);

GO


CREATE TABLE kardex

(

  id_kar INTEGER IDENTITY PRIMARY KEY NOT NULL,

  nota_num INTEGER,

  nota_alfabe VARCHAR(100),

  estado VARCHAR(10),

  id_mat INT,

  id_est_cedula INT,

  id_per INTEGER,

  FOREIGN KEY (id_mat) REFERENCES materias(id_mat),

  FOREIGN KEY (id_est_cedula) REFERENCES estudiantes(id_est_cedula),

  FOREIGN KEY (id_per) REFERENCES periodo(id_per)

);

GO


INSERT INTO escuela (nombre, direccion) VALUES ('San Felipe Asturias II', 'Zona Illampu Av. Prol. San Lorenzo');

GO


INSERT INTO estudiantes (id_est_cedula, nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES

  (6775644, 'Ximena', 'Arias Ballesteros', 'femenino', 'Av. 6 de Agosto', 79617575, 'xime@gmail.com', 25, 1),

  (6775655, 'Saul', 'Montes Valenzuela', 'masculino', 'Av. 6 de Agosto', 79617576, 'saul@gmail.com', 24, 1),

  (6775666, 'Carla', 'Mavir Uria', 'femenino', 'Av. 6 de Agosto', 79617577, 'carla@gmail.com', 28, 1),

  (6775677, 'Joel', 'Castillo Fuentes', 'masculino', 'Av. 6 de Agosto', 79617578, 'joel@gmail.com', 21, 1),

  (6775688, 'Augusto', 'Copar Copar', 'femenino', 'Av. 6 de Agosto', 79617579, 'augusto@gmail.com', 20, 1);

GO


INSERT INTO materias (nombre_mat, cod_mat) VALUES

    ('Introduccion a la Arquitectura','ARQ-101'),

    ('Urbanismo y Diseno','ARQ-102'),

    ('Dibujo y Pintura Arquitectonico','ARQ-103');

GO


INSERT INTO materias (nombre_mat, cod_mat) VALUES

    ('Matematica discreta','ARQ-104'),

    ('Fisica Basica','ARQ-105');

GO


INSERT INTO periodo (ano_gestion, semestre) VALUES

    (2016, 'Semestre 1'),

    (2016, 'Semestre 2'),

    (2017, 'Semestre 1'),

    (2017, 'Semestre 2'),

    (2018, 'Semestre 1');

GO


INSERT INTO kardex (nota_num, nota_alfabe, estado, id_mat, id_est_cedula, id_per) VALUES

    (51, 'cincuenta y uno', 'APROBADO', 1, 6775644, 1),

    (31, 'treinta y uno', 'REPROBADO', 2, 6775655, 2),

    (61, 'sesenta y uno', 'APROBADO', 1, 6775666, 1),

    (41, 'cuarenta y uno', 'REPROBADO', 2, 6775677, 2),

    (81, 'ochenta y uno', 'APROBADO', 4, 6775677, 4);

GO

select COUNT(Kar.id_kar) as count
from kardex as Kar
inner join materias as mat on Kar.id_mat = mat.id_mat
where mat.cod_mat = 'ARQ-104';

select COUNT(esc.id_esc) as escuela
from escuela as esc
inner join estudiantes as est on esc.id_esc = est.id_esc
where esc.nombre = 'Amor Fe y Alegria';



--determinar el promedio de notas
--de los estudiantes que reprobaron en el periodo 
--2016
select AVG(kar.nota_num)
from kardex as kar
inner join periodo as per on kar.id_per = per.id_per
where per.ano_gestion = 2016 and kar.estado = 'REPROBADO';

--determinar el promedio de notas
--de los estudiantes que reprobaron en el periodo 
--2017 de los estudiante que son de la escuela 
--San Felipe Asturias II


select AVG(kar.nota_num)
from kardex as kar
inner join periodo as per on kar.id_per = per.id_per
inner join estudiantes as est on kar.id_est_cedula = est.id_est_cedula
inner join escuela as esc on esc.id_esc = est.id_esc
where per.ano_gestion = 2017 and kar.estado = 'REPROBADO' and esc.nombre ='San Felipe Asturias II';


create function retorna_un_numero()
returns int
begin
--Suma
--Calculo
--for while

--dbo es el nombre de la carpeta
return 10;
end;

select dbo.retorna_un_numero();


--Crear una funcion que retorne cualquiera fecha
returns varchar
begin

return '22 de septiembre'
end;



create function Retorna_una_fecha()
returns date
begin

return '2002-09-22';
end;
 select dbo.Retorna_una_fecha();

select GETDATE();

drop function Retorna_una_fecha;


create function suma_de_dos_numeros()
returns int
begin

return 33+22;

end; 

select dbo.suma_de_dos_numeros();

drop function suma_de_dos_numeros;

--crear una funcion que retorne mi nombre
--parametros (nombre varchar(30))
--se debe colocar el simbolo @ cuando recibo parametros






create function mi_nombre(@nombre varchar(30), @edad int)
returns varchar(30)
begin
return @nombre;


end;


select dbo.mi_nombre('Erwin Elmer');
drop function mi_nombre;










create function suma_tres_numeros(@numero1 int, @numero2 int, @numero3 int)
returns int
begin
return @numero1 + @numero2 + @numero3;
end;

select dbo.suma_tres_numeros(3,5,3);

drop function suma_tres_numeros;
--
--






create function suma_tres_numeros(@numero1 int, @numero2 int, @numero3 int)
returns int
begin
declare @resultado int;

set @resultado=@numero1 + @numero2 + @numero3;

return @resultado
end;

select dbo.suma_tres_numeros(3,5,3) as suma;




--crear una funcion que retorne su es ADMIN o GUEST
--si la cadena que recibi la funcion es ADMIN
--retornar ADMIN
--si es distinto de adnin(cualquier cadena)
--retorna GUEST

create function tipo_de_usuario(@usuario varchar(20))
returns varchar(20)
begin 
   declare @respuesta varchar(20)
if (@usuario ='ADMIN')
SET @respuesta = 'ADMIN';
else
set @respuesta ='GUEST';

return @respuesta;
end;

select dbo.tipo_de_usuario('ADMIN') as usuario;
select dbo.tipo_de_usuario('Erwin') as usuario;



--crear una funcion que sume o reste o multiplique o divida 2 numeros.
--la funcion resive 3 parametros 
--el 1ro es una cadena 
--y el segundo y el tercero son numeros
--si el primer parametro es suma,sumar los numeros


create function operaciones_aritmeticas(@par varchar(20), @n1 int, @n2 int)
returns int
begin 
declare @respuesta int
if()
set @respuesta
if()
if()
if()