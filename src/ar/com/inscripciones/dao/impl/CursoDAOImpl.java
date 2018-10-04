package ar.com.inscripciones.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Curso;
@Repository
public class CursoDAOImpl implements DAO<Curso>{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Curso save(Curso a) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(a);
		tx.commit();
		session.close();
		return a;
	}

	@Override
	public List<Curso> list() {
		Session session = this.sessionFactory.openSession();
		List<Curso> CursoList = session.createQuery("from Curso").list();
		session.close();
		return CursoList;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Curso getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Curso update(Curso a) {
		// TODO Auto-generated method stub
		return null;
	}

}
