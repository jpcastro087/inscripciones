package ar.com.inscripciones.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Asignatura;

@RestController
@RequestMapping(value = "/asignatura")
public class AsignaturaRestController {
	@Resource
	private DAO<Asignatura> asignaturaDao;

	@RequestMapping(method = RequestMethod.GET)
	public List<Asignatura> getAll() {
		List<Asignatura> asignaturas = asignaturaDao.list();
		return asignaturas;
	}
	
	
	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Asignatura save(@RequestBody Asignatura a) {
		return asignaturaDao.save(a);
	}
}
