<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header card-header">
	<h3>
		<fmt:message key="label.text129" />
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<div id="editInfillForm" class="modal-body card-body">

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
	<label><fmt:message key="label.text126" /> </label>
	<div class="check">
		<input disabled class="form-control valCheck" type="text"
			id="infillType" name="infillType" value="${bean.infillType}">
	</div>

	<label> <fmt:message key="label.text127" /> :
	</label>
	<div id="divEditInfillPercentage" class="check">
		<input style="" onkeyup="checkEditInfillPercentageExist()"
			class="form-control valCheck" type="text" id="editInfillPercentage"
			name="editInfillPercentage" value="${bean.infillPercentage}">
	</div>

	<label> <fmt:message key="label.text128" /> :
	</label>
	<div class="check">
		<input style="" onkeyup="checkNotZero(this.id)"
			class="form-control valCheck" type="text" id="editInfillFactor"
			name="editInfillFactor" value="${bean.infillFactor}">
	</div>

	<div style="margin-top: 1.5em;">
		<input type="checkbox" id="editInfillDefaultStatus"
			style="margin-right: 3%;${disabled}" onclick="checkEditInfillDefaultStatus()"
			class="checkbox_check" ${defaultStatus}> <label>Set as Default </label>
	</div>



	<input type="hidden" id="infillfactorId" value="${bean.infillId}" /> <input
		type="hidden" id="infillType" value="${bean.infillType}" /> <input
		type="hidden" id="status" value="${bean.status}" /> <input
		type="hidden" id="createdBy" value="${bean.createdBy}" /> <input
		type="hidden" id="createdDate" value="${bean.createdDate}" /> <input
		type="hidden" id="updatedBy" value="${bean.updatedBy}" /> <input
		type="hidden" id="updatedDate" value="${bean.updatedDate}" />
</div>


<div class="modal-footer card-footer">
	<button class="btn btn-color" onclick="editInfill()">
		<fmt:message key="label.text6" />
	</button>
</div>