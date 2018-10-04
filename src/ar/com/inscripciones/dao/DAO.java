package ar.com.inscripciones.dao;

import java.util.List;

public interface DAO<T> {
	
	T save(T a);
	List<T> list();
	T getById(Long id);
	T update(T a);

}
