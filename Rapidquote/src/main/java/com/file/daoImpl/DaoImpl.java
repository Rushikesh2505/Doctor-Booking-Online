package com.file.daoImpl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.file.dao.Dao;
import com.file.dao.GenericDao;
import com.file.entities.Supplier;

@Repository
public class DaoImpl implements Dao {

	
	@Autowired
	GenericDao genericDao;

	@Autowired
	private SessionFactory sessionFactory;



	@Override
	public Supplier findSupplierByAccessName(String contactEmail) {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Supplier.class);
		cr.add(Restrictions.eq("contactEmail", contactEmail));
		Supplier supplier = (Supplier) cr.uniqueResult();
		return supplier;
	}

	


}
	
	

