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

/*Restricciones*/

ALTER TABLE clientes
ADD CONSTRAINT uq_email_cliente UNIQUE (email_cliente);

/*Trigger*/
DELIMITER //

CREATE TRIGGER actualizar_estado_libro
AFTER INSERT ON detalles_prestamos
FOR EACH ROW
BEGIN

    UPDATE libros
    SET estado = 'Prestado'
    WHERE id_libro = NEW.id_libro;
END //

DELIMITER ;

/*Procedimientos*/

DELIMITER //
CREATE PROCEDURE InsertarCliente(
    IN nombre_cliente VARCHAR(50),
    IN email_cliente VARCHAR(100),
    IN telefono VARCHAR(10)
)
BEGIN
    INSERT INTO clientes (id_cliente, nombre_cliente, email_cliente, telefono)
    VALUES (UUID(), nombre_cliente, email_cliente, telefono);
END //
DELIMITER ;

/*---------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //

CREATE PROCEDURE InsertarPrestamo(
    IN cliente_nombre VARCHAR(50), 
    IN fecha_inicio DATE, 
    IN fecha_devolucion DATE, 
    IN estado ENUM('Activo','Inactivo')
)
BEGIN
    DECLARE cliente_id VARCHAR(50);
    DECLARE prestamo_id VARCHAR(50);

    SELECT id_cliente INTO cliente_id FROM clientes WHERE nombre_cliente = cliente_nombre;

    SET prestamo_id = UUID();

    INSERT INTO prestamos(id_prestamo, id_cliente, fecha_inicio, fecha_devolucion, estado) 
    VALUES (prestamo_id, cliente_id, fecha_inicio, fecha_devolucion, estado);
END //

DELIMITER ;

/*---------------------------------------------------------------------------------------------------------------------------*/
DELIMITER //
 
CREATE PROCEDURE InsertarGenero(
	nombre_genero_libro VARCHAR(50))
BEGIN
    INSERT INTO generos_libros(id_genero_libro, nombre_genero_libro) 
    VALUES (UUID(), nombre_genero_libro);
 
END //
 
DELIMITER ;

/*---------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //

CREATE PROCEDURE InsertarLibro(
    titulo_libro VARCHAR(50), 
    anio_publicacion INT, 
    genero_nombre VARCHAR(50),
    estado ENUM('Disponible','Prestado')
)
BEGIN
    DECLARE id_generoLibro BINARY(36);
    DECLARE id_libro VARCHAR(50);

    SELECT id_genero_libro INTO id_generoLibro FROM generos_libros WHERE nombre_genero_libro = genero_nombre;

    SET id_libro = UUID();

    INSERT INTO libros(id_libro, titulo_libro, anio_publicacion, id_genero_libro, estado) 
    VALUES (id_libro, titulo_libro, anio_publicacion, id_generoLibro, estado);
END //

DELIMITER ;

/*---------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //

CREATE PROCEDURE InsertarDetallesPrestamos(
    nombre_cliente VARCHAR(50), 
    tituloLibro VARCHAR(100)
)
BEGIN
    DECLARE Cliente_id2 BINARY(36);
    DECLARE Prestamo_id2 BINARY(36);
    DECLARE Libros_id2 BINARY(36);
    DECLARE DetallePrestamo_id VARCHAR(50);

    SET Cliente_id2 = (SELECT id_cliente FROM clientes WHERE nombre_cliente = nombre_cliente LIMIT 1);

    SET Prestamo_id2 = (SELECT id_prestamo FROM prestamos WHERE id_cliente = Cliente_id2 LIMIT 1);

    SET Libros_id2 = (SELECT id_libro FROM libros WHERE titulo_libro = tituloLibro LIMIT 1);

    SET DetallePrestamo_id = UUID();

    INSERT INTO detalles_prestamos(id_detalle_prestamo, id_prestamo, id_libro) 
    VALUES (DetallePrestamo_id, Prestamo_id2, Libros_id2);
END //

DELIMITER ;


/*Trigger*/

/*INSERT*/
CALL InsertarCliente('Juan Pérez', 'juanperez@gmail.com', '1234567890');
CALL InsertarCliente('María Rodríguez', 'maria.rodriguez@gmail.com', '9876543210');
CALL InsertarCliente('Carlos Gómez', 'cgomez@gmail.com', '5551234567');
CALL InsertarCliente('Laura Martínez', 'laura.martinez@gmail.com', '7894561230');
CALL InsertarCliente('Alejandro López', 'alejandro.lopez@gmail.com', '3339998888');
CALL InsertarCliente('Ana García', 'ana.garcia@gmail.com', '1112223333');
CALL InsertarCliente('Luis Hernández', 'luis.hernandez@gmail.com', '4445556666');
CALL InsertarCliente('Elena Díaz', 'elena.diaz@gmail.com', '7778889999');
CALL InsertarCliente('Pedro Sánchez', 'pedro.sanchez@gmail.com', '6667778888');
CALL InsertarCliente('Sofía Ruiz', 'sofia.ruiz@gmail.com', '2223334444');
CALL InsertarCliente('Lucas Castro', 'lucas.castro@gmail.com', '8887776666');
CALL InsertarCliente('Marina Jiménez', 'marina.jimenez@gmail.com', '5554443333');
CALL InsertarCliente('Daniel Martín', 'daniel.martin@gmail.com', '3332221111');
CALL InsertarCliente('Carmen López', 'carmen.lopez@gmail.com', '9998887777');
CALL InsertarCliente('Javier Morales', 'javier.morales@gmail.com', '1114447777');

