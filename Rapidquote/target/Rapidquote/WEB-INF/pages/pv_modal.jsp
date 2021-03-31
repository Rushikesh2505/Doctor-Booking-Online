<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
	background-color: #f5f5f5;
}

::-webkit-scrollbar {
	width: 12px;
	background-color: #f5f5f5;
}

::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: #d62929;
}
</style>
<div>
	<label id="snackBar7" class="promptmessage"></label>
	<h3 class="uploading">
		<fmt:message key="message.quoteDetails.text5" />
	</h3>
</div>
<input type="hidden" id="divname" value="edit_quoteDataEdit" />
<div id="edit_quoteDataEdit" style="display: none;">
	<!-- 1 -->
	<input id="cartId" value="" />
	
	<!-- 2 -->
	<input id="edit_fileName" value="" />

	<!-- 3 -->
	<input id="edit_x" value="" />
	
	<!-- 4 -->
	<input id="edit_y" value="" />
	
	<!-- 5 -->
	<input id="edit_z" value="" />
	
	<!-- 6 -->
	<input id="edit_surfaceArea" value="" />
	
	<!-- 7 -->
	<input id="edit_actualVolume" value="" />
	
	<!-- 8 -->
	<input id="edit_processId" value="" />
	
	<!-- 9 -->
	<input id="edit_processName" value="" />
	
	<!-- 10 -->
	<input id="edit_finishingId" value="" />
	
	<!-- 11 -->
	<input id="edit_finishingName" value="" />
	
	<!-- 12 -->
	<input id="edit_colorId" value="" />
	
	<!-- 13 -->
	<input id="edit_colorName" value="" />
	
	<!-- 14 -->
	<input id="edit_materialId" value="" />
	
	<!-- 15 -->
	<input id="edit_materialName" value="" />
	
	<!-- 16 -->
	<input id="edit_materialDensity" value="" />
	
	<!-- 17 -->
	<input id="edit_materialRate" value="" />
	
	<!-- 18 -->
	<input id="edit_categoryId" value="" />
	
	<!-- 19 -->
	<input id="edit_categoryName" value="" />
	
	<!-- 20 -->
	<input id="edit_materialProcessId" value="" />
	
	<!-- 21 -->
	<input id="edit_unitCost" value="" />
	
	<!-- 22 -->
	<input id="edit_totalCost" value="" />
	
	<!-- 23 -->
	<input id="edit_capturePath" value="" />
	
	<!-- 24 -->
	<input id="edit_serverFileName" value="" />
	
	<!-- 25 -->
	<input id="edit_uploadedFileName" value="" />
	
	<!-- 26 -->
	<input id="edit_fileSize" value="" />
	
	<!-- 27 -->
	<input id="edit_formula" value="" />
	
	<!-- 28 -->
	<input id="saveDiv" value="" />
	
	<!-- 29 -->
	<input id="updateDiv" value="" />
	
	<!-- 30 -->
	<input id="edit_qty" value="" />
	
</div>

