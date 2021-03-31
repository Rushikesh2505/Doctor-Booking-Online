<jsp:include page="links.jsp" />
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
<body>

	<div class="section1">
		<%@ include file="header3.jsp"%>
	</div>


	<!-- HEADER -->
	<div class="section1">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
			<div class="row" style="margin-right: 1%;">
				<div class="col-md-10 col-xs-10 col-sm-10 col-lg-10 col-7">
					<h3>
						<Strong><fmt:message key="message.quoteDetails.text1" /></Strong>
					</h3>
				</div>

				<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 col-5"
					style="margin-bottom: 0.5%;">
					<button class="btn btn-danger addToCartButton2"
						style="max-width: 130px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; float: right;"
						onclick="addToCart()">
						<fmt:message key="message.quoteDetails.text2" />
					</button>
				</div>
			</div>
		</div>
	</div>

	<!--  MAIN PANEL-->
	<div class="section1">
		<!-- <div class="materialgrid_bg" style="height: 572px;"></div> -->
		<div class="row filerow2">

			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12">
				<div>
					<h3 class="uploading" id="uploadId">
						<fmt:message key="message.quoteDetails.text3" />
						<span style="display: none;" class="pull-right" id="fileCountnew">2
						</span>
					</h3>
				</div>
				<div id="UploadBoxScroll1 style-2"
					style="max-height: 450px; overflow-x: hidden; overflow-y: auto;">
					<div class="filesData">
						<table class="template-download" id="fileId">
							<tbody class="tbody">
								<c:forEach items="${fileData}" var="filedata" varStatus="status">
									<tr class="uploading_block pointer"
										id="uploading_block${status.index}" x="${filedata.x}"
										y="${filedata.y}" z="${filedata.z}"
										fileName="${filedata.fileName}"
										surfaceArea="${filedata.surfaceArea}"
										actualVolume="${filedata.actualVolume}"
										capturePath="${filedata.capturePath}"
										serverFileName="${filedata.serverFileName}"
										uploadedFileName="${filedata.uploadedFileName}"
										fileSize="${filedata.fileSize}"
										measureUnit="${filedata.measureUnit}"
										onclick="activetheblock(this.id)">
										<td class="uploading_radio"><input type="checkbox"
											name="select" fname="${filedata.fileName}"
											value="fileSelectId" class="select-model"
											id="fileSelectId${status.index}" disabled="true"> <label
											for="fileSelectId"> </label></td>
