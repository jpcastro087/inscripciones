package ar.com.inscripciones.controller;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ar.com.inscripciones.dao.UserDAO;
import ar.com.inscripciones.entities.User;

@RestController
@RequestMapping(value = "/user")
public class UserRestController {
	@Resource
	private UserDAO<User> userDao;
	
	@RequestMapping(value="/{username}/{password}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Long getUserByUsernamePassword(@PathVariable("username") String username, @PathVariable("password") String password) {
		Long id =  userDao.checkUserAndPassword(username,password);
		return id;
	}
}
