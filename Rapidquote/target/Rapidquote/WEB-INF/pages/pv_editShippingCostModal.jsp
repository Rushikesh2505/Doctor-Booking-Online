<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header card-header">
	<h3>
	

		 <fmt:message key="label.text118" /> 
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<div id="editShippingCostForm" class="modal-body card-body">

	<label style="margin-top: 1em;margin-bottom: unset;"> <fmt:message key="label.text114" /> (Kg) </label>
	<div class="check">
		<input style="" class="form-control" type="text"
			value="${bean.minWeight}" id="editMinWeight" disabled>
	</div>

	<label style="margin-top: 1em;margin-bottom: unset;"> <fmt:message key="label.text115" />  (Kg) </label>
	<div class="check">
		<input style="" class="form-control" type="text"
			value="${bean.maxWeight}" id="editMaxWeight" name="maxWeight"
			disabled>
	</div>

	<label style="margin-top: 1em;margin-bottom: unset;"><fmt:message key="label.text116" />&nbsp;(${currencyBean.currencyName}) </label>
	<div class="check">
		<input style="" onkeyup="checkContactFSNumber(this.id)" class="form-control valCheck" type="text" id="editCost"
			value="${bean.cost}" name="editCost">
	</div>


	<input type="hidden" id="shippingCostId" value="${bean.shippingCostId}" />
	<input type="hidden" id="createdBy" value="${bean.createdBy}" /> <input
		type="hidden" id="createdDate" value="${bean.createdDate}" /> 

</div>

<div class="modal-footer card-footer">
	<button class="btn btn-color" onclick="editShippingCost()">
		<fmt:message key="label.text6" /></button>
</div>