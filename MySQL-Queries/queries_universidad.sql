SELECT apellido1, apellido2, nombre FROM  persona ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2, telefono FROM persona WHERE telefono IS NULL;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT nombre, apellido1, apellido2 FROM persona INNER JOIN profesor ON profesor.id_profesor = persona.id WHERE telefono IS NULL AND NIF LIKE '%K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM ((persona INNER JOIN profesor ON profesor.id_profesor = persona.id) INNER JOIN departamento ON departamento.id = profesor.id_departamento) ORDER BY apellido1, apellido2, persona.nombre;
SELECT asignatura.nombre, anyo_inicio YEAR, anyo_fin YEAR FROM (((asignatura INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id) INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar) INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno) WHERE nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM (((departamento INNER JOIN profesor ON  profesor.id_departamento = departamento.id) INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor) INNER JOIN grado ON grado.id = asignatura.id_grado) WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT nombre, apellido1, apellido2 FROM ((persona INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id) INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar) WHERE alumno_se_matricula_asignatura.id_curso_escolar = 5; 
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY departamento.nombre, apellido1, apellido2, persona.nombre;
SELECT persona.nombre, apellido1, apellido2 FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE departamento.id IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;
SELECT asignatura.id AS Asignatura, persona.nombre, apellido1, apellido2 FROM ((persona LEFT JOIN profesor ON profesor.id_profesor = persona.id) LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor) WHERE asignatura.id IS NULL;
SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_profesor IS NULL;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id IS NULL;
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno';
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT DISTINCT nombre, COUNT(*) AS numProfesores FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id ORDER BY numProfesores desc;
SELECT departamento.nombre, COUNT(*) AS numProfesores FROM ((persona INNER JOIN profesor ON profesor.id_profesor = persona.id) INNER JOIN departamento ON departamento.id = profesor.id_departamento);
SELECT departamento.nombre, COUNT(*) AS numProfesores FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id;
SELECT  grado.nombre, COUNT(DISTINCT asignatura.id_grado) FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id;
SELECT grado.nombre, COUNT(*) AS numAsignaturas FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id  GROUP BY grado.id HAVING numAsignaturas > 40;
SELECT grado.nombre, tipo, SUM(creditos) FROM asignatura INNER JOIN grado ON grado.id = asignatura.id_grado  GROUP BY asignatura.tipo, grado.id;
SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY id_curso_escolar;
SELECT profesor.id_profesor, persona.nombre, apellido1, apellido2, COUNT(asignatura.id) FROM ((persona INNER JOIN profesor ON profesor.id_profesor = persona.id) LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor) GROUP BY profesor.id_profesor;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS assignatures FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS assignatures FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id;
SELECT persona.* FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 0, 1;
SELECT persona.nombre, apellido1, apellido2, asignatura.nombre, departamento.nombre FROM (((persona INNER JOIN profesor ON profesor.id_profesor = persona.id) INNER JOIN departamento ON departamento.id = profesor.id_departamento) LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor) WHERE asignatura.id IS NULL;