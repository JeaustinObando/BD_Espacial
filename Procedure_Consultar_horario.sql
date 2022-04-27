Create or alter procedure asignar_horario_tipo @tipo_comercio varchar(10),@horaAbierto time(7),@horaCerrar time(7)
as 
update TipoComercio set horaabierto = @horaAbierto, horacerrado = @horaCerrar where nombre=@tipo_comercio

exec asignar_horario_tipo 'Farmacia','10:00:00','19:00:00'

select * from TipoComercio