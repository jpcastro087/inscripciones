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
import ar.com.inscripciones.entities.Docente;

@RestController
@RequestMapping(value = "/docente")
public class DocenteRestController {
	@Resource
	private DAO<Docente> docenteDao;

	@RequestMapping(method = RequestMethod.GET)
	public List<Docente> getAll() {
		List<Docente> docentes = docenteDao.list();
		return docentes;
	}
	
	
	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Docente save(@RequestBody Docente a) {
		return docenteDao.save(a);
	}
}
