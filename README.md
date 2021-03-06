# inscripciones

1. Esquema de base de datos

![alt text](https://github.com/jpcastro087/inscripciones/blob/master/DER.png)

<b>A. Cuáles serían los tipos de datos de cada campo de cada tabla?</b>

Dejo los tipos de datos definidos en el DER

<b>B. Realizarías algún cambio en el modelo? (justificar cualquiera sea la respuesta)</b>

Normalicé las tablas <b>docentes</b> y <b>asignaturas</b>, en la tabla <b>cursos</b> generé una clave compuesta con los ids <b>id_docente</b> y <b>id_asignatura</b> para así no poder ingresar un docente con las misma asignatura en el mismo curso, luego llevo esa llave compuesta a la tabla <b>inscripciones</b> dejando como clave primaria los campos <b>id_docente</b>, <b>id_asignatura</b>, <b>id_alumno</b> y <b>fechaInscripcion</b>

<b>C. Sugerirías realizar algo en la BD para mejorar la performance de las consultas sobre las tablas?</b>

Sugeriría agregar índices a los campos con claves foraneas y primary keys



<br><br><br>



<b>2. Proveer consultas para determinar:</b>

<b>A. Cursos a los que está inscripto y cursando un alumno dado en el ciclo lectivo
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

<b>B. Alumnos inscriptos a una asignatura dada.</b>

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

<b>C. Cursos a los que el alumno puede inscribirse en el ciclo lectivo actual.</b>

Ir al archivo <b>PCR_CURSOS_PERMITIDOS_CURSAR_ALUMNO.sql</b> en el codigo fuente

<b>D. Alumnos que recursen una materia</b>

Ir al archivo <b>PCR_ALUMNOS_RECURSANTES.sql</b> en el codigo fuente

<br><br><br>


<b>3. Desarrollar una aplicación que:</b>

<b>A. Registre y edite alumnos</b>

El código fuente se encuentra en este repositorio y la aplicacion se puede probar desde el siguiente enlace:
<br>
http://jpcastro087.ddns.net:8080/Inscripciones-0.0.1-SNAPSHOT/altaAlumno


<br><br>

<b>Screenshot:</b>


![alt text](https://github.com/jpcastro087/inscripciones/blob/master/altaAlumno.png)



<b>B. Provea los siguientes reportes:
<br>i. Estado académico de un alumno dado (estado de materias cursadas,
materias no regularizadas y materias por cursar)
<br>ii. Para una asignatura dada, los alumnos inscriptos y el docente
correspondiente.</b>

No se pudo implementar por falta de tiempo

<b>C. Permita a un alumno inscribirse a una materia.</b>
<br>Están implementadas las llamadas rest<br>
http://localhost:8080/Inscripciones/user/{username}/{password}
<br>y<br>
http://localhost:8080/Inscripciones/curso/permitidoscursaralumno/{id}
<br><br>
la idea era ensamblar las llamadas para que el alumno pueda inscribirse via mobile ios/android nativo en una aplicación de prueba desarrollada con react-native en la página https://snack.expo.io, la implementacion de las llamadas se pueden ver en el paquete controllers. 





