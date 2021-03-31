package com.file.dao;

import com.file.entities.Supplier;

public interface Dao {

	/*
	 * List<Material> showMaterial();
	 * 
	 * List<MaterialProcess> updatedMaterialList(Long processId);
	 * 
	 * void updateMaterialStatus(String materialId, boolean status);
	 * 
	 * void updatedMaterialUnderProcessStatus(Long processId);
	 * 
	 * void updateColorStatus(Long colorId);
	 * 
	 * void updateFinishingStatus(Long finishingId);
	 * 
	 * MaterialProcess getMaterialById(Long materialId);
	 * 
	 * boolean isFinishingExists(String finishingName);
	 * 
	 * boolean isColorExists(String colorName);
	 * 
	 * boolean isMaterialExists(String materialName);
	 * 
	 * boolean isProcessExists(String processName);
	 * 
	 * List<Object> getOrders();
	 * 
	 * List<OrderItem> getOrderItems(Long orderId);
	 * 
	 * public Long findMaxRowByColumn();
	 * 
	 * InfillFactor getDefaultInfill();
	 * 
	 * boolean checkInfillDefaultStatus();
	 * 
	 * String findMaxCountByColumnInfill();
	 * 
	 * public void deleteInfill(Long infillId);
	 * 
	 * 
	 * List<InfillFactor> getActiveInfill();
	 * 
	 * void updateInfillStatus(String infillId, boolean status);
	 * 
	 * boolean isInfillExists(String infillType);
	 * 
	 * List<InfillFactor> findInfill();
	 * 
	 * void updateProcessStatus(String processId, boolean status);
	 * 
	 * List<MfgProcess> findAllProcess();
	 * 
	 * List<MaterialProcess> findMaterialByProcessId(long parseLong);
	 * 
	 * void deleteProcess(Long processId);
	 * 
	 * void deleteMaterialProcess(Long mpId);
	 * 
	 * List<LayerThicknessFactor> findLayerThickness();
	 * 
	 * String findMaxCountByColumnLayerThickness();
	 * 
	 * LayerThicknessFactor getDefaultLayerThickness();
	 * 
	 * void deleteLayerThickness(long parseLong);
	 * 
	 * boolean isLayerTypeExists(String layerType);
	 * 
	 * boolean isLayerThicknessExists(String layerThickness);
	 * 
	 * Boolean checkLayerThicknessDefaultStatus();
	 * 
	 * void deleteMaterial(Long deleteMaterial);
	 * 
	 * MaterialProcess getMaterialProcessByMaterialId(String materialId);
	 * 
	 * List<MaterialProcess> findMaterial();
	 * 
	 * List<Category> findCategories();
	 * 
	 * List<Finishing> findFinishing();
	 * 
	 * void deleteFinishing(Long finishingId);
	 * 
	 * List<Color> findColor();
	 * 
	 * void updateLayerThicknessStatus(String layerThicknessId, boolean status);
	 * 
	 * void deleteColor(long colorId);
	 * 
	 * List<MfgProcess> findProcess();
	 * 
	 *//**
		 * Find shipping cost by supplier id.
		 *
		 * @param mspid the mspid
		 * @return the list
		 *//*
			 * 
			 * List<ShippingCost> findShippingCostBy();
			 * 
			 * void deleteOrderAttachmentsCauseException(Long orderItemId);
			 * 
			 * List<OrderItem> deleteOrderItemsCauseException(Long orderId);
			 * 
			 * List<OrderAttachments> getOrderAttachments(Long orderItemId);
			 * 
			 * 
			 * 
			 * List<ShippingCost> findShippingCost();
			 * 
			 * List<Color> findColorStaus();
			 */
	Supplier findSupplierByAccessName(String contactEmail);


}
