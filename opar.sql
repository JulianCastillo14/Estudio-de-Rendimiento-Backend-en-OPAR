CREATE DATABASE  IF NOT EXISTS `opar`;
USE `opar`;

--
-- Table structure for table Barrio
--
DROP TABLE IF EXISTS Barrio;
CREATE TABLE Barrio (
  Id_Barrio int NOT NULL AUTO_INCREMENT,
  Barrio varchar(80) DEFAULT NULL,
  PRIMARY KEY (Id_Barrio)
);

--
-- Dumping data for table Barrio
--
INSERT INTO Barrio VALUES (1,'San Alonso'),(2,'San Francisco'),(3,'Comuneros'),(4,'Mercedes'),(5,'Antonia Santos'),(6,'Alvarez');

--
-- Table structure for table Ciudadano
--
DROP TABLE IF EXISTS Ciudadano;
CREATE TABLE Ciudadano (
  Numero_Documento varchar(15) NOT NULL,
  Nombre_Completo varchar(240) NOT NULL,
  Usuario varchar(50) NOT NULL,
  Contraseña varchar(255) NOT NULL,
  Telefono varchar(16) NOT NULL,
  PRIMARY KEY (Numero_Documento)
);

--
-- Dumping data for table Ciudadano
--
INSERT INTO Ciudadano VALUES ('1002434323','Jerson Julian Cañon Castillo','julian','1423','3114563435'),('1005546504','Juan Camilo Garavito','juang','123','3142509802');

--
-- Table structure for table Tipo_Inmueble
--
DROP TABLE IF EXISTS Tipo_Inmueble;
CREATE TABLE Tipo_Inmueble (
  Id_Tipo_Inmueble int NOT NULL AUTO_INCREMENT,
  Tipo_Inmueble varchar(30) NOT NULL,
  PRIMARY KEY (Id_Tipo_Inmueble)
);

--
-- Dumping data for table Tipo_Inmueble
--
INSERT INTO Tipo_Inmueble VALUES (1,'Casa'),(2,'Apartamento'),(3,'ApartaEstudio'),(4,'Habitacion');

--
-- Table structure for table Inmueble
--
DROP TABLE IF EXISTS Inmueble;
CREATE TABLE Inmueble (
  Id_Inmueble int NOT NULL AUTO_INCREMENT,
  Id_Tipo_Inmueble int NOT NULL,
  Id_Barrio int NOT NULL,
  Numero_Documento varchar(15) NOT NULL,
  Cantidad_Habitaciones int NOT NULL,
  Servicios_Publicos tinyint(1) NOT NULL,
  Area float NOT NULL,
  Descripcion varchar(500) NOT NULL,
  Direccion varchar(80) NOT NULL,
  Precio float NOT NULL,
  PRIMARY KEY (Id_Inmueble),
  KEY Id_Tipo_Inmueble (Id_Tipo_Inmueble),
  KEY Id_Barrio (Id_Barrio),
  KEY Numero_Documento (Numero_Documento),
  CONSTRAINT Inmueble_ibfk_1 FOREIGN KEY (Id_Tipo_Inmueble) REFERENCES Tipo_Inmueble (Id_Tipo_Inmueble),
  CONSTRAINT Inmueble_ibfk_2 FOREIGN KEY (Id_Barrio) REFERENCES Barrio (Id_Barrio),
  CONSTRAINT Inmueble_ibfk_3 FOREIGN KEY (Numero_Documento) REFERENCES Ciudadano (Numero_Documento)
);

--
-- Dumping data for table Inmueble
--
INSERT INTO Inmueble VALUES (1,1,2,'1005546504',3,1,60,'Sitio Seguro','Cra28#14-81',600000),(2,2,1,'1005546504',4,0,70,'Comodo','Cra12#45-63',1000000),(3,2,2,'1002434323',3,1,52,'El sector es agradable','Cr 24 #9-45',1200000),(4,3,2,'1002434323',1,0,40,'Acogedor apartaestudio en arriendo, ubicado en una zona tranquila y céntrica.','Cr 34 #8-64',900000),(5,2,6,'1002434323',2,1,45.6,'Este es un apartamento moderno y acogedor ubicado en una zona privilegiada de la ciudad.','Cr 33 #18-56',1300000),(6,2,2,'1002434323',2,1,40.5,'Cuenta con acceso a areas sociales del conjunto','Cr 27 #14-61',800000),(7,4,1,'1002434323',1,1,16.3,'La habitación cuenta con baño privado ','Cr 25 #7-55',350000),(46,4,5,'1002434323',1,1,16.7,'La habitación cuenta con baño privado','Cr 27 #4-23',750000);

--
-- Table structure for table Imagen
--
DROP TABLE IF EXISTS Imagen;
CREATE TABLE Imagen (
  Id_Imagen int NOT NULL AUTO_INCREMENT,
  Id_Inmueble int NOT NULL,
  URL varchar(500) NOT NULL,
  PRIMARY KEY (Id_Imagen),
  KEY Id_Inmueble (Id_Inmueble),
  CONSTRAINT Imagen_ibfk_1 FOREIGN KEY (Id_Inmueble) REFERENCES Inmueble (Id_Inmueble)
);

