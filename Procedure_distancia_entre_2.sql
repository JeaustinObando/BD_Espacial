Create or ALTER procedure [dbo].[Distancia_entre_2] @p_nombre_1 varchar(10),@p_nombre_2 varchar(10)
as
DECLARE @vecinos AS TABLE 
(nombre varchar(50), ubicacion geometry)
DECLARE @d GEOMETRY 
SELECT @d = ubicacion from casa where nombre = @p_nombre_1
INSERT INTO @vecinos
         ( [nombre], [ubicacion] )
	SELECT nombre, ubicacion FROM dbo.Casa
INSERT INTO @vecinos
         ( [nombre], [ubicacion] )
SELECT nombre, ubicacion FROM dbo.Comercio

SELECT nombre, ubicacion, ubicacion.STDistance(@d) as Distancia FROM @vecinos
where nombre = @p_nombre_2 or nombre = @p_nombre_1
ORDER BY ubicacion.STDistance(@d)

exec [Distancia_entre_2] '#E-3','#A-3'



select * from @vecinos