<div>
	<div style="margin-bottom: 3%;">
		<div class="radiobuttons-container">
			<c:forEach items="${processes}" var="process" varStatus="status">
				<c:choose>
					<c:when test="${process.status == false}">
						<c:set var="disabled" value="isDisabled" />
					</c:when>

					<c:otherwise>
						<c:set var="disabled" value="pointer" />
					</c:otherwise>
				</c:choose>
				<input type="radio" id="p${process.processId}"
					onchange="edit_selectedProcess(this.id)"
					class="${ disabled } process" name="process"
					processName="${process.processName}" 
					formula ="${process.formula}" 
					processCode="${process.processCode}"
	                minimumCost="${process.minimumCost}"
					minimumThickness="${process.minimumThickness}"
					infillFactor="${process.infillFactor}"
					layerThicknessFactor="${process.layerThicknessFactor}"
					maxBuildX="${process.maxBuildX}"
					maxBuildY="${process.maxBuildY}"
					maxBuildZ="${process.maxBuildZ}"
					processId="${process.processId}"><label style="margin-bottom: unset;" class="${disabled}">&nbsp&nbsp&nbsp&nbsp${process.processName}</label><br class="${disabled}">
			</c:forEach>
		</div>
	</div>
	<div>
		<span><h3 class="uploading2">
				<fmt:message key="message.quoteDetails.text6" />
			</h3> <label id="editMaterial">(Selected Material : )</label></span>
	</div>
	<div class="materialPanel" style="border: 0px solid grey; margin: 2%">
		<div class="row">
			<div class="col-md-6 dropdown">
				<button onclick="trigDropdown1()" id="categoryt1btn" type="button"
					class="col-md-12 btn uploadbtn dropdown-toggle"
					data-toggle="dropdown" disabled>
					<fmt:message key="message.quoteDetails.text7" />
				</button>
				<div id="categoryt1drp" class="col-md-10 dropdown-menu">
					<c:forEach items="${category1}" var="mid" varStatus="status">
						<c:choose>
							<c:when test="${mid.status == false}">
								<c:set var="disabled" value="isDisabled" />
							</c:when>

							<c:otherwise>
								<c:set var="disabled" value="pointer" />
							</c:otherwise>
						</c:choose>
						<a id="materialCat1Data${status.count}"
							class="dropdown-item ${disabled} " href="#"
							materialId="${mid.materialId}" materialName="${mid.materialName}"
							description="${mid.description}" image="${mid.imageFile}"
							density="${mid.density}" rate="${mid.rate}"
							categoryId="${mid.categoryId}" categoryName="${mid.categoryName}"
							materialProcessId="${mid.materialProcessId}"
							materialCode="${mid.materialCode}"
							onclick="edit_materialDetails(this.id)">${mid.materialName}</a>
					</c:forEach>

				</div>
			</div>
			<div class="col-md-6 dropdown">
				<button onclick="trigDropdown2()" id="categoryt2btn" type="button"
					class="col-md-12 btn uploadbtn dropdown-toggle"
					data-toggle="dropdown" disabled>
					<fmt:message key="message.quoteDetails.text8" />
				</button>
				<div id="categoryt2drp" class="col-md-10 dropdown-menu">
					<c:forEach items="${category2}" var="mid">
						<c:choose>
							<c:when test="${mid.status == false}">
								<c:set var="disabled" value="isDisabled" />
							</c:when>

							<c:otherwise>
								<c:set var="disabled" value="pointer" />
							</c:otherwise>
						</c:choose>
						<a id="materialCat2Data${status.count}" class="dropdown-item ${disabled}"
							href="#" materialId="${mid.materialId}"
							materialName="${mid.materialName}"
							description="${mid.description}" image="${mid.image}"
							density="${mid.density}" rate="${mid.rate}"
							categoryId="${mid.categoryId}" categoryName="${mid.categoryName}"
							materialProcessId="${mid.materialProcessId}"
							materialCode="${mid.materialCode}"
							onclick="edit_materialDetails(this.id)">${mid.materialName}</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="">
		<span id="finishingId"> </span>
		<h3 class="uploading">
			<fmt:message key="message.quoteDetails.text9" />
		</h3>
		<div class="finishing-container " style="height: auto;">
			<input type="radio" id="none" finishingCode="" fname=""
				finishingId="" name="finishing"
				onclick="edit_selectFinishing(this.id)" />&nbsp&nbsp&nbspNone<br>
			<c:forEach items="${finishings}" var="finish">
				<c:choose>
					<c:when test="${finish.status == false}">
						<c:set var="disabled" value="isDisabled" />
					</c:when>

					<c:otherwise>
						<c:set var="disabled" value="pointer" />
					</c:otherwise>
				</c:choose>
				<input class=" ${disabled} finishing"
					id="finishing${finish.finishingId}" type="radio"
					fname="${finish.finishingName}" finishingId="${finish.finishingId}"
					name="finishing" onclick="edit_selectFinishing(this.id)"
					finishingCode="${finish.finishingCode}"
					value="${finish.finishingId}" /><label style="margin-bottom: unset;" class="${disabled}">&nbsp&nbsp&nbsp&nbsp${finish.finishingName}</label><br class="${disabled}">
			</c:forEach>
		</div>
	</div>
	<div class="">
		<h3 class="uploading">
			<fmt:message key="message.quoteDetails.text10" />
		</h3>
		<div class="colorbox-container" style="margin-top: 0; height: auto;">
			<c:forEach items="${colors}" var="color">
				<c:choose>
					<c:when test="${color.status == false}">
						<c:set var="disabled" value="isDisabled" />
					</c:when>

					<c:otherwise>
						<c:set var="disabled" value="pointer" />
					</c:otherwise>
				</c:choose>
				<div id="color${color.colorId}" class="${disabled} dot"
					colorid="${color.colorId}" colorHexCode="${color.colorHexCode}"
					colorName="${color.colorName}"
					style="background-color:${color.colorHexCode}"
					colorCode="${color.colorCode}" onclick="edit_selectColor(this.id)"></div>
			</c:forEach>

		</div>
	</div>
	<div>
		<button class="btn btn-danger" onclick="updateQuote()">
			<fmt:message key="message.modal.text8" />
		</button>
	</div>
</div>