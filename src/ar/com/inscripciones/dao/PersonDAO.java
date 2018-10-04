package ar.com.inscripciones.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import ar.com.inscripciones.entities.Person;

public class PersonDAO{

	private static List<Person> persons;
	private static PersonDAO personDAO;
	private static Integer id;

	public static PersonDAO getInstance() {
		if (personDAO == null) {
			personDAO = new PersonDAO();
			persons = new ArrayList<Person>();
			id = 0;
		}
		return personDAO;
	}

	public static List<Person> getAll() {
		return persons;
	}

	public static Person savePerson(Person persona) {
		Person personResult = new Person();
		personResult.setNombre(persona.getNombre());
		personResult.setApellido(persona.getApellido());
		persons.add(personResult);
		return personResult;
	}

	public static void updatePerson(Person person) {
		Person personaM = searchPerson(id);
		personaM.setNombre(person.getNombre());
		personaM.setApellido(person.getApellido());
	}

	public static void deletePerson(Integer id) {

		Iterator<Person> itPerson = persons.iterator();

		while (itPerson.hasNext()) {
			if (itPerson.next().equals(id)) {
				itPerson.remove();
			}
		}

	}

	private static Person searchPerson(Integer id) {
		Person person = null;
		for (Person personaIt : persons) {
			if (personaIt.getId().equals(id)) {
				person = personaIt;
				break;
			}
		}
		return person;
	}

}
