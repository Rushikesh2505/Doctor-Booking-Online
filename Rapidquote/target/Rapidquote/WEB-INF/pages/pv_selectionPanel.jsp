<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h3 class="uploading">
	<fmt:message key="message.quoteDetails.text5" />
	<font color="red" style="font-weight: bolder;">*</font>
</h3>
<div>
	<div style="margin: 1%; margin-bottom: 5%;">
		<div class="radiobuttons-container">

			<c:forEach items="${processes}" var="process">

				<c:choose>
					<c:when test="${process.status == false}">
						<c:set var="disabled" value="isDisabled" />
					</c:when>

					<c:otherwise>
						<c:set var="disabled" value="pointer" />
					</c:otherwise>
				</c:choose>


				<input class="${disabled} process" type="radio"
					id="p${process.processId}" onchange="selectedProcess(this.id)"
					formula="${process.formula}" processStatus="${process.status}"
					processName="${process.processName}" name="process"
					processId="${process.processId}"
					processCode="${process.processCode}"
					minimumCost="${process.minimumCost}"
					minimumThickness="${process.minimumThickness}"
					infillFactor="${process.infillFactor}"
					layerThicknessFactor="${process.layerThicknessFactor}"
					maxBuildX="${process.maxBuildX}" maxBuildY="${process.maxBuildY}"
					maxBuildZ="${process.maxBuildZ}"><label style="margin-bottom: unset;" class="${disabled}">&nbsp&nbsp&nbsp&nbsp${process.processName}</label><br class="${disabled}">
			</c:forEach>

		</div>
	</div>
</div>

<h3 class="uploading">
	<fmt:message key="message.quoteDetails.text6" />
	<font color="red" style="font-weight: bolder;">*</font>
</h3>


<div id="materialPanel" class="materialPanel"
	style="border: 0px solid grey; margin: 5%">
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-6 col-6 dropdown">
			<button id="categoryt1btn" type="button"
				class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
				data-toggle="dropdown" disabled>
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
						onclick="materialDetails(this.id)">${mid.materialName}</a>
				</c:forEach>

			</div>
		</div>
		<div class="col-md-6 col-sm-6 col-xs-6 col-6 dropdown">
			<button id="categoryt2btn" type="button"
				class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
				data-toggle="dropdown" disabled>
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
						onclick="materialDetails(this.id)">${mid.materialName}</a>
				</c:forEach>
			</div>
		</div>
	</div>
</div>


<div class="">
								<span id="finishingId"> </span>
								<div class="row">
									<div class="col-md-6 col-sm-6 col-xs-6 col-6">
										<h3 class="uploading">Finishing</h3>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-6 col-6">
										<h3 class="uploading">Colors</h3>
									</div>
								</div>
								<div class="" style="border: 0px solid grey; margin: 3%">
									<div class="row">

										<div class="col-md-6 col-sm-6 col-xs-6 col-6 dropdown">
											<button id="finishingbtn" type="button"
												class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
												data-toggle="dropdown">Finishing</button>
											<div id="finishingdrp"
												class="col-md-10 col-sm-10 col-xs-10 col-10 dropdown-menu">
												<c:forEach items="${finishings}" var="finish"
													varStatus="status">
													<c:choose>
														<c:when test="${finish.status == false}">
															<c:set var="disabled" value="isDisabled" />
														</c:when>

														<c:otherwise>
															<c:set var="disabled" value="pointer" />
														</c:otherwise>
													</c:choose>
													<a id="finishingData${status.count}"
														class=" ${disabled} dropdown-item"
														finishingCode="${finish.finishingCode}"
														finishingId="${finish.finishingId}"
														fname="${finish.finishingName}"
														formula="${finish.formula}"
														onclick="selectFinishing(this.id)">${finish.finishingName}</a>
												</c:forEach>

											</div>
										</div>
									<div class="col-md-6 col-sm-6 col-xs-6 col-6 dropdown">
											<button id="colorbtn" type="button"
												class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
												data-toggle="dropdown">Colors</button>
											<div id="colordrp"
												class="col-md-10 col-sm-10 col-xs-10 col-10 dropdown-menu">
												<c:forEach items="${colors}" var="color" varStatus="status">
													<c:choose>
														<c:when test="${color.status == false}">
															<c:set var="disabled" value="isDisabled" />
														</c:when>

														<c:otherwise>
															<c:set var="disabled" value="pointer" />
														</c:otherwise>
													</c:choose>
													<a id="colorData${status.count}" class="dropdown-item"
														colorid="${color.colorId}"
														colorHexCode="${color.colorHexCode}"
														colorName="${color.colorName}"
														colorCode="${color.colorCode}"
														onclick="selectColor(this.id)">${color.colorName}&nbsp;&nbsp;&nbsp;<div
															class="colorBox"
															style="background-color: ${color.colorHexCode};"></div></a>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
										
										
