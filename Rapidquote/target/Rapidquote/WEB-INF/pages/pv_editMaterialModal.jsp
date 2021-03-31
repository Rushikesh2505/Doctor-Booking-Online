<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header card-header">
	<h3>
		<fmt:message key="message.text20" />
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal content-->
<div id="editMaterialForm" class="modal-body card-body">
	<div class=" ">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text13" /></label><font color="red" style="font-weight: bolder;">*</font> <br>
		</div>
		<input class="form-control" type="text" value="${bean.materialName}"
			id="materialName" name="materialName" />
	</div>

<div class=" ">
	<div class="input-group-prepend">
		<label style="margin-bottom: 0rem;"><fmt:message
				key="message.text14" /></label><br>
	</div>
	<input class="form-control" type="text" id="description"
		value="${bean.description}" name="description" />

</div>
<div class=" ">
	<div class="input-group-prepend">
		<label style="margin-bottom: 0rem;"><fmt:message
				key="message.text15" /></label> <br>
	</div>
	<input style="padding: 0.2rem;" class="form-control" type="file"
		onchange="uploadImageCheck()" id="edit_image" name="imageFile"
		newimagepath="${bean.imageFile}" imgpath="${bean.imageFile}"
		accept=".jpg,.jpeg,.png" />
</div>

<div class=" ">
	<div class="input-group-prepend">
		<label><fmt:message key="message.text16" />&nbsp</label>(g/cm<label style="font-size: smaller;">3</label>)<font color="red" style="font-weight: bolder;">*</font>
		<br>
	</div>
	<input  onkeyup="checkContactFNumber(this.id)" value="${bean.density}" class="form-control" type="text"
		id="density" name="density" />
</div>

	<div class="">
		<div class="input-group-prepend">
			<label style="margin-bottom: 0rem;"><fmt:message
					key="message.text17" />&nbsp</label>(Rate per gram)<font color="red" style="font-weight: bolder;">*</font> <br>
		</div>
		<input onkeyup="checkContactFMNumber(this.id)" value="${bean.rate}" class="form-control" type="text" id="rate"
			name="rate" />

		<div class="">
			<div class="input-group-prepend">
				<label style="margin-bottom: 0rem;"><fmt:message
						key="message.text18" /></label><font color="red" style="font-weight: bolder;">*</font>  <br>
			</div>
			<select value="${bean.mfgProcessName}" class="form-control"
				id="mfgProcessId" name="mfgProcessId">
				<c:forEach items="${processes}" var="process">
					<c:choose>
						<c:when test="${bean.mfgProcessName == process.processName}">
							<c:set var="selected" value="selected='selected'" />
						</c:when>
						<c:otherwise>
							<c:set var="selected" value="" />
						</c:otherwise>
					</c:choose>
					<option ${selected} value="${process.processId}">${process.processName}</option>
				</c:forEach>
			</select>
		</div>

		<div class="">
			<div class="input-group-prepend">
				<label style="margin-bottom: 0rem;"><fmt:message
						key="message.text19" /></label><font color="red" style="font-weight: bolder;">*</font>  <br>
			</div>
			<select class="form-control" id="categoryId" name="categoryId">
				<c:forEach items="${categories}" var="category">
					<c:choose>
						<c:when test="${bean.categoryName == category.categoryName}">
							<c:set var="selected" value="selected='selected'" />
						</c:when>

						<c:otherwise>
							<c:set var="selected" value="" />
						</c:otherwise>
					</c:choose>
					<option ${selected} value="${category.categoryId}">${category.categoryName}</option>
				</c:forEach>
			</select>
		</div>

		<input type="hidden" id="processUpdate" pid="${ bean.mfgProcessId }"pmane="${ bean.mfgProcessName }" /> 
			<input type="hidden" id="status"value="${ bean.status }" /> 
			<input type="hidden" id="materialId"value="${ bean.materialId }" />
			<input type="hidden" id="materialCode" value="${ bean.materialCode }" />
			<input type="hidden" id="createdBy" value="${ bean.createdBy }" />
		<input type="hidden" id="createdDate" value="${ bean.createdDate }" />
		<input type="hidden" id="updatedBy" value="${ bean.updatedBy }" />
		<input type="hidden" id="updatedDate" value="${ bean.updatedDate }" />
</div>
	</div>
	<div class="modal-footer card-footer">
		<button class="btn btn-color" onclick="check()">
			<fmt:message key="message.text21" />
		</button>
	</div>