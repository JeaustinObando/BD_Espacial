USE BD_Espacial
--CRUD tipo producto
--
--Función que crea un tipo producto
--Parametros:
	--pnombre: es el nombre del producto.
	--pprecio: es el precio del producto.
	--pstock: es la cantidad del producto.
	--pproveedor: id del proveedor del producto.
	--pcategoria: id de la categoria del producto

CREATE or alter procedure crear_tipo_inventario(
	@pIdTipoPorducto int,
	@pprecio varchar(50)
)
as
begin 
	insert into TipoProducto(idTipoProducto,nombre)
	values(@pIdTipoPorducto,@pprecio);

end;
exec crear_tipo_inventario 2,"Alimentos"

Select * from TipoProducto

--Función que borra un producto por su id
--Parametros:
	--pid_producto: id del producto.
CREATE OR REPLACE FUNCTION borrar_producto(pid_producto int)
RETURNS void as '
begin 
	update producto set visible = ''0'' where producto.id_producto  = pid_producto ;
	exception 
	when others then 
    raise exception ''El producto ingresado no es existe ''
					''en la Base de Datos'';
end'
LANGUAGE plpgsql;
select borrar_producto(1)

--Función que lee todos los producto.
CREATE OR REPLACE FUNCTION leer_producto()
RETURNS table(pid_producto int,pnombre text, pprecio money, pstock int) as '
begin 
	return query
	select id_producto, (producto).nombre, (producto).precio , (producto).stock
	from producto where producto.visible = ''1'';
	exception 
	when others then 
    raise exception ''No existe ningun dato en la tabla ''
					''de la Base de Datos'';
end'
LANGUAGE plpgsql;

select leer_producto();


--Función que actualizar un producto
--Parametros:
	--pid_producto: id del producto a actualizar.
	--pnombre_producto: es el nuevo nombre del producto.
	--pprecio: es el nuevo precio del producto.
	--pstock: es la nuevo cantidad de producto.
CREATE OR REPLACE FUNCTION actualizar_producto(pid_producto int, pnombre_producto text, pprecio money, pstock integer)
RETURNS void as '
begin 
	update producto set producto = ROW(pnombre_producto,pprecio,pstock) where producto.id_producto = pid_producto;
	exception 
	when others then 
    raise exception ''El producto ingresado no es existe ''
					''en la Base de Datos'';
end'
LANGUAGE plpgsql;

select actualizar_producto(1,'Martillo','5000','4');

update producto set producto = ROW('Martillo','5000','3') where producto.id_producto = 1;

--CRUD producto

--Función que crea un producto
--Parametros:
	--pnombre: es el nombre del producto.
	--pprecio: es el precio del producto.
	--pstock: es la cantidad del producto.
	--pproveedor: id del proveedor del producto.
	--pcategoria: id de la categoria del producto

CREATE OR REPLACE FUNCTION crear_inventario(pnombre text, pprecio money, pstock integer, pproveedor int, pcategoria int)
RETURNS void as '
begin 
	insert into producto(producto,id_categoria_producto,id_proveedor,visible)
	values(ROW(pnombre,pprecio,pstock),pcategoria,pproveedor,''1'');
	exception 
	when others then 
    raise exception ''El producto ingresado no es existe ''
					''en la Base de Datos'';

end'
LANGUAGE plpgsql;
select crear_producto('Martillo','5000',5,3,1)

Select * from producto

--Función que borra un producto por su id
--Parametros:
	--pid_producto: id del producto.
CREATE OR REPLACE FUNCTION borrar_producto(pid_producto int)
RETURNS void as '
begin 
	update producto set visible = ''0'' where producto.id_producto  = pid_producto ;
	exception 
	when others then 
    raise exception ''El producto ingresado no es existe ''
					''en la Base de Datos'';
end'
LANGUAGE plpgsql;
select borrar_producto(1)

--Función que lee todos los producto.
CREATE OR REPLACE FUNCTION leer_producto()
RETURNS table(pid_producto int,pnombre text, pprecio money, pstock int) as '
begin 
	return query
	select id_producto, (producto).nombre, (producto).precio , (producto).stock
	from producto where producto.visible = ''1'';
	exception 
	when others then 
    raise exception ''No existe ningun dato en la tabla ''
					''de la Base de Datos'';
end'
LANGUAGE plpgsql;

select leer_producto();


--Función que actualizar un producto
--Parametros:
	--pid_producto: id del producto a actualizar.
	--pnombre_producto: es el nuevo nombre del producto.
	--pprecio: es el nuevo precio del producto.
	--pstock: es la nuevo cantidad de producto.
CREATE OR REPLACE FUNCTION actualizar_producto(pid_producto int, pnombre_producto text, pprecio money, pstock integer)
RETURNS void as '
begin 
	update producto set producto = ROW(pnombre_producto,pprecio,pstock) where producto.id_producto = pid_producto;
	exception 
	when others then 
    raise exception ''El producto ingresado no es existe ''
					''en la Base de Datos'';
end'
LANGUAGE plpgsql;

select actualizar_producto(1,'Martillo','5000','4');

update producto set producto = ROW('Martillo','5000','3') where producto.id_producto = 1;