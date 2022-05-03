CREATE TABLE IF NOT EXISTS alumno(
    id int(11)NOT NULL AUTO_INCREMENT,
    nombres varchar(100) NOT NULL,
    apellidos varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    pais varchar(100) DEFAULT 'Perú',
    nota int(11) DEFAULT '0',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS alumno_nota(
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    alumno_id int(11) NOT NULL,
    curso VARCHAR(100) NOT NULL,
    nota int(11) DEFAULT 0,
    FOREIGN KEY (alumno_id) REFERENCES alumno(id)
);

select * from alumno;

--poblando tabla alumno_notas
truncate table alumno_nota;

insert into alumno_nota(alumno_id,curso,nota)
values 
(1,'HTML Y CSS',13),
(1,'JAVASCRIPT',16),
(1,'REACT',18),
(1,'PYTHON',20),
(1,'MYSQL',11),
(2,'HTML Y CSS',20),
(2,'JAVASCRIPT',20),
(2,'REACT',19),
(2,'PYTHON',20),
(2,'MYSQL',18),
(3,'HTML Y CSS',11),
(3,'JAVASCRIPT',10),
(3,'REACT',9),
(3,'PYTHON',7),
(3,'MYSQL',11);


select * from alumno_nota;

select alumno.nombres,alumno_nota.curso,alumno_nota.nota
from alumno 
INNER JOIN alumno_nota ON alumno.id = alumno_nota.alumno_id;

select a.nombres,n.curso,n.nota
from alumno a
LEFT JOIN alumno_nota n ON a.id = n.alumno_id;

select a.nombres,n.curso,n.nota
from alumno a
RIGHT JOIN alumno_nota n ON a.id = n.alumno_id;



