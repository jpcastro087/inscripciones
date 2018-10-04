package ar.com.inscripciones.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Inscripcion;
@Repository
public class InscripcionDAOImpl implements DAO<Inscripcion> {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Inscripcion save(Inscripcion a) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(a);
		tx.commit();
		session.close();
		return a;
	}

	@Override
	public List<Inscripcion> list() {
		Session session = this.sessionFactory.openSession();
		List<Inscripcion> inscripcionList = session.createQuery("from Inscripcion").list();
		session.close();
		return inscripcionList;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Inscripcion getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inscripcion update(Inscripcion a) {
		// TODO Auto-generated method stub
		return null;
	}

}
