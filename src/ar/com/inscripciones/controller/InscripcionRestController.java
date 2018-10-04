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
import ar.com.inscripciones.entities.Inscripcion;

@RestController
@RequestMapping(value = "/inscripcion")
public class InscripcionRestController {
	@Resource
	private DAO<Inscripcion> inscripcionDAO;

	@RequestMapping(method = RequestMethod.GET)
	public List<Inscripcion> getAll() {
		List<Inscripcion> inscripciones = inscripcionDAO.list();
		return inscripciones;
	}
	
	
	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Inscripcion save(@RequestBody Inscripcion a) {
		return inscripcionDAO.save(a);
	}
}
