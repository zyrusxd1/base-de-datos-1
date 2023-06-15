create database Unifranz_campeonato_de_futbol;
use Unifranz_campeonato_de_futbol;

go



create table campeonato(
id_campeonato varchar(12) primary key not null,
nombre_campeonato varchar(30) not null,
sede varchar(20) not null
);



create table equipo(
id_equipo varchar(12) primary key not null,
nombre_equipo varchar(30) not null,
categoria varchar(30) not null,
id_campeonato varchar(12),
foreign key (id_campeonato) references campeonato(id_campeonato)

);



create table jugador(
id_jugador varchar(12) primary key not null,
nombres varchar(30) not null,
apellidos varchar(50) not null,
ci varchar(15) not null,
edad int not null,
id_equipo varchar(12),
foreign  key (id_equipo) references equipo(id_equipo)

);


insert into campeonato(id_campeonato, nombre_campeonato, sede)values
('Camp-111','Campeonato Unifranz','El Alto'),
('Camp-222','Campeonato_Unifranz','Cochabamba');



insert into equipo(id_equipo, nombre_equipo, categoria, id_campeonato)values
('Equ-111','Google','Varones','Camp-111'),
('Equ-222','404 Not Found','Varones','Camp-111'),
('Equ-333','Girls Unifranz','Mujeres','Camp-111');



insert into jugador(id_jugador, nombres, apellidos, ci, edad, id_equipo)values
('Jug-111','Carlos','Villa','8997811LP',19,'Equ-222'),
('Jug-222','Pedro','Salas','8997822LP',20,'Equ-222'),
('Jug-333','Saul','Araj','8997833LP',21,'Equ-222'),
('Jug-444','Sandra','Solis','8997844LP',20,'Equ-333'),
('Jug-555','Ana','Mica','8997855LP',23,'Equ-333');

select*from campeonato;
select*from equipo;
select*from jugador;

--=========================================================--
--Mostrar que jugadores que formen parte del equipo equ-333--
--=========================================================--
select CONCAT(jug.nombres,' ', jug.apellidos) as jugadores
from jugador as jug
inner join equipo as equ on jug.id_equipo= equ.id_equipo
where jug.id_equipo='Equ-333';






--===============================================================================================--
--Crear una funci�n que permita saber cu�ntos jugadores est�n inscritos.                         --
--La funci�n debe llamarse Crear una funci�n que permita saber cu�ntos jugadores est�n inscritos.--
--La funci�n debe llamarse F1_CantidadJugadores()                                                --
--===============================================================================================--


create function  F1_CantidadJugadores()
returns integer
as
begin
declare @respuesta int
select @respuesta = COUNT(jug.id_jugador) from jugador as jug
return @respuesta
end;

select dbo.F1_CantidadJugadores() as [Cantidad Jugadores];


select*from jugador;








--============================================================================================================
--Crear una funci�n que permita saber cu�ntos jugadores est�n inscritos y que sean de la categor�a varones o--
--mujeres.                                                                                                  --
--La funci�n debe llamarse F2_CantidadJugadoresParam()                                                      --
--La funci�n debe recibir un par�metro �Varones� o �Mujeres�                                                --    
--==========================================================================================================--
create function F2_CantidadJugadoresParam(@categoria varchar(30))
returns int 
as 
begin
declare @respuesta int

select @respuesta = COUNT(jug.id_jugador) from jugador as jug
inner join equipo AS eq on eq.id_equipo = jug.id_equipo
where eq.categoria = @categoria

return @respuesta
end

select dbo.F2_CantidadJugadoresParam('Mujeres') [mujeres];
select dbo.F2_CantidadJugadoresParam('Varones') [varones];
select*from equipo;
select*from jugador;


--Crear una funci�n que obtenga el promedio de las edades mayores a una cierta edad.
--La funci�n debe llamarse F3_PromedioEdades()
--La funci�n debe recibir como par�metro 2 valores.
--La categor�a. (Varones o Mujeres)
--La edad con la que se comparara (21 a�os ejemplo)
--Es decir mostrar el promedio de edades que sean de una categor�a y que sean mayores a 21 a�os.


alter function F3_PromedioEdades(@edad varchar(10), @categoria varchar(30))
returns int
as
begin
declare @respuesta int
select @respuesta= AVG(jug.edad) from jugador as jug
inner join equipo as eq on eq.id_equipo = jug.id_equipo
where jug.edad > @edad and eq.categoria = @categoria
return @respuesta;
end;

select dbo.F3_PromedioEdades(21,'Varones');
select dbo.F3_PromedioEdades(21,'Mujeres');

select*from jugador;

--Crear una funci�n que permita concatenar 3 par�metros.
--La funci�n debe llamarse F4_ConcatItems()
--La funci�n debe de recibir 3 par�metros.
--La funci�n debe de concatenar los 3 valores.
--Para verificar la correcta creaci�n de la funci�n debe mostrar lo siguiente.
--Mostrar los nombres de los jugadores, el nombre del equipo y la sede concatenada, utilizando la funci�n
--que acaba de crear.



create function F4_ConcatItems(@jugador varchar(30),@equipo varchar(30), @sede varchar(30))
returns varchar(100)
as 
begin
declare @respuesta varchar(200)
select @respuesta = concat(jug.nombres,' ' , eq.nombre_equipo,' ',cam.sede)
from jugador as jug
inner join equipo as eq on jug.id_equipo = eq.id_equipo
inner join campeonato as cam on eq.id_campeonato = cam.id_campeonato
where jug.nombres = @jugador and eq.nombre_equipo = @equipo and cam.sede = @sede;
return @respuesta
end;


select dbo.F4_ConcatItems('Carlos','404 Not Found','El Alto');

select*from jugador;
select*from equipo;
select*from campeonato;



--Generar la serie fibonacci.
   --El objetivo es generar una funci�n que retorne una cadena con la serie de la fibonacci.
   --La funci�n solo recibe el valor N.
   --Comportamiento esperado


alter FUNCTION fibo(@N int)
RETURNS varchar(30)
AS
BEGIN
    DECLARE @resp varchar(30) = ''
    DECLARE @A int = 0;
    DECLARE @B int = 1;
    DECLARE @C int = 0;
    DECLARE @aux int = 0;

    WHILE @aux <= @N
    BEGIN
        SET @resp = CONCAT(@resp, @C, ',')


        SET @A = @B
        SET @B = @C
	    SET @C = @A + @B
        SET @aux = @aux + 1
    END

    RETURN @resp
END;

select dbo.fibo(5) as fibonacci;