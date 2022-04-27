Create or ALTER procedure [dbo].[Distancia_comercio] @Origen varchar(10),@p_nombre varchar(10),@p_hora time(7) 
as
DECLARE @d GEOMETRY 
SELECT @d = ubicacion from casa where nombre = @Origen
select Co.nombre,PD.nombre Nombre, PD.peso Peso, PD.descripcion Descripcion, PD.precio Precio, TP.nombre Tipo
,TC.nombre Comercio, CO.ubicacion Ubicacion_Negocio,CO.ubicacion.STDistance(@d) Distancia from Comercio CO
inner join TipoComercio TC on TC.idTipoComercio = CO.idTipo
inner join Producto PD on PD.idComercio = CO.idComercio
inner join TipoProducto TP on TP.idTipoProducto = PD.idTipoProducto
where TC.nombre= @p_nombre and @p_hora between TC.horaabierto and TC.horacerrado
ORDER BY CO.ubicacion.STDistance(@d)

Exec Distancia_comercio '#E-3','Farmacia','12:00:00'
