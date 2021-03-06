Create or ALTER procedure [dbo].[BuscaVecinos] @p_nombre varchar(10)
as
DECLARE @vecinos AS TABLE 
(nombre varchar(50), ubicacion geometry, distancia float)
DECLARE @d GEOMETRY 
SELECT @d = ubicacion from casa where nombre = @p_nombre
INSERT INTO @vecinos
         ( [nombre], [ubicacion], [distancia] )
	SELECT nombre, ubicacion, ubicacion.STDistance(@d) FROM dbo.Casa
	where ubicacion is not null
	and ubicacion.STDistance(@d) <= 0 and visible = '1'
	ORDER BY ubicacion.STDistance(@d)
INSERT INTO @vecinos
         ( [nombre], [ubicacion], [distancia] )
SELECT nombre, ubicacion, ubicacion.STDistance(@d) FROM dbo.Comercio
where ubicacion is not null
and ubicacion.STDistance(@d) <= 0 and visible = '1'
ORDER BY ubicacion.STDistance(@d)

select * from @vecinos

update Comercio set visible= '1' where nombre = '#A-3'

exec BuscaVecinos '#A-1'

exec Visualiza_Mapa