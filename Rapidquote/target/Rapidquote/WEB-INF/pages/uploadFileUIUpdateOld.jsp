<%@ include file="links.jsp"%>
<body
	style="overflow: hidden;background-image: url('${pageContext.request.contextPath}/resources/images/maxresdefault.jpg'); ">
	<div class="section">
		<%@ include file="header.jsp"%>
		<label id="snackbar3" class="promptmessage"></label> <input
			type="hidden" id="userId1" name="userId1" value="${user.userId}" />
		<input type="hidden" id="userId2" name="userId2" value="" /> <input
			type="hidden" id="langInput" value="${language}" /> <input
			type="hidden" id="canvasBase64" /> <input type="hidden"
			value="${demo}" id="checkDemo" />
	</div>

	<div class="section">
		<div class="col-md-12 col-sm-12 col-xs-12 col-12">
			<div class="row">
				<div class="col-sm-10 col-md-10 col-xs-10 col-8">
					<h3 id="displayText" style="display: none">
						<Strong><fmt:message key="label.uploadFile.text1" /></Strong>
					</h3>
				</div>
				<div id="ctnbtn" class="col-md-2 col-sm-2 col-xs-2 col-4"
					style="display: none; text-align: center;">
					<button onclick=" getFileDetails()" id="selectbutton"
						class="guide2 btn uploadbtn"  disabled>
						<fmt:message key="label.uploadFile.text18" />
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="section upload_file" style="display: block;">
		<div class="col-md-12 col-sm-12 col-xs-12 col-12 upload_file1">
			<div class="row" style="height: 100%;">

				<div class="col-md-6 col-sm-6 col-xs-6 col-6 upload_file1_1">
					<div class="divinsideupload2">

						<h2><fmt:message key="label.text39" /></h2>
						<hr>
						<p><fmt:message key="label.text40" /></p>
						<br>
						<h3><fmt:message key="label.text41" /></h3>
						<ul style="list-style: sqaure">
						<li><fmt:message key="label.text42" /></li>
						<li><fmt:message key="label.text43" /></li>
						<li><fmt:message key="label.text44" /></li>
						<li><fmt:message key="label.text45" /></li>
						</ul>
						<div style="text-align : center;">
							<button id="demobtntip"
								class="guide1 btn uploadbtn demobtn" onclick="uploadDemo()"><fmt:message key="label.text46" /></button>
						</div>
					</div>
				</div>


				<div class="col-md-6 col-sm-6 col-xs-6 col-6 upload_file1_2">
					<div class="divinsideupload1" id="divinsideupload1">
						<div class="div1">
							<h2>
								<fmt:message key="label.uploadFile.text2" />
							</h2>
						</div>
						<div class="guide1 div2">
						
						<i class="fa fa-upload" aria-hidden="true" style= "font-size: 600%;"></i>
						<h5>OR</h5>
							<form method="POST" id="login_form" enctype="multipart/form-data"
								class=" ">
								<label 
									for="fileList"
									class=" btn uploadbtn newuploadbtn"><fmt:message
										key="label.uploadFile.text3" /></label> <input type="file"
									id="fileList" name="fileList"
									accept=".obj,.igs,.step,.stl,.stp" style="display: none;"
									onchange="upload()" multiple />

							</form>
						</div>
						<div class="div3">
							<h4>
								<fmt:message key="label.uploadFile.text4" />
							</h4>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	</div>
	<div class="section file_panel" style="display: none;">
		<div class="row filerow">
			<div id="fileDiv" class="col-md-2 col-sm-2 col-xs-2 col-12">
				<div class="header col-xs-12 col-sm-12 col-md-12 col-12"
					id="uploadsnumber">
					<label id="filecount"></label>
					<fmt:message key="label.uploadFile.text11" />
					<i class="fa fa-trash-o" id="trash"
						style="font-size: 150%; float: right" onclick="deleteItems()"
						data-toggle="tooltip" title="Delete All"></i>

				</div>
				<div class="vertical-menu col-sm-12 col-md-12 col-xs-12 col-12"
					id="selectedFiles" style="overflow-y: auto; overflow-x: hidden;">
				</div>

				<div
					class="col-sm-12 col-md-12 col-xs-12 col-12 miniUploadFile dashed">
					<form method="POST" id="mini_login_form"
						enctype="multipart/form-data">
						<label for="mini_fileList" class=" btn uploadbtn"
							style="max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><fmt:message
								key="label.uploadFile.text3" /></label> <input type="file"
							id="mini_fileList" name="fileList"
							accept=".obj,.igs,.step,.stl,.stp" style="display: none;"
							onchange="uploadmini()" multiple />
					</form>
					<h6>
						<fmt:message key="label.uploadFile.text4" />
					</h6>
				</div>
			</div>

			<div class="col-md-8 col-sm-8 col-xs-8 col-12"
				style="height: 100%; background-color: #d8dee3ad; padding-left: 0px; padding-right: 0px;">

				<div class="header col-sm-12 col-md-12 col-xs-12 col-12">
					<fmt:message key="label.uploadFile.text12" />
					<label style="word-break: break-word;" id="labelfile"></label>

				</div>
				<div id="loader" style="display: none;">
					<div class="animationload">
						<div class="osahanloading"></div>
					</div>
				</div>
				<ul class="button-group" style="position: absolute">
					
					<li><button class="small button" id="Bbox"
							data-toggle="tooltip" title="Bounding Box">
							<i class="fa fa-cube" aria-hidden="true"></i>
						</button></li>
					<li><button class="small button" id="wireframe"
							data-toggle="tooltip" title="WireFrame">
							<i class="fas fa-dice-d20"></i>
						</button></li>
					<li><button class="small button" id="transparent1"
							data-toggle="tooltip" title="Transparency">
							<i class="fas fa-x-ray"></i>
						</button></li>
							<li><button class="small button" id="smooth"
							data-toggle="tooltip" title="Smooth">
							<i class="fas fa-dice-d6"></i>
						</button></li>
					<li><button class="small button" id="myCheck"
							data-toggle="tooltip" title="Rotate">
							<i class="fas fa-sync-alt"></i>
						</button></li>
					<li><button class="small button" id="gridBox"
							data-toggle="tooltip" title="Grid">
							<i class="fas fa-th"></i>
						</button></li>
					<li><button class="small button" id="zoom_in_out"
							data-toggle="tooltip" title="Fit All">
							<i class="fa fa-arrows-alt"></i>
						</button></li>
				
						<li><button class="small button" onclick="colorChange()"
							data-toggle="tooltip" title="Color">
							<i class="fa fa-paint-brush" aria-hidden="true"></i>
						</button> <input type='color' name='color' id="colorCode" value='gray'
						style="display: none;" /></li>


				</ul>

				<div class="slider1">
					<input class="vertical" type="range" value="0" step="0.1"
						id="sliderplan" min="0" max="100" />
				</div>
				<table id="viewbutton">
					<tbody>
						<tr>
							<td></td>
							<td><i data-toggle="tooltip" title="Top View"
								id="top_img_view" class="fa fa-caret-up pointer"
								style="font-size: 30px;"></i></td>
							<td></td>
						</tr>
						<tr>
							<td><i data-toggle="tooltip" title="Left View"
								id="left_img_view" class="fa fa-caret-left pointer"
								style="font-size: 30px"></i></td>
							<td>
								<div class="pointer" id="back_img_view"
									style="width: 60px; display: block;">
									<strong data-toggle="tooltip" title="Back View">BACK</strong>
								</div>
								<div class="pointer" id="front_img_view"
									style="width: 60px; display: none;">
									<strong data-toggle="tooltip" title="Front View">FRONT</strong>
								</div>
							</td>
							<td><i id="right_img_view"
								class="fa fa-caret-right pointer "
								style="float: left; font-size: 30px;" data-toggle="tooltip"
								title="Right View"></i></td>
						</tr>
						<tr>
							<td></td>
							<td><i id="bottom_img_view" class="fa fa-caret-down pointer"
								style="float: left; font-size: 30px; margin-left: 22px;"
								data-toggle="tooltip" title="Bottom View"></i></td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<div id="iframePreview"></div>
			</div>
			<div id="fileDetailsDiv" class="col-sm-2 col-md-2 col-xs-2 col-12">
				<div id="filedetaillabel"
					class="header col-md-12 col-sm-12 col-xs-12 col-12">
					<fmt:message key="label.uploadFile.text13" />
				</div>
				<div style="margin-left: 5%; margin-top: 1%; height: 50%;">
					<label class="fileDetails"><strong><fmt:message
								key="label.uploadFile.text14" /> : </strong></label> <br> <label
						class="fileDetails" id="3dfileName"
						style="word-wrap: break-word; width: 70%;"></label> <br> <label
						class="fileDetails"><strong><fmt:message
								key="label.uploadFile.text15" /> :</strong> </label><br> <label
						class="fileDetails" id="dimensions"
						style="word-wrap: break-word; width: 90%;"></label> <a
						id="fileDownload" href="" download style="display: none"><i
						class="fa fa-download"> <strong><fmt:message
									key="label.uploadFile.text16" /></strong>
					</i></a>
				</div>
			</div>
		</div>

	</div>

	<div class="section">
		<%@ include file="footer.jsp"%>
	</div>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="modal_callout.jsp"%>
	<%@ include file="modal_signin.jsp"%>
	<%@ include file="modal_signup.jsp"%>
	<%@ include file="modal_why.jsp"%>
	<%@ include file="modal_delete.jsp"%>

</body>

