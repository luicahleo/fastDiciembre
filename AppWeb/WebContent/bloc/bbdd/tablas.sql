--
-- Creacion de la BBDD
--
DROP DATABASE IF EXISTS notasfast;
CREATE DATABASE notasfast;
GRANT ALL ON DATABASE notasfast TO dit;

--
-- Vamos a definir esta BBDD
--
\c notasfast;

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS usuarios (
id SERIAL NOT NULL PRIMARY KEY ,
nombre VARCHAR( 20 ) NOT NULL ,
clave VARCHAR( 100 ) NOT NULL ,
UNIQUE (
nombre
)
);

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS notas (
  id SERIAL NOT NULL,
  idusuario int4 NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  nota TEXT,
  urlimagen TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (idusuario) REFERENCES usuarios (id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

--
-- Insercion de datos de ejemplo
--
INSERT INTO usuarios VALUES(1,'usuario','clave');
INSERT INTO notas VALUES(1,1,'Nota de prueba 1','Esta es la nota 1','imagen/nota.png');
INSERT INTO notas VALUES(2,1,'Nota de prueba 2','Esta es la nota 2','imagen/nota2.png');
INSERT INTO notas VALUES(3,1,'Nota de prueba 3','Esta es la nota 3','imagen/nota.png');
INSERT INTO notas VALUES(4,1,'Nota de prueba 4','Esta es la nota 4','imagen/nota2.png');

 -- Modify initial value and increment
ALTER SEQUENCE notas_id_seq RESTART WITH 5;