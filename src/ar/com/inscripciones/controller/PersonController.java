package ar.com.inscripciones.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ar.com.inscripciones.entities.Person;
import ar.com.inscripciones.services.PersonService;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;

	@RequestMapping(value = "*", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/showPersonsJSON", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Person> showPersonsJSON() {
		return personService.getAll();
	}

	@RequestMapping(value = "/showPersons", method = RequestMethod.GET)
	public ModelAndView showPersons() {
		List<Person> persons = personService.getAll();
		return new ModelAndView("showPersons", "persons", persons);
	}
	
	@RequestMapping(value = "/altaAlumno", method = RequestMethod.GET)
	public ModelAndView altaAlumno() {
		return new ModelAndView("altaAlumno");
	}
	



}