DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS equipos CASCADE;
DROP TABLE IF EXISTS tipos_in CASCADE;
DROP TABLE IF EXISTS interfaces CASCADE;
DROP TABLE IF EXISTS direcciones_IP CASCADE;

CREATE TABLE usuarios (
  id_usuario varchar(10) NOT NULL,
  password varchar(15) NOT NULL,
  tipo_usu integer NOT NULL,
  PRIMARY KEY(id_usuario)
);

CREATE TABLE equipos (
  id_eq varchar(30) NOT NULL,
  id_usuario varchar(10),
  PRIMARY KEY(id_eq),
  FOREIGN KEY(id_usuario)
    REFERENCES usuarios(id_usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);    

CREATE TABLE tipos_in (
  id_ti integer NOT NULL,
  des varchar(15) NOT NULL,
  PRIMARY KEY(id_ti)
);

CREATE TABLE interfaces (
  id_eq varchar(30) NOT NULL,
  num_in integer NOT NULL,
  id_ti integer NOT NULL,
  PRIMARY KEY(id_eq,num_in),
  FOREIGN KEY(id_eq)
    REFERENCES equipos(id_eq)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_ti)
    REFERENCES tipos_in(id_ti)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE direcciones_IP (
  ip varchar(15) NOT NULL,
  masc integer NOT NULL,
  ip_gw varchar(15) NOT NULL,
  id_eq varchar(30) NOT NULL,
  num_in integer NOT NULL,
  PRIMARY KEY(ip),
  FOREIGN KEY(id_eq,num_in)
    REFERENCES interfaces(id_eq,num_in)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

COPY usuarios (id_usuario, password, tipo_usu) FROM stdin;
admin	1234aaAA	0
c1	1234aaAA	1
c2	1234aaAA	1
c3	1234aaAA	1
\.

COPY equipos (id_eq, id_usuario) FROM stdin;
e1	c1
e2	c1
e3	c2
e4	c2
e5	c3
e6	c3
e91	admin
\.

COPY tipos_in (id_ti, des) FROM stdin;
1	ethernet
2	wifi
\.

COPY interfaces (id_eq,num_in,id_ti) FROM stdin;
e1	0	1
e1	1	1
e2	0	1
e2	1	2
e2	3	2
e3	0	1
e3	1	2
e4	0	2
e4	1	2
e5	0	1
e5	1	2
e6	0	2
e6	1	2
e91	0	2
e91	1	2
\.

COPY direcciones_IP (ip, masc, ip_gw, id_eq, num_in) FROM stdin;
10.1.1.10	8	10.1.1.1	e1	0
10.1.1.11	8	10.1.1.1	e1	1
10.1.2.13	8	10.1.1.1	e2	3
10.1.3.10	8	10.1.3.1	e3	0
10.1.3.11	8	10.1.3.1	e3	1
\.

select * from usuarios;
select * from equipos;
select * from tipos_in;
select * from interfaces;
select * from direcciones_IP;
