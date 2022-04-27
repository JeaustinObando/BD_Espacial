use BD_Espacial

exec insertar_calles 'LINESTRING(3.5 6.5,3.5 4.5,3.5 2.5)'
exec insertar_calles 'LINESTRING(3.5 2.5,6.5 2.5)'
exec insertar_calles 'LINESTRING(6.5 2.5,6.5 4.5,6.5 6.5)'

select * from Calle

insert Casa(nombre,ubicacion,idCalle,visible)values('#A-1','POLYGON((4 4, 5 4, 5 3, 4 3,4 4))',1,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#A-2','POLYGON((5 4, 6 4, 6 3, 5 3,5 4))',3,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#A-4','POLYGON((4 6, 5 6, 5 5, 4 5,4 6))',1,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#A-6','POLYGON((4 7, 5 7, 5 6, 4 6,4 7))',1,1)

insert Casa(nombre,ubicacion,idCalle,visible)values('#D-1','POLYGON((7 7, 8 7, 8 6, 7 6,7 7))',3,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#D-2','POLYGON((7 6, 8 6, 8 5, 7 5,7 6))',3,1)

insert Casa(nombre,ubicacion,idCalle,visible)values('#E-3','POLYGON((7 8, 8 8, 8 7, 7 7,7 8))',3,1)
select * from Casa


exec insertar_comercios '#A-3',4,'POLYGON((4 5, 6 5, 6 4, 4 4,4 5))',1
exec insertar_comercios '#A-5',1,'POLYGON((5 7, 6 7, 6 5, 5 5,5 7))',3
exec insertar_comercios '#E-2',5,'POLYGON((5 8, 7 8, 7 7, 5 7,5 8))',3
exec insertar_comercios '#D-3',3,'POLYGON((7 5, 8 5, 8 3, 7 3,7 5))',3

select * from Comercio

exec insertar_tipoComercio 'Farmacia','10:00:00','19:00:00'
exec insertar_tipoComercio 'SuperMercado','08:00:00','20:00:00'
exec insertar_tipoComercio 'Restaurante','11:00:00','22:00:00'
exec insertar_tipoComercio 'Panaderia','06:00:00','18:00:00'
exec insertar_tipoComercio 'Ferreteria','09:00:00','17:00:00'
select * from TipoComercio


DECLARE @Temp AS TABLE 
(nombre varchar(50), ubicacion geometry, visible bit)
 
 INSERT INTO @Temp
         ( [nombre], [ubicacion], [visible] )
 SELECT
	A.idCalle,
	A.[distancia],
	A.visible
FROM dbo.Calle AS A
 INSERT INTO @Temp
         ( [nombre], [ubicacion], [visible] )
 SELECT
	C.nombre,
	C.ubicacion,
	C.visible
FROM dbo.Comercio AS C
 INSERT INTO @Temp
         ( [nombre], [ubicacion], [visible] )
 SELECT
	Ca.nombre,
	Ca.ubicacion,
	Ca.visible
FROM dbo.Casa AS Ca

select * from @Temp

DECLARE @vecinos AS TABLE 
(nombre varchar(50), ubicacion geometry, distancia float)
DECLARE @d GEOMETRY 
SELECT @d = ubicacion from casa where nombre = '#A-4'
INSERT INTO @vecinos
         ( [nombre], [ubicacion], [distancia] )
	SELECT nombre, ubicacion, ubicacion.STDistance(@d) FROM dbo.Casa
	where ubicacion is not null
	and ubicacion.STDistance(@d) <= 0
	ORDER BY ubicacion.STDistance(@d)
INSERT INTO @vecinos
         ( [nombre], [ubicacion], [distancia] )
SELECT nombre, ubicacion, ubicacion.STDistance(@d) FROM dbo.Comercio
where ubicacion is not null
and ubicacion.STDistance(@d) <= 0
ORDER BY ubicacion.STDistance(@d)

select * from @vecinos
/*
DECLARE @d GEOMETRY 
SELECT @d = ubicacion from casa where nombre = '#A-2'
SELECT nombre, ubicacion, ubicacion.STDistance(@d) FROM dbo.Casa
where ubicacion is not null
and ubicacion.STDistance(@d) <= 1
ORDER BY ubicacion.STDistance(@d)
SELECT nombre, ubicacion, ubicacion.STDistance(@d) FROM dbo.Comercio
where ubicacion is not null
and ubicacion.STDistance(@d) <= 1
ORDER BY ubicacion.STDistance(@d)
*/