<%-- 
										<td width="78px"><span class="preview"
											id="upload-image_id"> <img id="image_id"
												src="/Rapidquote/cfimages/${filedata.capturePath}"
												data-src="" width="68px" height="68px"
												onerror="this.src='/Rapidquote/resources/images/no-image.jpg';">

										</span></td> --%>

										<td id="fileData" style="padding: 2%;"><customlabel
												style="word-wrap: break-word;width: 70%;"
												data-toggle="tooltip" title="${filedata.fileName}">${filedata.fileName}</customlabel><br>
											<clabel id="selectedprocess" customid=""></clabel> <clabel
												id="selectedMaterial" customid=""></clabel><br> <clabel
												id="selectedFinishing" customid=""></clabel> <clabel
												id="selectedColor" customid=""></clabel> <clabel
												id="selectedInfill" customid=""></clabel> <clabel
												id="selectedLayerThickness" customid=""
												style="display: inherit;"></clabel> <clabel
												id="selectedNotes" customid=""></clabel></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-12">
						<div id="UploadBoxScroll2" style="height: auto;">
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
												id="p${process.processId}"
												onchange="selectedProcess(this.id)"
											formula="${process.formula}"
												processStatus="${process.status}"
												processName="${process.processName}" name="process"
												processId="${process.processId}"
												processCode="${process.processCode}"
												minimumCost="${process.minimumCost}"
												minimumThickness="${process.minimumThickness}"
												infillFactor="${process.infillFactor}"
												layerThicknessFactor="${process.layerThicknessFactor}"
												maxBuildX="${process.maxBuildX}"
												maxBuildY="${process.maxBuildY}"
												maxBuildZ="${process.maxBuildZ}" />
										<%-- 	<label style="margin-bottom: unset;" class="${disabled}"> --%>&nbsp;&nbsp;&nbsp;&nbsp;${process.processName}</br>
										<%-- 	<br class="${disabled}"> --%>
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
													class=" ${disabled} dropdown-item" href="#"
													materialId="${mid.materialId}"
													materialName="${mid.materialName}"
													description="${mid.description}" image="${mid.imageFile}"
													density="${mid.density}" rate="${mid.rate}"
													categoryId="${mid.categoryId}"
													categoryName="${mid.categoryName}"
													materialProcessId="${mid.materialProcessId}"
													materialCode="${mid.materialCode}"
													onclick="materialDetails(this.id)" ${mid.status}>${mid.materialName}</a>
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
													class=" ${disabled} dropdown-item" href="#"
													materialId="${mid.materialId}"
													materialName="${mid.materialName}"
													description="${mid.description}" image="${mid.imageFile}"
													density="${mid.density}" rate="${mid.rate}"
													categoryId="${mid.categoryId}"
													categoryName="${mid.categoryName}"
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
														onclick="selectColor(this.id)">${color.colorName}&nbsp;&nbsp;&nbsp;
														<div class="colorBox"
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
												<c:forEach items="${infills}" var="infill"
													varStatus="status">
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
														infillId="${infill.infillId}"
														onclick="selectInfill(this.id)">${infill.infillType} -
														${infill.infillPercentage}</a>
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
														class=" ${disabled} dropdown-item"
														layerType="${layer.layerType}"
														layerThickness="${layer.layerThickness}"
														layerFactor="${layer.layerFactor}"
														layerThicknessId="${layer.layerThicknessId}"
														onclick="selectLayerThickness(this.id)">${layer.layerType}
														- ${layer.layerThickness}</a>
												</c:forEach>

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="">
								<h3 class="uploading">Notes:</h3>
								<div><textarea id="notesDetails" onchange="addNotes(this)"
										style="width: -webkit-fill-available;"></textarea>

								</div>
							</div>
						</div>
					</div>
							
		

					<div class="col-lg-6 col-md-6 col-12">
						<h3 class="uploading" id="uploadId">
							<fmt:message key="message.quoteDetails.text11" />
							<span style="display: none" class="pull-right" id="fileCount">
							</span>
						</h3>

						<div class="materialgrid1">
							<div>
								<h3 class="uploading">
									<fmt:message key="message.quoteDetails.text6" />
									<fmt:message key="message.quoteDetails.text11" />
								</h3>
							</div>

							<div style="display: none" class="materialBoxGrid">
								<div id="imageMaterial" class="pull-left">
									<img id="materialImage"
										onerror="this.src='/Rapidquote/resources/images/defaultMaterialImage.jpg';"
										width="100%" height="100%">
								</div>

								<div class="row material" style="padding-left: 3%;">
									<h3 id="materialName" class="uploading"></h3>
									<br>
									<!-- <p id="materialDescription" data-toggle="tooltip" style=""  title="" class="uploading3"></p> -->
									
									<p class="pull-right" style="margin-top: 10%;"
										id="materialType"></p> 
									<p class="pull-left" id="materialDensity"
										style="margin-left: -42%;  margin-top: 20%;"></p>
										
									<p id="materialDescription" data-toggle="tooltip" style="margin-top: 30%; margin-left: -50%;" class="uploading3"></p>
									
								</div>


								<div class="row rate" style="margin-left: 1%; margin-top: 5%;">
									<h6>
										<b id="materialRate" style="display: none;"></b>
									</h6>
								</div>
							</div>
							<div style="display: block" class="noMaterialMsg">
								<fmt:message key="message.quoteDetails.text12" />
							</div>
							<div>
								<h3 class="uploading">
									<fmt:message key="message.quoteDetails.text13" />
								</h3>
							</div>

							<div style="display: block" class="fileBoxGrid">
								<!-- <label class="switch1" > <input type="checkbox" checked>
									<span onclick="conversion()" class="slider2 round slider-text">&nbsp;&nbsp;&nbsp;mm</span>
								</label> -->
								<customlabel2 onclick="getPreview()"> <fmt:message
									key="message.quoteDetails.text14" /></customlabel2>
								<table class="customtable">
									<tr>
										<td><customlabel class="sth"> <fmt:message
												key="message.uploadFile.text14" /></customlabel></td>
										<td><customlabel style="width: 180px;"
												data-toggle="tooltip" title="" id="labelFileName"
												class="labelFileDetails"></customlabel></td>
									</tr>
									<tr>
										<td><customlabel class="sth"> <fmt:message
												key="message.quoteDetails.text15" /></customlabel></td>
										<td><customlabel style="width: 180px;" id="labelFileArea"
												class="labelFileDetails"></customlabel></td>
									</tr>
									<tr>
										<td><customlabel class="sth"> <fmt:message
												key="message.quoteDetails.text16" /></customlabel></td>
										<td><customlabel style="width: 180px;"
												id="labelFileVolume" class="labelFileDetails"></customlabel></td>
									</tr>
									<tr>
										<td><customlabel class="sth"> <fmt:message
												key="message.uploadFile.text15" /></customlabel></td>
										<td><customlabel style="width: 180px;"
												data-toggle="tooltip" title="" id="labelFileScale"
												class="labelFileDetails"></customlabel> <input type="hidden"
											id="serverFileName"></td>
									</tr>
								</table>
							</div>
							
							<div class="materialBoxGrid1">
								<form action="/upload/uploadAttachments" id="attachments"
									method="post" enctype="multipart/form-data">
									<label for="files" class="btn uploadbtn">Add Attachments</label>
								<input onchange="uploadAttachments(this.id)"id="files" style="display: none;" type="file" multiple />
									<div id="attachList"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section1">
		<%@ include file="footer.jsp"%>
	</div>
	<%@ include file="hidden_customer.jsp"%>
	<%@ include file="pv_3dpreview.jsp"%>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	
	
	<script>
		$(document).ready(function() {
			var rowCount = $('#fileId tr').length + " Files Added";
			$("#fileCountnew").text(rowCount);

			$("#uploading_block0").addClass("activeFile");
			populatefileDetails();
		});
	</script>

</body>
</html>

