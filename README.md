# inscripciones

1. Esquema de base de datos

![alt text](https://github.com/jpcastro087/inscripciones/blob/master/DER.png)

<b>a. Cuáles serían los tipos de datos de cada campo de cada tabla?</b>

Dejo los tipos de datos definidos en el DER

<b>b. Realizarías algún cambio en el modelo? (justificar cualquiera sea la respuesta)</b>

Normalicé las tablas <b>docentes</b> y <b>asignaturas</b>, en la tabla <b>cursos</b> generé una clave compuesta con los ids <b>id_docente</b> y <b>id_asignatura</b> para así no poder ingresar un docente con las misma asignatura en el mismo curso, luego llevo esa llave compuesta a la tabla <b>inscripciones</b> dejando como clave primaria los campos <b>id_docente</b>, <b>id_asignatura</b>, <b>id_alumno</b> y <b>fechaInscripcion</b>

<b>c. Sugerirías realizar algo en la BD para mejorar la performance de las consultas sobre las tablas?</b>

Sugeriría agregar índices a los campos con claves foraneas y primary keys

<b>2. Proveer consultas para determinar:</b>

<b>a. Cursos a los que está inscripto y cursando un alumno dado en el ciclo lectivo
actual.</b>

select
concat(a.nombre, ' ', a.apellido) as Alumno,
asig.descripcion as Asignatura,
d.nombre         as Docente,
'Inscripto'      as Estado
from inscripciones i
inner join asignaturas asig on i.id_asignatura = asig.id
inner join alumnos a on i.id_alumno = a.id
inner join docentes d on i.id_docente = d.id
where i.estado = 1 and a.id = 1

<b>b. Alumnos inscriptos a una asignatura dada.</b>

select
concat(a.nombre, ' ', a.apellido) as Alumno,
asig.descripcion as Asignatura,
d.nombre         as Docente,
'Inscripto'      as Estado
from inscripciones i
inner join asignaturas asig on i.id_asignatura = asig.id
inner join alumnos a on i.id_alumno = a.id
inner join docentes d on i.id_docente = d.id
where i.estado = 1 and asig.id = 1

<b>c. Cursos a los que el alumno puede inscribirse en el ciclo lectivo actual.</b>

Ir al archivo <b>PCR_CURSOS_PERMITIDOS_CURSAR_ALUMNO.sql</b> en el codigo fuente

<b>d. Alumnos que recursen una materia</b>

Ir al archivo <b>PCR_ALUMNOS_RECURSANTES.sql</b> en el codigo fuente






