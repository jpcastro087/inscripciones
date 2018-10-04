# inscripciones

1. Esquema de base de datos

![alt text](https://github.com/jpcastro087/inscripciones/blob/master/DER.png)

a. Cuáles serían los tipos de datos de cada campo de cada tabla?

Les dejo los tipos de datos definidos en el DER

b. Realizarías algún cambio en el modelo? (justificar cualquiera sea la respuesta)

Normalicé las tablas <b>docentes</b> y <b>asignaturas</b>, y en la tabla <b>cursos</b> generé una clave compuesta con los ids <b>id_docente</b> y <b>id_asignatura</b> para que así no se puedan ingresar un docente con las misma asignatura en el mismo curso, luego lleve esa llave compuesta a la tabla inscripciones dejando como clave compuesta los campos <b>id_docente</b>, <b>id_asignatura</b>, <b>id_alumno</b> y <b>fechaInscripcion</b>