--
-- Dumping data for table Imagen
--
INSERT INTO Imagen VALUES (1,3,'https://www.dropbox.com/scl/fi/9s9bar9ahjmdvk3osccmh/Fachada.jpeg?rlkey=84z2pkpxwv15waaot6woi9rmp&raw=1'),(2,3,'https://www.dropbox.com/scl/fi/ia82dnj1xz4c11m0etenk/Habitacion.jpeg?rlkey=dij9jenwhlf3gxgjsnkhfpjlj&raw=1'),(3,3,'https://www.dropbox.com/scl/fi/gh9ln50f4ezcqmea4lhw4/Sala.jpeg?rlkey=zs19hvmi3crdjmasd0miecdlb&raw=1'),(4,4,'https://www.dropbox.com/scl/fi/1axe0ugoavt3nsbzbg5qf/Habitacion.jpeg?rlkey=b2td4wx499l5y9s29ldjgzp8n&raw=1'),(5,4,'https://www.dropbox.com/scl/fi/2ep7z1m3fiznxnbbj4nnd/Ba-o.jpeg?rlkey=eqae87qffu2fhbqemm4w0jd0t&raw=1'),(6,4,'https://www.dropbox.com/scl/fi/dyr1r8pl5vgelv7k09van/Fachada.jpeg?rlkey=gszgryfkldqv0q0qjlc18iw0a&raw=1'),(7,5,'https://www.dropbox.com/scl/fi/znggvfcka39w7w1bi6wcm/Habitacion1.jpeg?rlkey=z45pqy4bmang43y9fcpx3sdt9&raw=1'),(8,5,'https://www.dropbox.com/scl/fi/hxmy85qp36m27i5txod7k/Fachada.jpeg?rlkey=gdy07odlpmnwn09oews3lgme7&raw=1'),(9,5,'https://www.dropbox.com/scl/fi/yblcw4ro5llc9d75sno8a/Habitacion2.jpeg?rlkey=hb0uq3ch4qfcow1cwewheyf2h&raw=1'),(10,1,'https://www.dropbox.com/scl/fi/9s9bar9ahjmdvk3osccmh/Fachada.jpeg?rlkey=84z2pkpxwv15waaot6woi9rmp&raw=1'),(11,1,'https://www.dropbox.com/scl/fi/ia82dnj1xz4c11m0etenk/Habitacion.jpeg?rlkey=dij9jenwhlf3gxgjsnkhfpjlj&raw=1'),(12,1,'https://www.dropbox.com/scl/fi/1axe0ugoavt3nsbzbg5qf/Habitacion.jpeg?rlkey=b2td4wx499l5y9s29ldjgzp8n&raw=1'),(13,2,'https://www.dropbox.com/scl/fi/yblcw4ro5llc9d75sno8a/Habitacion2.jpeg?rlkey=hb0uq3ch4qfcow1cwewheyf2h&raw=1'),(14,2,'https://www.dropbox.com/scl/fi/znggvfcka39w7w1bi6wcm/Habitacion1.jpeg?rlkey=z45pqy4bmang43y9fcpx3sdt9&raw=1'),(15,2,'https://www.dropbox.com/scl/fi/1axe0ugoavt3nsbzbg5qf/Habitacion.jpeg?rlkey=b2td4wx499l5y9s29ldjgzp8n&raw=1'),(16,6,'https://www.dropbox.com/scl/fi/xzpcs5fglganto5edllqb/Fachada.jpeg?rlkey=a90m188atn2wgwdqwii7bma9k&raw=1'),(17,6,'https://www.dropbox.com/scl/fi/00fj41cxuz2i9292x7ywf/Habitacion.jpeg?rlkey=mklm9wfgccjr7gnngkh38w4pi&raw=1'),(18,6,'https://www.dropbox.com/scl/fi/uzhishroqdhgaep1uni1u/Ba-o.jpeg?rlkey=b6bkln2kicpkj4j05if7qr7ue&raw=1'),(19,7,'https://www.dropbox.com/scl/fi/r0687o37s3d3qxon7qso7/Habitacion2.jpeg?rlkey=3tjcd6rm562zr1zgq580b4zj2&raw=1'),(20,7,'https://www.dropbox.com/scl/fi/zv7kud6m4ekynkkxhrx3k/Habitacion1.jpeg?rlkey=ic9j2wi37jt8e5noz4awfn7rz&raw=1'),(39,46,'https://www.dropbox.com/scl/fi/fbiuz8p9tjsmcpt6nsmu5/1000009770.jpg?rlkey=nle9nguqijrwyo4egnggf8sgv&raw=1'),(40,46,'https://www.dropbox.com/scl/fi/rxxf3rnhchatmeca4ls1j/1000009769.jpg?rlkey=47vl8o3sqyo3fzpoxph6jzwcc&raw=1');

--
-- Table structure for table Opinion
--
DROP TABLE IF EXISTS Opinion;
CREATE TABLE Opinion (
  Id_Opinion int NOT NULL AUTO_INCREMENT,
  Id_Inmueble int NOT NULL,
  Numero_Documento varchar(15) NOT NULL,
  Comentario varchar(500) NOT NULL,
  Calificacion float NOT NULL,
  PRIMARY KEY (Id_Opinion),
  KEY Id_Inmueble (Id_Inmueble),
  KEY Numero_Documento (Numero_Documento),
  CONSTRAINT Opinion_ibfk_1 FOREIGN KEY (Id_Inmueble) REFERENCES Inmueble (Id_Inmueble),
  CONSTRAINT Opinion_ibfk_2 FOREIGN KEY (Numero_Documento) REFERENCES Ciudadano (Numero_Documento)
);

--
-- Dumping data for table Opinion
--
INSERT INTO Opinion VALUES (1,1,'1002434323','Bueno',5),(2,2,'1002434323','Calidad',4),(5,5,'1005546504','Malísimo ',2),(14,6,'1005546504','Siuuuu ',3),(15,7,'1005546504','sipo',1.5),(16,3,'1005546504','nipo',1),(18,5,'1005546504','Nocas sopas',5),(20,4,'1005546504','Me gusta',5);