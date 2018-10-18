use BDHotel
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(1, 1, 1, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(2, 2, 2, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(3, 3, 3, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(4, 4, 4, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(5, 5, 5, 75, 54, 4050)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(6, 6, 6, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(7, 7, 7, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(8, 8, 8, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(9, 9, 9, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(10, 10, 10, 30, 54, 1620)

insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(1, 2, '20/06/2018', 'Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(2, 3, '20/07/2018', 'Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(4, 4, '01/09/2018', 'No Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(5, 5, '15/09/2018', 'Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(6, 3, '28/09/2018', 'No Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(3, 7, '26/08/2018', 'No Disponible')

select * from Disponibilidad
select * from Habitacion

insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(1, 2, '20/06/2018', '22/06/2018', 'Disponible', 2, 34500)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(2, 3, '20/07/2018', '22/06/2018', 'Disponible', 10, 1000)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(3, 4, '26/08/2018', '22/06/2018', 'Disponible', 1, 35000)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(4, 5, '01/09/2018', '22/06/2018', 'Disponible', 6, 1100)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(5, 6, '15/09/2018', '22/06/2018', 'Disponible', 3, 10000)

select * from Reservacion

insert into Venta(idVenta, idCliente) values(1, 100)
insert into Venta(idVenta, idCliente) values(2, 101)
insert into Venta(idVenta, idCliente) values(3, 102)
insert into Venta(idVenta, idCliente) values(4, 103)
insert into Venta(idVenta, idCliente) values(5, 104)
insert into Venta(idVenta, idCliente) values(6, 105)
insert into Venta(idVenta, idCliente) values(7, 106)

insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(1, 1, 3, '20/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(2, 2, 3, '21/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(3, 3, 4, '22/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(4, 4, 5, '23/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(5, 5, 1, '24/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(6, 6, 2, '25/09/2018')
select * from ServiciosVendidos

insert into VentaReservaciones(idVenReserv, idVenta, idReservacion, precio) values(1, 1, 2, 10000)
insert into VentaReservaciones(idVenReserv, idVenta, idReservacion, precio) values(2, 7, 5, 30000)

select * from VentaReservaciones

insert into PeriodoReservacion(idPeriReserv, idDisponibilidad, idReservacion) values(1, 1, 1)
insert into PeriodoReservacion(idPeriReserv, idDisponibilidad, idReservacion) values(2, 2, 5)
insert into PeriodoReservacion(idPeriReserv, idDisponibilidad, idReservacion) values(3, 6, 4)

update Reservacion
set fechaSalida = '13/10/2018', fechaEntrada = '17/10/2018'
where idReservacion = 2

update Reservacion
set fechaSalida = '15/10/2018', fechaEntrada = '20/10/2018'
where idReservacion = 5

/*
INSTRUCCIONES
- 3 sub consultas
  *1 sub consulta columna
  *1 sub consulta tabla
  *1 subconsulta with

- 5 Vistas
 *Deben ser reportes de la base
 *Todas deben usar join o funciones de agregacion o ambas

- Hacer una consulta dinamica

*/

/*Subconsulta columna:Muestra la edad que más se repite entre los empleados*/
select top 1 *
from(
	select Edad, (select count(EDAD)
			from Empleado as E
			where E.edad = Empleado.edad) as 'Cantidad'
	from Empleado) as NC
where NC.Cantidad > 1

/*Subconsulta Tablas: Muestra cuantos empleados tienen cierta edad mientras la edad sea mayor a 18*/
Select*from
	(select edad, count(edad) as 'cantidad'
	from empleado
	group by edad) as NC
where NC.cantidad < 18

/*Subconsulta with: Muestra todos los servicios que tengan una letra 'e' en su nombre y cuantas veces se vendieron*/
with Cantidades as (
	select s.nombre, COUNT(sv.idSerVen) as 'Cantidad'
	from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
	group by(s.nombre) )
select *
from Cantidades
where Cantidades.nombre like '%e%'

/********************************************************************************************************************/


/*Vista 1.Reservaciones del Mes*/
create view ReservacionesDelMes as(
	select r.idReservacion, c.nomComp as 'Nombre del Cliente', r.fechaEntrada as 'Fecha de entrada reservacion', 
	r.fechaSalida as 'Fecha Salida Reservacion'
	from Cliente as c inner join Venta as v on c.idCliente = v.idCliente
		inner join VentaReservaciones as vr on vr.idVenta = v.idVenta
		inner join Reservacion as r on r.idReservacion = vr.idReservacion
	Where MONTH(r.fechaEntrada) = MONTH(GETDATE())
)

select * from ReservacionesDelMes

/*Vista 2.Muestra los empleados del departamento de limpieza*/
create view EmpleadosDeLimpieza as(
select (e.Nombre + ' ' + e.ApPat+ ' ' +e.ApMat) as NombreCompleto,
	   d.nombre
 from Empleado as e
 left join Departamento as d on d.idDepartamento = e.idDepartamento
 where d.nombre = 'Limpieza'
)

select  * from EmpleadosDeLimpieza


/*Vista 3.Muestra las habitaciones disponibles*/
create view HabitacionesDisponibles as (
	select h.idHabitacion, d.estado
	from Habitacion as h
	left join Disponibilidad as d
	on h.idHabitacion = d.idHabitacion
	where d.estado='Disponible'
	)

select * from HabitacionesDisponibles

/*Vista 4. Muestra el numero de empleados por departamento*/
create view EmpleadoDepartamento as(
select COUNT(e.idempleado) as 'numero de empleados', d.nombre
FROM Empleado as e
inner join Departamento as d on d.idDepartamento = e.idDepartamento
group by d.nombre
)

select  * from EmpleadoDepartamento

/*Vista 5.Muestra las veces que se han pedidos los servicios ofrecidos*/
create view ServiciosPedidos as(
 select count(c.idCliente) as 'numero de clientes', s.nombre
  from venta as v
  inner join cliente as c on c.idCliente = v.idCliente
  inner join ServiciosVendidos as sv on sv.idVenta = v.idVenta
  inner join Servicio as s on s.idServicio = sv.idServicio
group by s.nombre
)

select  * from ServiciosPedidos