<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header card-header">
	<h3>
		<fmt:message key="message.text12" />
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<form id="addMaterialForm" class="modal-body card-body">
	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text13" /></label><font color="red"
				style="font-weight: bolder;">*</font> <br>
		</div>
		<input class="form-control addcheck" type="text" id="materialName"
			name="materialName" onkeyup="checkNotEmpty(this.id)" />
	</div>


	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text14" /></label> <br>
		</div>
		<input class="form-control" type="text" id="description"
			name="description" />
	</div>

	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text15" /></label><br>
		</div>
		<input style="padding: 0.2rem;" class="form-control" type="file"
			id="imageFile" name="imageFile" accept=".jpg,.jpeg,.png" />
	</div>

	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text16" />&nbsp</label> (g/cm<label
				style="font-size: smaller;">3</label>)<font color="red"
				style="font-weight: bolder;">*</font><br>
		</div>
		<input onkeyup="checkContactFMNumber(this.id)"
			class="form-control addcheck" type="text" id="density" name="density" />
	</div>

	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text17" />&nbsp</label> (Rate per gram)<font color="red"
				style="font-weight: bolder;">*</font><br>
		</div>
		<input onkeyup="checkContactFMNumber(this.id)"
			class="form-control addcheck" type="text" id="rate" name="rate" />
	</div>

	<div class="">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text18" /></label><font color="red"
				style="font-weight: bolder;">*</font><br>
		</div>
		<select class="form-control" id="mfgProcessId" name="mfgProcessId">
			<c:forEach items="${processes}" var="process">
				<option value="${process.processId}">${process.processName}</option>
			</c:forEach>
		</select>
	</div>
	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text19" /></label><font color="red"
				style="font-weight: bolder;">*</font><br>
		</div>
		<select class="form-control" id="categoryId" name="categoryId">
			<c:forEach items="${categories}" var="category">
				<option value="${category.categoryId}">${category.categoryName}</option>
			</c:forEach>
		</select>
	</div>
</form>

<div class="modal-footer card-footer">
	<button class="btn btn-color" onclick="addMaterial()">
		<fmt:message key="message.text6" />
	</button>
</div>