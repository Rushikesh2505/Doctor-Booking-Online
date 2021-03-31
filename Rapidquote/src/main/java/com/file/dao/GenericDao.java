package com.file.dao;

import java.util.List;



public interface GenericDao<E> {

	public Long addEntity(E entity);
	
	public void updateEntity(E entity);
	
	public void deleteEntity(Long id, Class clazz); 
	
	public List<E> findAll(Class clazz);
	
	public E findEntityById(Class clazz, Long id);

	//E findMaxCountByColumn(Class clazz, String columnName);
	public E findMaxCountByColumn(Class clazz, String id);

	




	//public List<ShippingCost> findAll();



	
	
}

