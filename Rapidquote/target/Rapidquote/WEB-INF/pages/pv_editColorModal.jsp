<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header card-header">
	<h3>Edit Color</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<div id="editColorForm" class="modal-body card-body">
	<label><fmt:message key="label.text47" /> </label>
	<div id="colDiv">
		<input disabled style="" onkeyup="checkColor()" class="form-control"
			type="text" id="colorName" name="colorName"
			value="${color.colorName}">
	</div>

	<label><fmt:message key="label.text48" /> : </label>
	<div id="">
		<input style="" class="form-control" type="color" id="colorHexCode"
			name="colorHexCode" value="${color.colorHexCode}">
	</div>
	<input type="hidden" id="colorId" value="${color.colorId}" />
<input type="hidden" id="colorCode" value="${color.colorCode}" />
<input type="hidden" id="status" value="${color.status}" />
<input type="hidden" id="createdBy" value="${color.createdBy}" />
<input type="hidden" id="createdDate" value="${color.createdDate}" />
<input type="hidden" id="updatedBy" value="${color.updatedBy}" />
<input type="hidden" id="updatedDate" value="${color.updatedDate}" />
</div>


<div class="modal-footer card-footer">
	<button class="btn btn-color" onclick="editColor()">
		<fmt:message key="label.text6" />
	</button>
</div>