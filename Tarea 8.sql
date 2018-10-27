use BDHotel
create trigger CLIENTES_Cambios
on Cliente 
instead of update
as
begin
		select * from INSERTED
		select * from deleted
END

select * from Cliente
update Cliente
set nombre = 'Antonio'
where idCliente = 105

/**************************************************/

create trigger HABITACION_Agregada
on Habitacion
after INSERT
as
begin
		select * from INSERTED
END

select * from Habitacion
insert into Habitacion(idHabitacion,clase,piso,costoDiario)
values (16,'Suprema',8,10500)


/*************************************************/

create trigger Empleado_Eliminado
on Empleado
instead of DELETE
as
begin
		select * from deleted
END

select * from Empleado
delete from Empleado where idEmpleado = 15

