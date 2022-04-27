Use BD_Espacial
Create or ALTER procedure [dbo].[Visualiza_Mapa]
as
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

exec [Visualiza_Mapa]