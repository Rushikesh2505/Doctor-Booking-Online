package com.file.daoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.file.dao.GenericDao;




@Repository
public class GenericDaoImpl<E> implements GenericDao<E> {

	@Autowired
	private SessionFactory sessionFactory;
	
	private static final Logger logger = Logger.getLogger(GenericDaoImpl.class);

	@Override
	public Long addEntity(E entity) {
		Session session = sessionFactory.openSession();
		System.out.println("DAO :" + entity);
		Long id = (Long) session.save(entity);
		System.out.println("SAVED SUCCESSFULLY");
		session.close();
		return id;
	}

	@Override
	public void updateEntity(E entity) {
		Session session = sessionFactory.openSession();
		System.out.println("DAO :" + entity);
		session.update(entity);
		System.out.println("UPDATED SUCCESSFULLY");
		session.flush();
		session.close();
	}

	@Override
	public void deleteEntity(Long id, Class clazz) {
		//logger.debug("Entity to be deleted with id : " + id + "and Class : " + clazz);
		Session session = sessionFactory.openSession();
		Object object = session.load(clazz, id);
		session.delete(object);
		logger.info("OBJECT DELETED SUCESSFULLY");
		session.flush();
		session.close();
	}

	@Override
	public List<E> findAll(Class clazz) {
		Session session = sessionFactory.openSession();
		List<E> entities = (List<E>) session.createCriteria(clazz).list();
		System.out.println("entities");
		session.close();
		return entities;
	}
	
	
	@Override
	public E findEntityById(Class clazz, Long id) {
		Session session = sessionFactory.openSession();
		Criteria criteria = (Criteria) session.createCriteria(clazz).add(Restrictions.idEq(id));
		E entity = null;
		if (criteria.list().size() > 0) {
			entity = (E) criteria.list().get(0);
		}
		session.close();
		return entity;
	}
	@Override
	public E findMaxCountByColumn(Class clazz, String columnName) {
		E entity = null;
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(clazz).setProjection(Projections.max(columnName));
		entity = (E) criteria.uniqueResult();
		return (E) entity;  
	}

	
}