<div class="">
	<span id="infillId"> </span>
	<div class="row">
		<div style="display: none;"
			class="infilldropdown col-md-6 col-sm-6 col-xs-6 col-6">
			<h3 class="uploading">Infills (%)</h3>
		</div>
		<div style="display: none;"
			class="layerdropdown col-md-6 col-sm-6 col-xs-6 col-6">
			<h3 class="uploading">Layer Thickness (&micro;m)</h3>
		</div>
	</div>

	<div class="" style="border: 0px solid grey; margin: 3%">

		<div class="row">

			<div style="display: none;"
				class="infilldropdown col-md-6 col-sm-6 col-xs-6 col-6 dropdown">
				<button id="infillbtn" type="button"
					class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
					data-toggle="dropdown">Infills</button>
				<div id="infilldrp"
					class="col-md-10 col-sm-10 col-xs-10 col-10 dropdown-menu">
					<c:forEach items="${infills}" var="infill" varStatus="status">
						<c:choose>
							<c:when test="${infill.status == false}">
								<c:set var="disabled" value="isDisabled" />
							</c:when>

							<c:otherwise>
								<c:set var="disabled" value="pointer" />
							</c:otherwise>
						</c:choose>
						<a id="infillData${status.count}"
							class=" ${disabled} dropdown-item"
							infillType="${infill.infillType}"
							infillPercentage="${infill.infillPercentage}"
							infillFactor="${infill.infillFactor}"
							infillId="${infill.infillId}" onclick="selectInfill(this.id)">${infill.infillType}
							- ${infill.infillPercentage}</a>
					</c:forEach>

				</div>
			</div>

			<div style="display: none;"
				class="col-md-6 col-sm-6 col-xs-6 col-6 layerdropdown dropdown">
				<button id="layerbtn" type="button"
					class="col-md-12 col-sm-12 col-xs-12 col-12 btn uploadbtn dropdown-toggle"
					data-toggle="dropdown">Layer Thickness</button>
				<div id="layerdrp"
					class="col-md-10 col-sm-10 col-xs-10 col-10 dropdown-menu">
					<c:forEach items="${layers}" var="layer" varStatus="status">
						<c:choose>
							<c:when test="${layer.status == false}">
								<c:set var="disabled" value="isDisabled" />
							</c:when>

							<c:otherwise>
								<c:set var="disabled" value="pointer" />
							</c:otherwise>
						</c:choose>
						<a id="layerData${status.count}"
							class=" ${disabled} dropdown-item" layerType="${layer.layerType}"
							layerThickness="${layer.layerThickness}"
							layerFactor="${layer.layerFactor}"
							layerThicknessId="${layer.layerThicknessId}"
							onclick="selectLayerThickness(this.id)">${layer.layerType} -
							${layer.layerThickness}</a>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</div>
<div class="">
	<h3 class="uploading">Notes:</h3>
	<div>
		<textarea id="notesDetails" onchange="addNotes(this)"
			style="width: -webkit-fill-available;">
							</textarea>

	</div>
</div>
										
										