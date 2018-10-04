package ar.com.inscripciones.services;

import java.util.List;

import org.springframework.stereotype.Service;

import ar.com.inscripciones.entities.Person;


@Service
public interface PersonService {


	List<Person> getAll();

}
