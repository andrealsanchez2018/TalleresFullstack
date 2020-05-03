CREATE DATABASE pcare CHARACTER SET utf8 COLLATE utf8_unicode_ci;


USE pcare;

CREATE TABLE estado(	idEstado		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			estado			VARCHAR(255)		
);

CREATE TABLE producto(	idProducto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 nombreProducto 	VARCHAR(255),
			 precio 			INT,
			 imgProducto 		VARCHAR(255),
			 descripcion 		VARCHAR(255),
			 idSubcategoria 	INT NOT NULL,
			 idEstado 			INT NOT NULL
);

CREATE TABLE categoria(	idCategoria		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			categoria		VARCHAR(255),
			idEstado 		INT NOT NULL
);

CREATE TABLE subcategoria(idSubcategoria	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			subcategoria		VARCHAR(255),
			idCategoria 		INT NOT NULL,
			idEstado 			INT NOT NULL
			
);


CREATE TABLE rol(	idRol			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			Rol			VARCHAR(255),
			idEstado 		INT NOT NULL
			
);


CREATE TABLE usuario(	idUsuario		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			nombre			VARCHAR(255),
			apellido		VARCHAR(255),
			correo			VARCHAR(255),
			contraseña		VARCHAR(255),
			idEstado 		INT NOT NULL,
			idRol	 		INT NOT NULL
			
);








INSERT INTO estado (estado)
			VALUES ('existencia'), ('sin existencia'); 


INSERT INTO producto (nombreProducto, precio,imgProducto, descripcion, idSubcategoria, idEstado) 
            VALUES ('shampoo', 12000, 'N:\Fullstack\week3MySQL', '100ml', 1, 1), ('acondicionador', 8000, 'N:\Fullstack\week3MySQL', '80ml', 2, 2), ('mascarilla', 20000, 'N:\Fullstack\week3MySQL', '50ml', 3, 1);



INSERT INTO categoria (categoria, idEstado) 
            VALUES ('savital', 1), ('Pantene', 2), ('Tio Nacho', 1);



INSERT INTO subcategoria (subcategoria, idCategoria,idEstado) VALUES ('graso', 1, 1), ('mixto', 2, 2), ('seco', 3, 1);

INSERT INTO rol (rol, idEstado)
			VALUES ('superAdmin', 1), ('Admin', 2), ('Invitado', 1); 

INSERT INTO usuario (nombre, apellido, correo, contraseña, idEstado,idRol)
			VALUES ('Angela', 'Morales', 'correo@correo.com', 'a1234', 1, 1), ('Victor', 'Perez', 'correo@correo.com', 'a1234', 2, 2), ('Luisa', 'Vargas', 'correo@correo.com', 'a1234', 1, 3); 

ALTER TABLE producto ADD CONSTRAINT fk_subcategoria FOREIGN KEY (idSubcategoria) REFERENCES subcategoria (idSubcategoria) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE subcategoria ADD CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE usuario ADD CONSTRAINT fk_rol FOREIGN KEY (idRol) REFERENCES rol (idRol) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE producto ADD CONSTRAINT fk_estado FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE categoria ADD CONSTRAINT fk_estadoC FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE subcategoria ADD CONSTRAINT fk_estadoS FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rol ADD CONSTRAINT fk_estadoR FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuario ADD CONSTRAINT fk_estadoU FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;
 
/* 
producto
	idProducto
	nombreProducto
	precio
	imgProducto
	descripcion
	idCategoria
	idEstado (int)

prod enlazado subcat y subcat esta relacionado directamente con estado

categoria
	idCategoria
	categoria
	idEstado

subcategoria
	idSubcategoria
	subcategoria
	
	
usuario
	idUsuario
	nombre
	apellido
	correo
	contrasena
	idEstado (int)
	idRol
rol
	idRol  ------admin y superadmin
	rol
estado
	idEstado
	estado




La forma de entrega de este ejercicio es la siguiente:
diagrama de tablas y relaciones en Excel
script de bloc de notas de la bd
Todo a través de drive, envían el enlace en el grupo de hangouts

 */