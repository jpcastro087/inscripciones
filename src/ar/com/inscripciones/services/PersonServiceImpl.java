package ar.com.inscripciones.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.com.inscripciones.dao.PersonDAO;
import ar.com.inscripciones.entities.Person;

@Service
public class PersonServiceImpl implements PersonService {
	
	
	@Override
	public List<Person> getAll() {
		PersonDAO personDAO = PersonDAO.getInstance();
		List<Person> persons = personDAO.getAll();
		return persons;
	}

}
