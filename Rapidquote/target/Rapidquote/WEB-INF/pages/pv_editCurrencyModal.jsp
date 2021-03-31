<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><div
	class="modal-header card-header">
	<h3>
		Edit Currency
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<div id="editCurrencyForm" class="modal-body card-body">

<input type="hidden" value="${list.currencyId}" id="editCurrencyId">
<input type="hidden" value="${list.createdDate}" id="editCurrencyCreated">
<input type="hidden" value="${list.createdBy}" id="editCurrencyBy">
<input type="hidden" value="${list.status}" id="editStatus">
	<label><fmt:message key="label.text32" /> : </label>
	<div class="form-editCountryName">
		<%-- input style="" onkeyup="checkEditcountryName()" class="form-control addcheck" type="text"
			value="${list.countryName}" id="editCountryName" name="editCountryName"> --%>
	<select onkeyup="checkEditCurrencyName()" class="form-control" id="editcurrencySelect">
								<option value="${list.currencyName}">${list.countryName}</option>
								<option value="USD">United States Dollars</option>
								<option value="GBP">United Kingdom Pounds</option>
								<option value="AUD">Australia Dollars</option>
								<option value="CAD">Canada Dollars</option>
								<option value="CNY">China Yuan Renmimbi</option>
								<!-- <option value="FRF">France Francs</option>
								<option value="DEM">Germany Deutsche Marks</option> -->
								<option value="HKD">Hong Kong Dollars</option>
								<option value="INR">India Rupees</option>
								<option value="JPY">Japan Yen</option>
								<option value="SGD">Singapore Dollars</option>
								<option value="EUR">Euro</option>
								<!--<option value="VND">Vietnam Dong</option>-->
							</select>		
			
	</div>


	<%-- <label><fmt:message key="label.text109" /> : </label>
	<div class="form-editCurrencyName">
		<input style="" onkeyup="checkEditCurrencyName()"  value="${list.currencyName}" class="form-control addcheck"
			type="text" id="editCurrencyName" name="editCurrencyName">
	</div>


 --%>
	<div class="modal-footer card-footer">
		<button class="btn btn-color" onclick="editCurrency()">
			<fmt:message key="label.text6" />
		</button>
	</div>
</div>