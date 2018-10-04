package ar.com.inscripciones.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Alumno;

@Repository
public class AlumnoDAOImpl implements DAO<Alumno> {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Alumno save(Alumno a) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(a);
		tx.commit();
		session.close();
		return a;
	}

	@Override
	public List<Alumno> list() {
		Session session = this.sessionFactory.openSession();
		List<Alumno> alumnoList = session.createQuery("from Alumno").list();
		session.close();
		return alumnoList;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Alumno getById(Long id) {
		Session session = this.sessionFactory.openSession();
		Alumno alumno = (Alumno) session.get(Alumno.class, id);
		session.close();
		return alumno;
	}

	@Override
	public Alumno update(Alumno a) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(a);
		tx.commit();
		session.close();
		return a;
	}

}
