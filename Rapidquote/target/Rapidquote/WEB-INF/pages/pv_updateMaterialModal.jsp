
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-6 col-sm-6 col-xs-6 col-6 dropdown">
		<button id="categoryt1btn" type="button" onclick="trigDropdown1()"
			class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
			data-toggle="dropdown">
			<fmt:message key="message.quoteDetails.text7" />
		</button>
		<div id="categoryt1drp" 
			class="col-md-10 col-sm-10 col-xs-10 col-10 dropdown-menu">
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
					class="${disabled} dropdown-item" href="#"
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
	<div class="col-md-6 col-sm-6 col-xs-6 col-6 dropdown"> 
		<button id="categoryt2btn" type="button" onclick="trigDropdown2()"
			class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
			data-toggle="dropdown">
			<fmt:message key="message.quoteDetails.text8" />
		</button>
		<div id="categoryt2drp"
			class="col-md-10 col-sm-10 col-xs-10 col-10 dropdown-menu">
			<c:forEach items="${category2}" var="mid">
				<c:choose>
					<c:when test="${mid.status == false}">
						<c:set var="disabled" value="isDisabled" />
					</c:when>

					<c:otherwise>
						<c:set var="disabled" value="pointer" />
					</c:otherwise>
				</c:choose>
				<a id="materialCat2Data${status.count}"
					class="${disabled} dropdown-item" href="#"
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
</div>