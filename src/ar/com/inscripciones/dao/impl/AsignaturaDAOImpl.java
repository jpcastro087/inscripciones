package ar.com.inscripciones.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Asignatura;
@Repository
public class AsignaturaDAOImpl implements DAO<Asignatura>{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Asignatura save(Asignatura a) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(a);
		tx.commit();
		session.close();
		return a;
	}

	@Override
	public List<Asignatura> list() {
		Session session = this.sessionFactory.openSession();
		List<Asignatura> AsignaturaList = session.createQuery("from Asignatura").list();
		session.close();
		return AsignaturaList;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Asignatura getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Asignatura update(Asignatura a) {
		// TODO Auto-generated method stub
		return null;
	}

}
