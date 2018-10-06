/************PRACTICA 5**************************/

/*5 SELECT BASICOS CON CAMBIO EN NOMBRE DE COLUMNA, ALIAS Y USO DE FUNCIONES (CONCATENACION, V.*, SUBSTRING)*/

/******Muestra el nombre completo de los clientes************/
select (c.nombre+ ' ' +c.apPat+' ' +c.apMat) as Nombre_Completo_del_Cliente
from Cliente as c


/****Muestra la edad de cada empleado******/
select e.idEmpleado,e.nomComp, e.edad
from Empleado as e

/****Muestra el costo de cada servicio*****/
select s.nombre, s.precio
from Servicio as s

/****Muestra el piso en el que esta cada habitacion******/
select h.idHabitacion, h.piso 
from Habitacion as h

/***Muestra los primeros 3 caracteres de los apellidos  de los clientes*****/
select SUBSTRING(c.apPat,0,4) + ' '+ SUBSTRING(c.apMat,0,4) as Acotacion_ApMat
from Cliente as c


/*3 SELECT JOIN (CROSS, INNER, LEFT, RIGHT)*/
/***Muestra el departamento de cada empleado***/
select	e.idEmpleado,e.nomComp,
		d.nombre
from Empleado as e inner join  Departamento as d on e.idDepartamento = d.idDepartamento

/****Muestra los empleados de cada departamento***/
select	d.nombre,
		e.nomComp
from Departamento as d left join Empleado as e on d.idDepartamento = e.idDepartamento


/***Muestra cuantos empleados hay en cada departamento***/
select count(d.idDepartamento), d.nombre
from Departamento as d inner join Empleado as e on d.idDepartamento = e.idDepartamento
group by(d.nombre)


/*5 SELECT CON USO DE WHERE EN DIFERENTES TABLAS Y CAMPOS*/
/*Muestra los empleados de Limpieza*/
select e.nomComp,
	   d.nombre
 from Empleado as e inner join Departamento as d on d.idDepartamento = e.idDepartamento
 where d.nombre = 'Limpieza'

 /*Muestra los empleados mayores a 20 años*/
 select e.nomComp, e.edad
 from Empleado as e
 where e.edad>20

 /*Muestra los empleados menores de 36 años*/
 select e.nomComp, e.edad
 from Empleado as e
 where e.edad<36

 /*Muestra las habitaciones con costo diario menor a 2000 */
 select h.idHabitacion, h.clase, h.costoDiario
 from Habitacion as h
 where h.costoDiario<2000

 /*Muestra los servicios con costo mayor a 430*/
select s.idServicio, s.nombre, s.precio
from Servicio as s
where s.precio>430

/*
 2 SELECT CON USO DE FUNCIONES DE AGREGACION (MIN, MAX, AVG, STD, COUNT)
	-2 SIN GROUP BY
	-2 CON GROUP BY -> 1 CON HAVING
*/
 
 /* Muestra cuanto cuesta el servicio mas barato */
select min(precio) as 'Servicio mas caro'
from Servicio

 /*Muestra la edad más alta entre todos los empleados*/
 select max(edad) as 'Edad mas alta'
 from Empleado

 /*Muestra cuantos empleados tiene cada departamento */
select COUNT(e.idempleado) as 'numero de empleados', d.nombre
FROM Empleado as e
inner join Departamento as d on d.idDepartamento = e.idDepartamento
group by d.nombre


/* Muestra los pisos con 1 o mas habitaciones **/
select COUNT(idHabitacion) as 'numero de habitaciones', piso
FROM Habitacion
group by piso
having count(idHabitacion) >= 1
order by count(idHabitacion) asc

/*2 SELECT CON JOIN Y GROUP BY*/

/*Muestra cuantos empleados tiene cada departamento */
select COUNT(e.idempleado) as 'numero de empleados', d.nombre
FROM Empleado as e
inner join Departamento as d on d.idDepartamento = e.idDepartamento
group by d.nombre

/*Muestra cuantos departamentos tiene cada empleado*/
select COUNT(d.idDepartamento) as 'Numero de departamentos', e.nombre
from Departamento as d inner join Empleado as e on d.idDepartamento = e.idDepartamento
group by e.nombre

/* 1 SELECT INTO CON DROP TABLE Y REINSERTAR LAS FILAS */
select *
into #empleado
from Empleado

drop table Empleado

create table Empleado(
	idEmpleado int NOT NULL,
	nombre varchar(50) NULL,
	apPat varchar(50) NULL,
	apMat varchar(50) NULL,
	nomComp  AS (nombre+' '+apPat+' '+apMat),
	edad int NULL,
	idDepartamento int NULL)

insert into  Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento)
select idEmpleado, nombre, apPat, apMat, edad, idDepartamento
from #empleado


