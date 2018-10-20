/*Tarea 7*/
use BDHOTEL
/*Un procedimiento tipo script: Agregar un empleado*/
create procedure AgregarEmpleado(
	@idEmpleado int,
	@nombre nvarchar(50),
	@apPat nvarchar(50),
	@apMat nvarchar(50)
)
as 
begin
	insert into Empleado(idEmpleado, nombre, apPat, apMat)
	values (@idEmpleado,@nombre, @apPat, @apMat)
end

exec AgregarEmpleado @idEmpleado = 15, @nombre = 'Pedro', @apPat = 'Kumamoto', @apMat = 'Hernandez'
drop procedure AgregarEmpleado
/*5 procedimientos almacenados*/
/*1. - Muestra los empleados que hay en un departamento en especifico*/
create procedure EmpleadosXDepartamento(
	@idDepartamento int)
as 
begin
	select (e.Nombre + ' ' + e.ApPat+ ' ' +e.ApMat) as NombreCompleto,
		 d.nombre
	 from Empleado as e
	left join Departamento as d on d.idDepartamento = e.idDepartamento
	 where d.idDepartamento = @idDepartamento
end

exec EmpleadosXDepartamento @idDepartamento = 15

drop procedure EmpleadosXDepartamento


/*2. - Muestra el numero de empleados que hay en un departamento en especifico*/
create procedure EmpleadosPorDepartamento(
	@idDepartamento int
)
as 
begin
	select COUNT(e.idempleado) as 'numero de empleados', d.nombre
	FROM Empleado as e
	inner join Departamento as d on d.idDepartamento = e.idDepartamento
	where d.idDepartamento = @idDepartamento
	group by d.nombre
end

exec EmpleadosPorDepartamento @idDepartamento = 15

drop procedure EmpleadosPorDepartamento

/*3. - Cambia el nombre de un empleado y muestra el cambio*/

create procedure UpdateNombreEmpleado(
	 @nombre nvarchar (50),
	 @idEmpleado int
)
as 
begin

select idEmpleado, nombre
into #empleado
from Empleado

update Empleado set nombre = @nombre
where idEmpleado = @idEmpleado

select idEmpleado, nombre as ViejoNombre 
from #empleado
where idEmpleado = @idEmpleado

select idEmpleado, nombre as NuevoNombre 
from Empleado
where idEmpleado = @idEmpleado
end

exec UpdateNombreEmpleado @idEmpleado = 4, @nombre = 'Karim'

drop procedure UpdateNombreEmpleado

/*4. - Muestra cuantas veces se ha pedido un servicio en especifico*/

create procedure ServicioPedido(
	@idServicio int
)
as 
begin
  select count(c.idCliente) as 'numero de clientes', s.nombre
	from venta as v
	inner join cliente as c on c.idCliente = v.idCliente
	inner join ServiciosVendidos as sv on sv.idVenta = v.idVenta
	inner join Servicio as s on s.idServicio = sv.idServicio
	where s.idServicio = @idServicio
	group by s.nombre
end

exec ServicioPedido @idservicio = 5

drop procedure ServicioPedido

/*5.-Muestra el estado de las habitaciones de un piso en especifico*/
create procedure EstadoHabitacionesPorPiso(
	@piso int

)
as
begin
	select h.piso,h.idHabitacion, d.estado
	from Habitacion as h
	left join Disponibilidad as d
	on h.idHabitacion = d.idHabitacion
	where h.piso = @piso
end

exec EstadoHabitacionesPorPiso @piso = 1

drop procedure EstadoHabitacionesPorPiso

/*1 Funcion*/
 
/*Muestra los sueldos que hay que pagar en total*/
create function MontoSueldo(
) returns decimal
as begin
	
	declare @sueldo decimal = (select sum(n.sueldoTotal) as Sueldo
								from Nomina as n)

	return @sueldo
end

select dbo.MontoSueldo() as 'sueldos totales a pagar'

drop function SueldoEmpleado