SELECT * FROM clientes;
---------------------
CALL InsertarPrestamo('Juan Pérez', '2024-03-01', '2024-03-15', 'Activo');
CALL InsertarPrestamo('María Rodríguez', '2024-02-28', '2024-03-10', 'Activo');
CALL InsertarPrestamo('Carlos Gómez', '2024-03-02', '2024-03-16', 'Inactivo');
CALL InsertarPrestamo('Laura Martínez', '2024-03-05', '2024-03-20', 'Activo');
CALL InsertarPrestamo('Alejandro López', '2024-03-03', '2024-03-18', 'Inactivo');
CALL InsertarPrestamo('Ana García', '2024-03-04', '2024-03-19', 'Activo');
CALL InsertarPrestamo('Luis Hernández', '2024-03-07', '2024-03-22', 'Activo');
CALL InsertarPrestamo('Elena Díaz', '2024-03-09', '2024-03-24', 'Inactivo');
CALL InsertarPrestamo('Pedro Sánchez', '2024-03-10', '2024-03-25', 'Activo');
CALL InsertarPrestamo('Sofía Ruiz', '2024-03-12', '2024-03-27', 'Activo');
CALL InsertarPrestamo('Lucas Castro', '2024-03-14', '2024-03-29', 'Inactivo');
CALL InsertarPrestamo('Marina Jiménez', '2024-03-16', '2024-03-31', 'Activo');
CALL InsertarPrestamo('Daniel Martín', '2024-03-18', '2024-04-02', 'Activo');
CALL InsertarPrestamo('Carmen López', '2024-03-20', '2024-04-04', 'Inactivo');
CALL InsertarPrestamo('Javier Morales', '2024-03-22', '2024-04-06', 'Activo');


SELECT * FROM prestamos;

CALL InsertarGenero('Ciencia Ficción');
CALL InsertarGenero('Fantasía');
CALL InsertarGenero('Romance');
CALL InsertarGenero('Misterio');
CALL InsertarGenero('Thriller');
CALL InsertarGenero('Historia');
CALL InsertarGenero('Biografía');
CALL InsertarGenero('Autoayuda');
CALL InsertarGenero('Poesía');
CALL InsertarGenero('Aventura');
CALL InsertarGenero('Terror');
CALL InsertarGenero('Humor');
CALL InsertarGenero('Drama');
CALL InsertarGenero('Suspenso');
CALL InsertarGenero('Infantil');

SELECT * FROM generos_libros;

CALL InsertarLibro('El fin de la eternidad', 1955, 'Ciencia Ficción', 'Disponible');
CALL InsertarLibro('El señor de los anillos', 1954, 'Fantasía', 'Disponible');
CALL InsertarLibro('Orgullo y prejuicio', 1813, 'Romance', 'Disponible');
CALL InsertarLibro('El código Da Vinci', 2003, 'Misterio', 'Prestado');
CALL InsertarLibro('El psicoanalista', 2002, 'Thriller', 'Disponible');
CALL InsertarLibro('La historia interminable', 1979, 'Fantasía', 'Disponible');
CALL InsertarLibro('Steve Jobs', 2011, 'Biografía', 'Disponible');
CALL InsertarLibro('Cien años de soledad', 1967, 'Historia', 'Prestado');
CALL InsertarLibro('La ladrona de libros', 2005, 'Drama', 'Disponible');
CALL InsertarLibro('La sombra del viento', 2001, 'Misterio', 'Prestado');
CALL InsertarLibro('It', 1986, 'Terror', 'Disponible');
CALL InsertarLibro('El principito', 1943, 'Infantil', 'Disponible');
CALL InsertarLibro('Misery', 1987, 'Thriller', 'Disponible');
CALL InsertarLibro('1984', 1949, 'Ciencia Ficción', 'Disponible');
CALL InsertarLibro('Harry Potter y la piedra filosofal', 1997, 'Fantasía', 'Disponible');

SELECT * FROM libros;

CALL InsertarDetallesPrestamos('Juan Pérez', 'El fin de la eternidad');
CALL InsertarDetallesPrestamos('María Rodríguez', 'El señor de los anillos');
CALL InsertarDetallesPrestamos('Juan Pérez', 'Orgullo y prejuicio');
CALL InsertarDetallesPrestamos('María Rodríguez', 'El código Da Vinci');
CALL InsertarDetallesPrestamos('Juan Pérez', 'El psicoanalista');
CALL InsertarDetallesPrestamos('María Rodríguez', 'La historia interminable');
CALL InsertarDetallesPrestamos('Juan Pérez', 'Steve Jobs');
CALL InsertarDetallesPrestamos('María Rodríguez', 'Cien años de soledad');
CALL InsertarDetallesPrestamos('Juan Pérez', 'La ladrona de libros');
CALL InsertarDetallesPrestamos('María Rodríguez', 'La sombra del viento');
CALL InsertarDetallesPrestamos('Juan Pérez', 'It');
CALL InsertarDetallesPrestamos('María Rodríguez', 'El principito');
CALL InsertarDetallesPrestamos('Juan Pérez', 'Misery');
CALL InsertarDetallesPrestamos('María Rodríguez', '1984');
CALL InsertarDetallesPrestamos('Juan Pérez', 'Harry Potter y la piedra filosofal');

SELECT * FROM detalles_prestamos;




