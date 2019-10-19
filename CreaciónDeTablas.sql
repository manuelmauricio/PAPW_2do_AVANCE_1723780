CREATE DATABASE proyecto;

USE proyecto;


DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario(
	id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL unique,
    correo VARCHAR(50),
    contraseña VARCHAR(30) NOT NULL,
    telefono INT,
    foto BLOB NOT NULL,
	dirección VARCHAR(60),
    PRIMARY KEY (id_usuario)
);


DROP TABLE IF EXISTS mensaje;
CREATE TABLE mensaje(
	id_mensaje INT UNSIGNED AUTO_INCREMENT NOT NULL,
	mensaje VARCHAR(70) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    remitente INT UNSIGNED,
	destinatario INT UNSIGNED,
    PRIMARY KEY (id_mensaje),
	FOREIGN KEY(remitente) 
	REFERENCES usuario(id_usuario),
	FOREIGN KEY(destinatario) 
	REFERENCES usuario(id_usuario)
);

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria(
	id_categoria INT UNSIGNED AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_categoria)
);


DROP TABLE IF EXISTS producto;
CREATE TABLE producto(
	id_producto INT UNSIGNED AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(50),
	estado VARCHAR(10),
    categoriaid INT UNSIGNED NOT NULL,
    unidades INT UNSIGNED,
    calificacion INT UNSIGNED,
    PRIMARY KEY (id_producto),
	FOREIGN KEY(categoriaid) 
	REFERENCES categoria(id_categoria)
);


DROP TABLE IF EXISTS imagen;
CREATE TABLE imagen(
	id_imagen INT UNSIGNED AUTO_INCREMENT NOT NULL,
    productoid INT UNSIGNED NOT NULL,
    foto BLOB NOT NULL,
    PRIMARY KEY (id_imagen),
	FOREIGN KEY(productoid) 
	REFERENCES producto(id_producto)
);


DROP TABLE IF EXISTS video;
CREATE TABLE video(
	id_video INT UNSIGNED AUTO_INCREMENT NOT NULL,
    productoid INT UNSIGNED NOT NULL,
    vid BLOB NOT NULL,
    PRIMARY KEY (id_video),
	FOREIGN KEY(productoid) 
	REFERENCES producto(id_producto)
);



DROP TABLE IF EXISTS compra;
CREATE TABLE compra(
	id_compra INT UNSIGNED AUTO_INCREMENT NOT NULL,
	estado VARCHAR(10) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	forma VARCHAR(10),
	productoid INT UNSIGNED,
	usuarioid INT UNSIGNED,
    PRIMARY KEY (id_compra),
	FOREIGN KEY(usuarioid) 
	REFERENCES usuario(id_usuario),
	FOREIGN KEY(productoid) 
	REFERENCES producto(id_producto)
);


DROP TABLE IF EXISTS comentario;
CREATE TABLE comentario(
	id_comentario INT UNSIGNED AUTO_INCREMENT NOT NULL,
	texto VARCHAR(70) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	productoid INT UNSIGNED,
	usuarioid INT UNSIGNED,
    PRIMARY KEY (id_comentario),
	FOREIGN KEY(usuarioid) 
	REFERENCES usuario(id_usuario),
	FOREIGN KEY(productoid) 
	REFERENCES producto(id_producto)
);


