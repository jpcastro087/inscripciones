package ar.com.inscripciones.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ar.com.inscripciones.dao.CursoDAO;
import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Curso;

@RestController
@RequestMapping(value = "/curso")
public class CursoRestController {
	@Resource
	private CursoDAO<Curso> cursoDao;

	@RequestMapping(method = RequestMethod.GET)
	public List<Curso> getAll() {
		List<Curso> cursos = cursoDao.list();
		return cursos;
	}
	
	@RequestMapping(value="/permitidoscursaralumno/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Curso> getCursosPermitidosCursarAlumno(@PathVariable Long id){
		return cursoDao.getCursosPermitidosByIdAlumno(id);
	}
	
	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Curso save(@RequestBody Curso a) {
		return cursoDao.save(a);
	}
}
