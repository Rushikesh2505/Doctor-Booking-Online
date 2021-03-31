<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header card-header">
	<h3>
		<fmt:message key="label.text123" />
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<div id="editLayerThicknessForm" class="modal-body card-body">

<c:choose>

		<c:when test="${bean.defaultStatus == false}">
			<c:set value="" var="defaultStatus"></c:set>
			<c:set value="" var="disabled"></c:set>

		</c:when>

		<c:when test="${bean.defaultStatus == true}">
			<c:set value="Checked" var="defaultStatus"></c:set>
			<c:set value="pointer-events: none;" var="disabled"></c:set>
		</c:when>

	</c:choose>
	<label><fmt:message key="label.text120" /> </label>
	<div>
		<input disabled style="" class="form-control" type="text"
			id="layerType" name="layerType" value="${bean.layerType}">
	</div>

	<label><fmt:message key="label.text119" />(Microns): </label>
	<div id="proEditLayerThickness" class="check">
		<input style="" onkeyup="checkEditLayerThicknessExist()"
			class="form-control valCheck" type="text" id="editLayerThickness"
			name="editLayerThickness" value="${bean.layerThickness}">
	</div>

	<label><fmt:message key="label.text121" /> : </label>
	<div class="check">
		<input style="" onkeyup="checkContactFANumber(this.id)"
			class="form-control valCheck" type="text" id="editLayerFactor"
			name="editLayerFactor" value="${bean.layerFactor}">
	</div>


	<div style="margin-top: 1.5em;">
		<input type="checkbox" id="editLayerFactorDefaultStatus"
			style="margin-right: 3%;${disabled}" onclick="editLayerThicknessDefaultStatus()"
			class="checkbox_check" ${defaultStatus}> <label>Set as Default </label>
	</div>


	<input type="hidden" id="layerThicknessId"
		value="${bean.layerThicknessId}" /> <input type="hidden"
		id="layerType" value="${bean.layerType}" /> <input type="hidden"
		id="status" value="${bean.status}" /> <input type="hidden"
		id="createdBy" value="${bean.createdBy}" /> <input type="hidden"
		id="createdDate" value="${bean.createdDate}" /> <input type="hidden"
		id="updatedBy" value="${bean.updatedBy}" /> <input type="hidden"
		id="updatedDate" value="${bean.updatedDate}" />
</div>


<div class="modal-footer card-footer">
	<button class="btn btn-color" onclick="editLayerThickness()">
		<fmt:message key="label.text6" />
	</button>
</div>