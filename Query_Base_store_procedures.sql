USE [master]
GO
/****** Object:  Database [BD_Espacial]    Script Date: 26/4/2022 04:17:55 ******/
CREATE DATABASE [BD_Espacial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Espacial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_Espacial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Espacial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_Espacial_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_Espacial] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Espacial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Espacial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Espacial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Espacial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Espacial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Espacial] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Espacial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_Espacial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Espacial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Espacial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Espacial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Espacial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Espacial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Espacial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Espacial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Espacial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_Espacial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Espacial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Espacial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Espacial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Espacial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Espacial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Espacial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Espacial] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_Espacial] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Espacial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Espacial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Espacial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Espacial] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_Espacial] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_Espacial] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_Espacial', N'ON'
GO
ALTER DATABASE [BD_Espacial] SET QUERY_STORE = OFF
GO
USE [BD_Espacial]
GO
/****** Object:  Table [dbo].[Calle]    Script Date: 26/4/2022 04:17:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calle](
	[idCalle] [int] IDENTITY(1,1) NOT NULL,
	[distancia] [geography] NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_Calle] PRIMARY KEY CLUSTERED 
(
	[idCalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casa]    Script Date: 26/4/2022 04:17:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casa](
	[idCasa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[ubicacion] [geography] NOT NULL,
	[idCalle] [int] NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_Casa] PRIMARY KEY CLUSTERED 
(
	[idCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comercio]    Script Date: 26/4/2022 04:17:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comercio](
	[idComercio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[idTipo] [int] NOT NULL,
	[ubicacion] [geography] NOT NULL,
	[idCalle] [int] NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_Comercio] PRIMARY KEY CLUSTERED 
(
	[idComercio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 26/4/2022 04:17:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[idComercio] [int] NOT NULL,
	[nombre] [varchar](15) NOT NULL,
	[peso] [float] NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
	[precio] [float] NOT NULL,
	[idTipoProducto] [int] NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComercio]    Script Date: 26/4/2022 04:17:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComercio](
	[idTipoComercio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[horaabierto] [time](7) NOT NULL,
	[horacerrado] [time](7) NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_TipoComercio] PRIMARY KEY CLUSTERED 
(
	[idTipoComercio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 26/4/2022 04:17:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[idTipoProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_idTipoProducto] PRIMARY KEY CLUSTERED 
(
	[idTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Casa]  WITH CHECK ADD  CONSTRAINT [FK_Casa_Calle] FOREIGN KEY([idCalle])
REFERENCES [dbo].[Calle] ([idCalle])
GO
ALTER TABLE [dbo].[Casa] CHECK CONSTRAINT [FK_Casa_Calle]
GO
ALTER TABLE [dbo].[Comercio]  WITH CHECK ADD  CONSTRAINT [FK_Comercio_Calle] FOREIGN KEY([idCalle])
REFERENCES [dbo].[Calle] ([idCalle])
GO
ALTER TABLE [dbo].[Comercio] CHECK CONSTRAINT [FK_Comercio_Calle]
GO
ALTER TABLE [dbo].[Comercio]  WITH CHECK ADD  CONSTRAINT [FK_Comercio_TipoComercio] FOREIGN KEY([idTipo])
REFERENCES [dbo].[TipoComercio] ([idTipoComercio])
GO
ALTER TABLE [dbo].[Comercio] CHECK CONSTRAINT [FK_Comercio_TipoComercio]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_idTipoProducto] FOREIGN KEY([idTipoProducto])
REFERENCES [dbo].[TipoProducto] ([idTipoProducto])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_idTipoProducto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Comercio] FOREIGN KEY([idComercio])
REFERENCES [dbo].[Comercio] ([idComercio])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Comercio]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_calles]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[actualizar_calles] @id_calle int, @p_distancia geography
as

update Calle
set distancia = @p_distancia
where @id_calle = @id_calle
GO
/****** Object:  StoredProcedure [dbo].[actualizar_comercios]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[actualizar_comercios] @id_comercio int, @p_nombre varchar(10), @p_tipo_comercio int, @p_ubicacion geography, @p_calle int
as

update Comercio
set nombre = @p_nombre, idTipo = @p_tipo_comercio, ubicacion = @p_ubicacion, idCalle = @p_calle
where idComercio = @id_comercio
GO
/****** Object:  StoredProcedure [dbo].[actualizar_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[actualizar_productos] @id_producto int, @p_comercio int, @p_nombre varchar(15), @p_peso float, @p_descripcion varchar(20),
@precio float, @p_tipo_producto int
as

update Producto
set idComercio = @p_comercio, nombre = @p_nombre, peso = @p_peso, descripcion= @p_descripcion, 
precio = @precio, idTipoProducto = @p_tipo_producto
where idProducto = @id_producto
GO
/****** Object:  StoredProcedure [dbo].[actualizar_tipo_comercio]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[actualizar_tipo_comercio]  @id_tipo_comercio int, @p_nombre varchar(10),
@p_hora_abierto time(7), @p_hora_cerrado time(7)
as

update TipoComercio
set nombre = @p_nombre, horaabierto = @p_hora_abierto, horacerrado = @p_hora_cerrado
where @id_tipo_comercio = idTipoComercio
GO
/****** Object:  StoredProcedure [dbo].[actualizar_tipo_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[actualizar_tipo_productos] @id_tipo_producto int, @p_nombre varchar(30)
as

update TipoProducto
set nombre = @p_nombre
where @id_tipo_producto = idTipoProducto
GO
/****** Object:  StoredProcedure [dbo].[eliminar_calle]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[eliminar_calle] @id_calle int
as

update Calle
set visible = 0
where @id_calle = idCalle
GO
/****** Object:  StoredProcedure [dbo].[eliminar_comercios]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[eliminar_comercios] @id_comercio int
as

update Comercio
set visible = 0
where @id_comercio = idComercio
GO
/****** Object:  StoredProcedure [dbo].[eliminar_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[eliminar_productos] @id_producto int
as

update Producto
set visible = 0
where @id_producto = idProducto
GO
/****** Object:  StoredProcedure [dbo].[eliminar_tipo_comercio]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[eliminar_tipo_comercio] @id_tipo_comercio int
as

update TipoComercio
set visible = 0
where @id_tipo_comercio = idTipoComercio
GO
/****** Object:  StoredProcedure [dbo].[eliminar_tipo_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[eliminar_tipo_productos] @id_tipo_producto int
as

update TipoProducto
set visible = 0
where @id_tipo_producto = idTipoProducto
GO
/****** Object:  StoredProcedure [dbo].[insertar_calles]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertar_calles] @p_distancia geography
as

insert Calle(distancia, visible)
values(@p_distancia, 1)
GO
/****** Object:  StoredProcedure [dbo].[insertar_comercios]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertar_comercios] @p_nombre varchar(10), @p_tipo_comercio int, @p_ubicacion geography, @p_calle int
as

insert Comercio(nombre, idTipo, ubicacion, idCalle, visible)
values(@p_nombre, @p_tipo_comercio, @p_ubicacion, @p_calle, 1)
GO
/****** Object:  StoredProcedure [dbo].[insertar_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertar_productos] @p_comercio int, @p_nombre varchar(15), @p_peso float, @p_descripcion varchar(20),
@precio float, @p_tipo_producto int
as

insert Producto(idComercio, nombre, peso, descripcion, precio, idTipoProducto, visible)
values(@p_comercio, @p_nombre, @p_peso, @p_descripcion, @precio, @p_tipo_producto, 1)
GO
/****** Object:  StoredProcedure [dbo].[insertar_tipo_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertar_tipo_productos] @p_nombre varchar(30)
as

insert TipoProducto(nombre, visible)
values(@p_nombre, 1)
GO
/****** Object:  StoredProcedure [dbo].[insertar_tipoComercio]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertar_tipoComercio] @p_nombre varchar(10), @p_hora_abierto time(7), @p_hora_cerrado time(7)
as

insert TipoComercio(nombre, horaabierto, horacerrado, visible)
values(@p_nombre, @p_hora_abierto, @p_hora_cerrado, 1)
GO
/****** Object:  StoredProcedure [dbo].[ver_calles]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ver_calles]
as

select idCalle, distancia
from Calle
where visible = 1;
GO
/****** Object:  StoredProcedure [dbo].[ver_comercios]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ver_comercios]
as

select C.nombre, TC.nombre, C.ubicacion, C.idCalle
from Comercio C
Inner Join TipoComercio TC ON C.idTipo = TC.idTipoComercio
where C.visible = 1;
GO
/****** Object:  StoredProcedure [dbo].[ver_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ver_productos]
as

select P.idProducto, P.nombre, P.descripcion, P.peso, P.precio, C.nombre, C.idCalle, TP.nombre
from Producto P
Inner Join Comercio C ON P.idComercio = C.idComercio
inner join TipoProducto TP ON P.idTipoProducto = TP.idTipoProducto
where P.visible = 1;
GO
/****** Object:  StoredProcedure [dbo].[ver_tipo_productos]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ver_tipo_productos]
as

select idTipoProducto, nombre
from TipoProducto
where visible = 1;
GO
/****** Object:  StoredProcedure [dbo].[ver_tipos_comercios]    Script Date: 26/4/2022 04:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ver_tipos_comercios]
as

select nombre, horaabierto, horacerrado
from TipoComercio
where visible = 1;
GO
USE [master]
GO
ALTER DATABASE [BD_Espacial] SET  READ_WRITE 
GO
