exec insertar_calles 'LINESTRING(3.5 6.5,3.5 4.5,3.5 2.5)'
exec insertar_calles 'LINESTRING(3.5 2.5,6.5 2.5)'
exec insertar_calles 'LINESTRING(6.5 2.5,6.5 4.5,6.5 6.5)'

select * from Casa

delete from Casa where idCasa= 1

insert Casa(nombre,ubicacion,idCalle,visible)values('#A-1','POLYGON((4 4, 5 4, 5 3, 4 3,4 4))',10,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#A-2','POLYGON((5 4, 6 4, 6 3, 5 3,5 4))',12,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#A-4','POLYGON((4 6, 5 6, 5 5, 4 5,4 6))',10,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#A-6','POLYGON((4 7, 5 7, 5 6, 4 6,4 7))',10,1)

insert Casa(nombre,ubicacion,idCalle,visible)values('#B-1','POLYGON((2 7, 3 7, 3 6, 2 6,2 7))',10,1)

insert Casa(nombre,ubicacion,idCalle,visible)values('#C-1','POLYGON((2 2, 3 2, 3 1, 2 1, 2 2))',11,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#C-3','POLYGON((4 2, 5 2, 5 1, 4 1, 4 2))',11,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#C-5','POLYGON((7 2, 8 2, 8 1, 7 1, 7 2))',11,1)


insert Casa(nombre,ubicacion,idCalle,visible)values('#D-1','POLYGON((7 7, 8 7, 8 6, 7 6,7 7))',12,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#D-2','POLYGON((7 6, 8 6, 8 5, 7 5,7 6))',12,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#D-4','POLYGON((7 3, 8 3, 8 2, 7 2,7 3))',12,1)

insert Casa(nombre,ubicacion,idCalle,visible)values('#E-1','POLYGON((4 8, 5 8, 5 7, 4 7,4 8))',10,1)
insert Casa(nombre,ubicacion,idCalle,visible)values('#E-3','POLYGON((7 8, 8 8, 8 7, 7 7,7 8))',12,1)


select * from Casa

exec insertar_comercios '#A-3',4,'POLYGON((4 5, 6 5, 6 4, 4 4,4 5))',10
exec insertar_comercios '#A-5',1,'POLYGON((5 7, 6 7, 6 5, 5 5,5 7))',12
exec insertar_comercios '#B-2',1,'POLYGON((2 6, 3 6, 3 4, 2 4,2 6))',10
exec insertar_comercios '#C-2',2,'POLYGON((3 2, 4 2, 4 0, 3 0,3 2))',11
exec insertar_comercios '#C-4',5,'POLYGON((4 2, 7 2, 7 1, 5 1,5 2))',11
exec insertar_comercios '#D-3',3,'POLYGON((7 5, 8 5, 8 3, 7 3,7 5))',12
exec insertar_comercios '#E-2',5,'POLYGON((5 8, 7 8, 7 7, 5 7,5 8))',12
exec insertar_comercios '#E-4',3,'POLYGON((2 8, 4 8, 4 7, 2 7,2 8))',10



select * from Comercio
delete from Comercio where idComercio= 10

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