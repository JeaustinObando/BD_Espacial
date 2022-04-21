




	
create table calle(
	idCalle int primary key,
	distancia geometry
)

create table comercio(
	idComercio int primary key,
	nombre varchar(10),
	tipo varchar(10),
	disponibilidad bit,
	horario varchar(20),
	ubicacion geometry,
	fk_idCalle int,
	FOREIGN KEY (fk_idCalle) REFERENCES calle(idCalle)
)

create table casa(
	idCasa int primary key,
	nombre varchar(10),
	ubicacion geometry,
	fk_idCalle int,
	FOREIGN KEY (fk_idCalle) REFERENCES calle(idCalle)
)

