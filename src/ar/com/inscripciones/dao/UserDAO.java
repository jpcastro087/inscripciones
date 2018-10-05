package ar.com.inscripciones.dao;

import ar.com.inscripciones.entities.User;

public interface UserDAO<T> extends DAO<User>{

	Long checkUserAndPassword(String username, String password);
	
	
}
