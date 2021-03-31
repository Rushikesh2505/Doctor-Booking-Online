package com.file.serviceImpl;

import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.file.beans.SupplierBean;
import com.file.dao.Dao;
import com.file.dao.GenericDao;
import com.file.entities.Supplier;
import com.file.service.SupplierService;

@Service
@Repository
public class SupplierServiceImpl implements SupplierService{

	@Autowired
	GenericDao genericdao;
	
	@Autowired
	Dao dao;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Supplier> getSupplierStatus() {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Supplier.class);
		List<Supplier> results = cr.list();

		session.close();
		System.out.println("List:" + results);
		return results;	}

	@Override
	public SupplierBean checkSupplier(String contactEmail) {
		Supplier supplier = dao.findSupplierByAccessName(contactEmail);
		SupplierBean supplierBean = new SupplierBean();
		try {
			BeanUtils.copyProperties(supplierBean, supplier);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return supplierBean;
	}
	
}
