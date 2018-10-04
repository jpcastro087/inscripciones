package ar.com.inscripciones.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.com.inscripciones.dao.DAO;
import ar.com.inscripciones.entities.Docente;
@Repository
public class DocenteDAOImpl implements DAO<Docente> {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Docente save(Docente a) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(a);
		tx.commit();
		session.close();
		return a;
	}

	@Override
	public List<Docente> list() {
		Session session = this.sessionFactory.openSession();
		List<Docente> DocenteList = session.createQuery("from Docente").list();
		session.close();
		return DocenteList;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Docente getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Docente update(Docente a) {
		// TODO Auto-generated method stub
		return null;
	}

}
