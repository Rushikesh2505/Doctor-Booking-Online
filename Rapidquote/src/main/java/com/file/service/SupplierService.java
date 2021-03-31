package com.file.service;

import java.util.List;

import com.file.beans.SupplierBean;
import com.file.entities.Supplier;

public interface SupplierService {

	List<Supplier> getSupplierStatus();

	SupplierBean checkSupplier(String contactEmail);

}
