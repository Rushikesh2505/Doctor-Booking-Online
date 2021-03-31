<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header card-header">
	<h3>

		<fmt:message key="label.text117" />
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>


<div id="shippingCostForm" class="modal-body card-body">

	<label style="margin-top: 1em;margin-bottom: unset;"><fmt:message key="label.text114" /> (Kg)</label>
	<div>
		<input style="" class="form-control valCheck" type="text"
			value="${weight}" id="minWeight" disabled>
	</div>

	<label style="margin-top: 1em;margin-bottom: unset;"> <fmt:message key="label.text115" /> (Kg)
	</label>
	<div class="check">
		<input style="" onkeyup="checkMaxWeight(this.id)"
			class="form-control valCheck" type="text" id="maxWeight"
			name="maxWeight">
	</div>

	<label style="margin-top: 1em;margin-bottom: unset;"> <fmt:message key="label.text116" />&nbsp;(${currencyBean.currencyName})
	</label>
	<div class="check">
		<input style="" onkeyup="checkContactFSNumber(this.id)"
			class="form-control valCheck" type="text" id="cost" name="cost">
	</div>


</div>

<div class="modal-footer card-footer">
	<button class="btn btn-color" onclick="addShippingCost(this)">
		<fmt:message key="label.text6" />
	</button>
</div>