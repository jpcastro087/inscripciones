package ar.com.inscripciones.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Alumno;

@RestController
@RequestMapping(value = "/alumno")
public class AlumnoRestController {
	
	@Resource
	private DAO<Alumno> alumnoDao;

	@RequestMapping(method = RequestMethod.GET)
	public List<Alumno> getAll() {
		List<Alumno> alumnos = alumnoDao.list();
		return alumnos;
	}
	
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Alumno getById(@PathVariable Long id) {
		Alumno alumno = alumnoDao.getById(id);
		return alumno;
	}
	
	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Alumno save(@RequestBody Alumno a) {
		return alumnoDao.save(a);
	}
	
	@RequestMapping(method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Alumno update(@RequestBody Alumno a) {
		return alumnoDao.update(a);
	}

}
