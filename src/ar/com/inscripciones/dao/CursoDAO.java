package ar.com.inscripciones.dao;

import java.util.List;

import ar.com.inscripciones.entities.Curso;

public interface CursoDAO<T> extends DAO<Curso> {
	List<Curso> getCursosPermitidosByIdAlumno(Long idAlumno);
}
