DROP DATABASE IF EXISTS db_libro_express;

CREATE DATABASE db_libro_express;

USE db_libro_express;

CREATE TABLE clientes(
id_cliente VARCHAR(50) PRIMARY KEY NOT NULL,
nombre_cliente VARCHAR(50),
email_cliente VARCHAR(100),
telefono VARCHAR(10)
);

CREATE TABLE prestamos(
id_prestamo VARCHAR(50) PRIMARY KEY NOT NULL,
id_cliente VARCHAR(50),
CONSTRAINT fk_cliente_prestamo
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente),
fecha_inicio DATE,
fecha_devolucion DATE,
estado ENUM('Activo', 'Inactivo')
);

CREATE TABLE generos_libros(
id_genero_libro VARCHAR(50) PRIMARY KEY NOT NULL,
nombre_genero_libro VARCHAR(50)
);

CREATE TABLE libros(
id_libro VARCHAR(50) PRIMARY KEY NOT NULL,
titulo_libro VARCHAR(50),
anio_publicacion INT,
id_genero_libro VARCHAR(50),
CONSTRAINT fk_genero_libro
FOREIGN KEY (id_genero_libro)
REFERENCES generos_libros (id_genero_libro),
estado ENUM('Disponible', 'Prestado')
);

CREATE TABLE detalles_prestamos(
id_detalle_prestamo VARCHAR(50) PRIMARY KEY NOT NULL,
id_prestamo VARCHAR(50),
CONSTRAINT fk_prestamo_detalle
FOREIGN KEY (id_prestamo)
REFERENCES prestamos (id_prestamo),
id_libro VARCHAR(50),
CONSTRAINT fk_libro_detalle
FOREIGN KEY (id_libro)
REFERENCES libros (id_libro)
);



