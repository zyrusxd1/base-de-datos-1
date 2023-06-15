create database hito_2_2023;
use hito_2_2023;

create table estudiantes(
id_est int identity primary key not null,
nombre varchar(30) not null,
apellidos varchar(50) not null,
edad int not null,
fono int not null,
email varchar(100) not null,
direccion varchar(150) not null,
genero varchar(12) not null,



);

INSERT INTO estudiantes (nombre, apellidos, edad, fono, email, direccion, genero) values
('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino'),
('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino'),
('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino');

select est.*
from estudiantes AS est;

--crear la consuta que permita
--determinar la minima edad de los estudiantes

select min (est.edad)
from estudiantes as est;

select count(est.id_est)
from estudiantes as est
where est.edad > 29;

select count (est.id_est) as numero_de_est
from estudiantes as est;

select avg(est.edad) as promedio_edad
from estudiantes as est;

select max (est.edad)
from estudiantes as est
where est.genero = 'masculino';

select max (est.edad)
from estudiantes as est
where est.genero = 'femenino';

select count (est.id_est)
from estudiantes as est
where est.apellidos LIKE '%el%'
and est.genero = 'masculino';

drop table estudiantes;

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


select count(est.id_esc)
from escuela as esc
inner join estudiantes as est on esc.id_esc = est.id_esc
where est.edad > 20 and est.edad < 30 and
esc.nombre = 'San Felipe Asturias II';

select count(kar.estado)
from kardex as kar
where estado = 'APROBADO';

select count(kar.id_kar)
from kardex as kar
INNER JOIN estudiantes as est on est.id_est_cedula = est.id_est
inner join materias as mat on kar.id_mat = mat.id_mat
where kar.nota_num >= 51 and mat.cod_mat = 'ARQ-104';