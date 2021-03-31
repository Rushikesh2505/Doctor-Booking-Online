/*var multipleDelete = [];
var Children = [];
var two = "2";
var three = "3";
var fileDataBeans = [];

var fileDataBean = {};
var fileACount = 0;
var mfgProcessBean = {};
var materialBean = {};
var finishingBean = {};
var colorBean = {};
var quoteBean = {};

var quoteBeans = [];

var materialStatus = "0";
var totalCost;*/

var multipleDelete = [];
var Children = [];
var two = "2";
var three = "3";
var fileDataBeans = [];
var webGLRenderer;
var dataURL;
var pageURL;
var accessLink;
var fileDataBean = {};
var mfgProcessBean = {};
var materialBean = {};
var finishingBean = {};
var colorBean = {};
var quoteBean = {};

var quoteBeans = [];
var orderAttachmentsBean = {};
var orderAttachmentsBeans = [];

var materialStatus = "0";
var fileACount = 0;
var currencyName;
var totalCost;
var totalWeight;

Children = $("#selectedFiles:first-child").find("label b").text();

window.onscroll = function() {
	myFunction()
};

function myFunction() {
	var navbar = document.getElementById("myNavbar");
	if (document.body.scrollTop > 100
			|| document.documentElement.scrollTop > 100) {
		navbar.className = "ts3d-bar" + " ts3d-card" + " ts3d-animate-top"
				+ " ts3d-white";
	} else {
		navbar.className = navbar.className.replace("ts3d-animate-top", "");
	}
}

function toggleFunction(id) {
	var x = document.getElementById("navDemo");
	if (x.className.indexOf("ts3d-show") == -1) {
		x.className += " ts3d-show";
		$("#" + id).html('<i class="fa fa-times" aria-hidden="true"></i>');
	} else {
		x.className = x.className.replace(" ts3d-show", "");
		$("#" + id).html('<i class="fa fa-bars"></i>');
	}
}

function addAddress(id) {
	var data = $('#' + id).val();
	$('#addAddress').text(' ');
	$('#addAddress').text(' in ' + data)
}

function snackBar() {
	var x = document.getElementById("snackbar");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}
function colorChange() {
	$("#clipSectionMain").css("display", "none");
	$("#angleSectionMain").css("display", "none");
	$("#clipSectionMain2").css("display", "none");
	$(".slider1").css("display", "none");
	$("#clip").css("pointer-events", "unset");
	$("#colorCode").trigger("click");

}

function deleteItems() {
	$('#delete-modal-1').modal();
}

function deleteAll() {
	fileDataBeans.length = 0;
	$('#selectedFiles').empty();
	$('#filecount').text('');
	$('#iframePreview').empty();
	$('#3dfileName').text('');
	$('#dimensions').text('');
	$('.file_panel').css("display", "none");
	$('.upload_file').css("display", "block");
}

function isEmpty(el) {
	return !$.trim(el.html())
}

function deleteSelected() {
	var newdata = multipleDelete[0];
	if ($('#' + newdata).is(':first-child')) {
		var len = multipleDelete.length;
		fileNumber -= len;

		for (i = 0; i < multipleDelete.length; i++) {
			var a = multipleDelete[i];
			$('#' + a).remove();

		}
		multipleDelete = [];
		$('#filecount').text(fileNumber);
		if (isEmpty($('#selectedFiles'))) {
			deleteAll();
		} else {
			updateFileList();
		}

	} else {
		var len = multipleDelete.length;
		fileNumber -= len;

		for (i = 0; i < multipleDelete.length; i++) {
			var a = multipleDelete[i];
			$('#' + a).remove();

		}
		multipleDelete = [];
		$('#filecount').text(fileNumber);
		if (isEmpty($('#selectedFiles'))) {
			deleteAll();
		}
	}
}

function updateFileList() {
	var updateFile = $("#selectedFiles > div:first").attr("id");
	var newupname = updateFile.replace(
			/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\s\\\/]/gi, '');
	var updatedString = newupname.replace("filePanelList", "");
	getHtml(updatedString);

}

function singleDelete(id) {
	var fileListNOs = $('#filecount').text();
	fileListNOs -= 1;
	if ($('#' + id).is(':first-child')) {
		$('#' + id).remove();
		$('#filecount').text(fileListNOs);
		$('#3dfileName').text('');
		$('#dimensions').text('');
		if (isEmpty($('#selectedFiles'))) {
			deleteAll();
		} else {
			updateFileList();
		}
	} else {
		$('#' + id).remove();
		$('#filecount').text(fileListNOs);
		if (isEmpty($('#selectedFiles'))) {
			deleteAll();
		} else {
			updateFileList();
		}
	}

}

Array.prototype.remove = function() {
	var what, a = arguments, L = a.length, ax;
	while (L && this.length) {
		what = a[--L];
		while ((ax = this.indexOf(what)) !== -1) {
			this.splice(ax, 1);
		}
	}
	return this;
};


function checkboxAddFiles(id) {
	var listId = $('#' + id).attr('listid');
	if ($('#' + id).prop("checked") == true) {
		var sth = $("#" + listId + " .listFileName").addClass("checked");
	} else {
		var sth = $("#" + listId + " .listFileName").removeClass("checked");
	}
}

function activaTab(tab) {
	$('.nav-tabs a[href="#' + tab + '"]').tab('show');
}

function enableCheckBox() {
	if (($(".activeFile #selectedprocess").html() != "")
	/* && ($(".activeFile #selectedFinishing").html() != "") */
	&& ($(".activeFile #selectedMaterial").html() != "")) {
		$(".activeFile").find('input[type=checkbox]').attr("disabled", false);
		$(".activeFile").find('input[type=checkbox]').attr("class", "pointer");

	}
}

function materialDetails(id) {
	var materialId = $("#" + id).attr("materialId");
	var materialName = $("#" + id).attr("materialName");
	var description = $("#" + id).attr("description");
	var image = $("#" + id).attr("image");
	var density = $("#" + id).attr("density");
	var rate = $("#" + id).attr("rate");
	var categoryName = $("#" + id).attr("categoryName");
	var categoryId = $("#" + id).attr("categoryId");
	var materialProcessId = $("#" + id).attr("materialProcessId");
	var materialCode = $("#" + id).attr("materialCode");

	var newimage = "/Rapidquote/mimages/" + image;
	$(".noMaterialMsg").css("display", "none");
	$(".materialBoxGrid").css("display", "block");
	$(".materialBoxGrid").attr("materialId", materialId);
	$("#materialName").text(materialName + "(" + materialCode + ")");
	$("#materialDescription").text(description);
	$("#materialDescription").attr("title", description);
	$("#materialDensity").html(
			"<strong>Density : </strong>" + density + " g/cm" + three.sup());
	$("#materialType").html("<strong>Type : </strong>" + categoryName);
	$("#materialDescription").html(
			"<strong>Description : </strong>" + description);
	
	$("#materialRate").html("<strong>Rate : </strong>" + rate + " per g");
	$("#materialImage").attr("src", newimage);

	$(".activeFile #selectedMaterial").text(" | Material : " + materialName);
	$(".activeFile #selectedMaterial").attr("customid", materialId);
	$(".activeFile #selectedMaterial").attr("materialId", materialId);
	$(".activeFile #selectedMaterial").attr("materialCode", materialCode);
	$(".activeFile #selectedMaterial").attr("materialName", materialName);
	$(".activeFile #selectedMaterial").attr("description", description);
	$(".activeFile #selectedMaterial").attr("image", image);
	$(".activeFile #selectedMaterial").attr("density", density);
	$(".activeFile #selectedMaterial").attr("rate", rate);
	$(".activeFile #selectedMaterial").attr("categoryName", categoryName);
	$(".activeFile #selectedMaterial").attr("categoryId", categoryId);
	$(".activeFile #selectedMaterial").attr("materialProcessId",
			materialProcessId);
	$("#snackbar").text("Material Selected");

	enableCheckBox();

}
function getMaterialByProcessId(selectedProcess) {

	$.ajax({
		url : "/Rapidquote/upload/findMaterialByProcess",
		cache : false,
		data : {
			selectedProcess : selectedProcess
		},
		headers : {
			Accept : "*/*"
		},
		type : "GET",
		contentType : "application/json",

		success : function(data) {
			if (data == "Error") {
				window.location.href = '/Rapidquote/error';
			} else {
				$(".materialPanel").html("");
				$(".materialPanel").html(data);
				if ($("#categoryt1drp").children().length <= 0) {
					$("#categoryt1btn").attr("disabled", "disabled");
				}
				if ($("#categoryt2drp").children().length <= 0) {
					$("#categoryt2btn").attr("disabled", "disabled");
				}
			}
		},
		error : function(e) {
			$("#result").text(e.responseText);
			$("#tabs").html("");
			$("#tabs").html(e.responseText);
			console.log("ERROR : ", e);

		}
	});
}

function rapidquoteInfo( ){
	$("#rapidquotecontent").modal('show');
}

function pushFileDataIntoArray(data) {
	fileDataBeans.push(data);

}

function getSelectFile() {
	if ($('.select-model:checked').length > 0) {
		$('.next-button').removeAttr('disabled');
		$('.next-button').removeClass('blue_btn');
		$('.next-button').addClass('green_btn');
		$('#noclick').addClass('teamSelector');
		document.getElementById('noclick').style.pointerEvents = 'auto';
	} else {
		$('.next-button').attr('disabled', 'disabled');
		$('.next-button').removeClass('green_btn');
		$('.next-button').addClass('blue_btn');
	}
}

function getFileDetails() {
	if (($("#userId").attr("value") == "")) {
		$("#modalLoginForm").modal('show');
	} else {
		if ($(".vertical-menu input:checkbox:checked").length > 0) {
			$(".vertical-menu .filePanelList .row .checked").each(function() {
				var id = $(this).attr("id");
				var fileName = $("#" + id).attr("fileName");
				var x = $("#" + id).attr("x");
				var y = $("#" + id).attr("y");
				var z = $("#" + id).attr("z");
				var surfaceArea = $("#" + id).attr("surfaceArea");
				var actualVolume = $("#" + id).attr("actualVolume");
				var capturePath = $("#" + id).attr("capturePath");
				var serverFileName = $("#" + id).attr("serverFileName");
				var uploadedFileName = $("#" + id).attr("uploadedfile");
				var fileSize = $("#" + id).attr("size");
				var measureUnit = $("#" + id).attr("measureUnit");
				fileDataBean = {
					fileName : fileName,
					x : x,
					y : y,
					z : z,
					surfaceArea : surfaceArea,
					actualVolume : actualVolume,
					capturePath : capturePath,
					serverFileName : serverFileName,
					uploadedFileName : uploadedFileName,
					fileSize : fileSize,
					measureUnit : measureUnit
				};
				pushFileDataIntoArray(fileDataBean);
				console.log("fileDataBean" + fileDataBean);
			});

			var list = {
				fileDataBeans : fileDataBeans
			}
			$.ajax({
				url : '/Rapidquote/upload/fileToNextView',
				contentType : 'application/json',
				type : 'POST',
				data : JSON.stringify(list),
				success : function(data) {

					window.location.href = '/Rapidquote/upload/quote';
				},
				error : function(e1, e2) {

					console.log("ERROR1 : ", e1);
					console.log("ERROR2 : ", e2);
				}
			});
		} else {
			$(".vertical-menu .filePanelList .row .listFileName")
					.each(
							function() {
								var id = $(this).attr("id");
								var fileName = $("#" + id).attr("fileName");
								var x = $("#" + id).attr("x");
								var y = $("#" + id).attr("y");
								var z = $("#" + id).attr("z");
								var surfaceArea = $("#" + id).attr(
										"surfaceArea");
								var actualVolume = $("#" + id).attr(
										"actualVolume");
								var capturePath = $("#" + id).attr(
										"capturePath");
								var serverFileName = $("#" + id).attr(
										"serverFileName");
								var uploadedFileName = $("#" + id).attr(
										"uploadedfile");
								var fileSize = $("#" + id).attr("size");
								var measureUnit = $("#" + id).attr(
								"measureUnit");
								
								fileDataBean = {
									fileName : fileName,
									x : x,
									y : y,
									z : z,
									surfaceArea : surfaceArea,
									actualVolume : actualVolume,
									capturePath : capturePath,
									serverFileName : serverFileName,
									uploadedFileName : uploadedFileName,
									fileSize : fileSize,
									measureUnit : measureUnit
								};
								pushFileDataIntoArray(fileDataBean);
								console.log("fileDataBean22222" + fileDataBean);

							});

			var list = {
				fileDataBeans : fileDataBeans
			}
			$.ajax({
				url : '/Rapidquote/upload/fileToNextView',
				contentType : 'application/json',
				type : 'POST',
				data : JSON.stringify(list),
				success : function(data) {
					window.location.href = '/Rapidquote/upload/quote';
				},
				error : function(e1, e2) {
					console.log("ERROR1 : ", e1);
					console.log("ERROR2 : ", e2);
				}
			});
		}
	}

}


function uploadAttachments(id) {
	if ($("#" + id)[0].files.length > 4) {
		alert("You can add 4 attachments only!");
	} else {
		var data = new FormData();
		var fp = $("#" + id);
		var length = fp[0].files.length; // get length
		fileNumber = length;
		var count = 0;
		var items = fp[0].files;
		var requests = function(fileIndex) {
			if (length == fileIndex) {

			}
			var data = new FormData();
			var inc = fileACount++;
			data.append('multipartFile', items[fileIndex]);
			fileName = items[fileIndex].name;
			fileSize = items[fileIndex].size;
			$
					.ajax({
						type : "POST",
						enctype : 'multipart/form-data',
						url : "/Rapidquote/upload/uploadAttachments",
						data : data,
						processData : false,
						contentType : false,
						cache : false,
						success : function(data) {
							console.log(data.result);
							$("#attachList")
									.append(
											'<div><span style="display: inline-block;">'
													+ fileName
													+ '&nbsp;&nbsp;&nbsp;&nbsp;<i id="sth'
													+ inc
													+ '" deleteid="labelFile'
													+ inc
													+ '" onclick="deleteAttachment(this.id)" serverfileName ="'
													+ data.result
													+ '" class="fa fa-trash" aria-hidden="true"></i></span></div>');
							$(".activeFile")
									.append(
											'<label id="labelFile'
													+ inc
													+ '" style="display:none;" serverName ="'
													+ data.result
													+ '" uploadName="'
													+ fileName + '" fileSize="'
													+ fileSize + '"></label>');
						},
						error : function(e) {
							$("#result").text(e.responseText);
						},
						complete : function() {
							requests(++fileIndex);
						}
					});
		}
		requests(0);
	}
}






function populatefileDetails() {
	$("#attachList").empty();
	var data1 = $(".activeFile").attr("x");
	var data2 = $(".activeFile").attr("y");
	var data3 = $(".activeFile").attr("z");
	var data4 = $(".activeFile").attr("surfaceArea");
	var data5 = $(".activeFile").attr("actualVolume");
	var data6 = $(".activeFile").attr("fileName");
	var data7 = $(".activeFile").attr("capturePath");
	var data8 = $(".activeFile").attr("serverFileName");
	var data9 = $(".activeFile").attr("measureUnit");
//	console.log("Data9" +data9);

	var scale = data1 + " X " + data2 + " X " + data3 + " " + data9;
	var area = data4 + " " + data9 + two.sup();
	var vol = data5 + " " + data9 + three.sup();

	//console.log("area" +area);
	
	$("#labelFileName").text(data6);
	$("#labelFileName").attr("title", data6);
	$("#labelFileName").attr("data-original-title", data6);
	$("#labelFileArea").html(area);
	$("#labelFileVolume").html(vol);

	$("#labelFileScale").text(scale);
	$("#labelFileScale").attr("title", scale);

	$("#labelFileScale").attr("x", data1);
	$("#labelFileScale").attr("y", data2);
	$("#labelFileScale").attr("z", data3);

	$("#labelFileArea").attr("a", data4);
	$("#labelFileVolume").attr("v", data5);
	$("#serverFileName").val(data8);
	var count = 0;
	var inc;
	$('.activeFile label')
			.each(
					function() {
						inc = fileACount++;
						var serverName = $(this).attr("serverName");
						var uploadName = $(this).attr("uploadName");
						var deleteid = $(this).attr("id");
						console.log("serverName : " + serverName);
						console.log("uploadName : " + uploadName);
						console.log("deleteid : " + deleteid);
						if (serverName == undefined) {

						} else {
							$("#attachList")
									.append(
											'<div><span style="display: inline-block;">'
													+ uploadName
													+ '&nbsp;&nbsp;&nbsp;&nbsp;<i id="sth'
													+ inc
													+ '" deleteid="'
													+ deleteid
													+ '" onclick="deleteAttachment(this.id)" serverfileName ="'
													+ serverName
													+ '" class="fa fa-trash" aria-hidden="true"></i></span></div>');
						}
					});
	
}

function deleteAttachment(id) {
	var serverfileName = $("#" + id).attr("serverfileName");
	var deleteid = $("#" + id).attr("deleteid");

	$("#" + id).parent().remove();
	$.ajax({
		type : "POST",
		data : {
			fileName : serverfileName,
		},
		url : "/Rapidquote/upload/deleteAttachment",
		success : function(data) {
			if (data == "success") {
				console.log("Data : " + data);
				$("#" + id).parent().remove();
				$(".activeFile #" + deleteid).remove();
			}
		},
		error : function(error) {
			console.log("Error : " + error.responseText());
		}
	});

}


function activetheblock(id) {
	if ($(".activeFile #selectedprocess").text() == ""
			&& $(".activeFile #selectedMaterial").text() == "") {
		$(fileId).find('.uploading_block').removeClass("activeFile");
		$("#" + id).addClass("activeFile");
		populatefileDetails();
	}

	if ($(".activeFile #selectedprocess").text() == ""
			|| $(".activeFile #selectedMaterial").text() == "") {
		var process, material, finishing;
		if ($(".activeFile #selectedprocess").text() == "") {
			process = "Process | ";
		} else {
			process = "";
		}
		if ($(".activeFile #selectedMaterial").text() == "") {
			material = "Material ";
		} else {
			material = "";
		}

		$("#snackbar").text(process + material + "not selected");
		snackBar();
	} else {
		$(fileId).find('.uploading_block').removeClass("activeFile");
		$("#" + id).addClass("activeFile");
		populatefileDetails();

		$.ajax({
			url : "/Rapidquote/upload/getUpdatedQuoteSelection",
			cache : false,
			headers : {
				Accept : "*/*"
			},
			type : "GET",
			contentType : "application/json",

			success : function(data) {
				$("#UploadBoxScroll2").html("");
				$("#UploadBoxScroll2").html(data);
				$(".noMaterialMsg").css("display", "block");
				$(".materialBoxGrid").css("display", "none");

				if ($("#categoryt1drp").children().length <= 0) {
					$("#categoryt1btn").attr("disabled", "disabled");
				}
				if ($("#categoryt2drp").children().length <= 0) {
					$("#categoryt2btn").attr("disabled", "disabled");
				}
			},
			error : function(e) {
				console.log("ERROR : ", e);

			}
		});
	}

}

function selectFinishing(id) {
	var finishingName = $('#' + id).attr('fname');
	var selectedFinishing = $('#' + id).attr('finishingId');
	var finishingCode = $('#' + id).attr('finishingCode');
	var formula = $('#' + id).attr('formula');

	$(".activeFile #selectedFinishing").text(" | Finishing : " + finishingName);
	$(".activeFile #selectedFinishing").attr("customid", selectedFinishing);
	$(".activeFile #selectedFinishing").attr("finishingName", finishingName);
	$(".activeFile #selectedFinishing").attr("finishingCode", finishingCode);
	$(".activeFile #selectedFinishing").attr("formula", formula);
	console.log(finishingName);
	$("#snackbar").text("Finishing Selected");
	snackBar();
	enableCheckBox();
}

function selectColor(id) {
	var colorName = $('#' + id).attr('colorName');
	var selectedColor = $('#' + id).attr('colorID');
	var colorCode = $('#' + id).attr('colorCode');
	var colorHexCode = $('#' + id).attr('colorHexCode');
	$(".activeFile #selectedColor").text(" | Color : " + colorName);
	$(".activeFile #selectedColor").attr("customid", selectedColor);
	$(".activeFile #selectedColor").attr("colorName", colorName);
	$(".activeFile #selectedColor").attr("colorCode", colorCode);
	$(".activeFile #selectedColor").attr("colorHexCode", colorHexCode);
	$("#snackbar").text("Color Selected");
	snackBar();
	enableCheckBox();

}
function selectInfill(id) {
	var infillType = $('#' + id).attr('infillType');
	var infillPercentage = $('#' + id).attr('infillPercentage');
	var infillFactor = $('#' + id).attr('infillFactor');
	var infillId = $('#' + id).attr('infillId');
	$(".activeFile #selectedInfill").text(" | Infill : " + infillType);
	$(".activeFile #selectedInfill").attr("customid", infillId);
	$(".activeFile #selectedInfill").attr("infillFactor", infillFactor);
	$(".activeFile #selectedInfill").attr("infillPercentage", infillPercentage);
	$(".activeFile #selectedInfill").attr("infillType", infillType);
	$("#snackbar").text("Infill Selected");
	snackBar();

}

function selectLayerThickness(id) {
	var layerType = $('#' + id).attr('layerType');
	var layerThickness = $('#' + id).attr('layerThickness');
	var layerFactor = $('#' + id).attr('layerFactor');
	var layerThicknessId = $('#' + id).attr('layerThicknessId');
	$(".activeFile #selectedLayerThickness").text(
			" | Layer Thickness : " + layerType);
	$(".activeFile #selectedLayerThickness").attr("customid", layerThicknessId);
	$(".activeFile #selectedLayerThickness").attr("layerType", layerType);
	$(".activeFile #selectedLayerThickness").attr("layerThickness",
			layerThickness);
	$(".activeFile #selectedLayerThickness").attr("layerFactor", layerFactor);
	$("#snackbar").text("Layer Thickness Selected");
	snackBar();
}

function removeFinishing() {
	$(".activeFile #selectedFinishing").text("");
	$(".activeFile #selectedFinishing").attr("customid", "");
	$(".activeFile #selectedFinishing").attr("finishingname", "");
	$(".activeFile #selectedFinishing").attr("finishingCode", "");
}

function addNotes(id) {
	var text = $(id).val();
	// alert(text);
	$(".activeFile #selectedNotes").attr("note", text);

}


function populateQuoteBean(trid) {
	var fileName = $("#" + trid).attr("fileName");
	var x = $("#" + trid).attr("x");
	var y = $("#" + trid).attr("y");
	var z = $("#" + trid).attr("z");
	var surfaceArea = $("#" + trid).attr("surfaceArea");
	var actualVolume = $("#" + trid).attr("actualVolume");
	var capturePath = $("#" + trid).attr("capturePath");
	var serverFileName = $("#" + trid).attr("serverFileName");
	var uploadedFileName = $("#" + trid).attr("uploadedFileName");
	var fileSize = $("#" + trid).attr("filesize");
	var measureUnit = $("#" + trid).attr("measureUnit");

	var processId = $("#" + trid + " #selectedprocess").attr("customId");
	var processName = $("#" + trid + " #selectedprocess").attr("processName");
	var processCode = $("#" + trid + " #selectedprocess").attr("processCode");
	var formula = $("#" + trid + " #selectedprocess").attr("formula");

	var minimumCost = $("#" + trid + " #selectedprocess").attr("minimumCost");
	var minimumThickness = $("#" + trid + " #selectedprocess").attr(
			"minimumThickness");
	var infillFactorP = $("#" + trid + " #selectedprocess")
			.attr("infillFactor");
	var layerThicknessFactor = $("#" + trid + " #selectedprocess").attr(
			"layerThicknessFactor");
	var maxBuildX = $("#" + trid + " #selectedprocess").attr("maxBuildX");
	var maxBuildY = $("#" + trid + " #selectedprocess").attr("maxBuildY");
	var maxBuildZ = $("#" + trid + " #selectedprocess").attr("maxBuildZ");

	if ($("#" + trid + " #selectedFinishing").attr("customId") == "") {
		var finishingId = "";
		var finishingName = "";
		var finishingCode = "";
		var formulaF = "";
	} else {
		var finishingId = $("#" + trid + " #selectedFinishing")
				.attr("customId");
		var finishingName = $("#" + trid + " #selectedFinishing").attr(
				"finishingName");
		var finishingCode = $("#" + trid + " #selectedFinishing").attr(
				"finishingCode");
		var formulaF = $("#" + trid + " #selectedFinishing").attr("formula");
	}

	if ($("#" + trid + " #selectedColor").attr("customId") == "") {
		var colorId = "";
		var colorName = "";
		var colorCode = "";
		var colorHexCode = "";
	} else {
		var colorId = $("#" + trid + " #selectedColor").attr("customId");
		var colorName = $("#" + trid + " #selectedColor").attr("colorName");
		var colorCode = $("#" + trid + " #selectedColor").attr("colorCode");
		var colorHexCode = $("#" + trid + " #selectedColor").attr(
				"colorHexCode");
	}

	if ($("#" + trid + " #selectedInfill").attr("customId") == "") {
		var infillId = "";
		var infillType = "";
		var infillPercentage = "";
		var infillFactor = "";
	} else {
		var infillId = $("#" + trid + " #selectedInfill").attr("customId");
		var infillType = $("#" + trid + " #selectedInfill").attr("infillType");
		var infillPercentage = $("#" + trid + " #selectedInfill").attr(
				"infillPercentage");
		var infillFactor = $("#" + trid + " #selectedInfill").attr(
				"infillFactor");
	}

	if ($("#" + trid + " #selectedLayerThickness").attr("customId") == "") {
		var layerThicknessId = "";
		var layerType = "";
		var layerThickness = "";
		var layerFactor = "";
	} else {
		var layerThicknessId = $("#" + trid + " #selectedLayerThickness").attr(
				"customId");
		var layerType = $("#" + trid + " #selectedLayerThickness").attr(
				"layerType");
		var layerThickness = $("#" + trid + " #selectedLayerThickness").attr(
				"layerThickness");
		var layerFactor = $("#" + trid + " #selectedLayerThickness").attr(
				"layerFactor");
	}

	var materialId = $("#" + trid + " #selectedMaterial").attr("materialId");
	var materialName = $("#" + trid + " #selectedMaterial")
			.attr("materialName");
	var description = $("#" + trid + " #selectedMaterial").attr("description");
	var image = $("#" + trid + " #selectedMaterial").attr("image");
	var density = $("#" + trid + " #selectedMaterial").attr("density");
	var rate = $("#" + trid + " #selectedMaterial").attr("rate");
	var categoryId = $("#" + trid + " #selectedMaterial").attr("categoryId");
	var categoryName = $("#" + trid + " #selectedMaterial").attr("categoryName");
	var materialProcessId = $("#" + trid + " #selectedMaterial").attr("materialProcessId");
	var materialCode = $("#" + trid + " #selectedMaterial").attr("materialCode");

	var note = $("#" + trid + " #selectedNotes").attr("note");
	
	orderAttachmentsBeans = [];
	$('#' + trid).find('label').each(
			function() {
				var fid = $(this).attr("id");
				var serverName = $("#" + trid + " #" + fid).attr("serverName");
				var uploadName = $("#" + trid + " #" + fid).attr("uploadName");
				var fileSize = $("#" + trid + " #" + fid).attr("fileSize");
				console.log("trid : " + trid);
				console.log("fid : " + fid);
				console.log("serverName : " + serverName);
				console.log("uploadName : " + uploadName);
				console.log("fileSize : " + fileSize);

				if (serverName == undefined) {

				} else {
					orderAttachmentsBean = {
						attachmentName : serverName,
						attachmentSize : fileSize
					}

					orderAttachmentsBeans.push(orderAttachmentsBean);
					console.log("orderAttachmentsBean"
							+ JSON.stringify(orderAttachmentsBean));
				}
			});

	fileDataBean = {
		fileName : fileName,
		x : x,
		y : y,
		z : z,
		surfaceArea : surfaceArea,
		actualVolume : actualVolume,
		capturePath : capturePath,
		serverFileName : serverFileName,
		uploadedFileName : uploadedFileName,
		fileSize : fileSize,
		measureUnit : measureUnit,
		note : note
	};
	// console.log("fileDataBean"+JSON.stringify(fileDataBean));

	finishingBean = {
		finishingId : finishingId,
		finishingName : finishingName,
		finishingCode : finishingCode,
		formula : formulaF

	};
	// console.log("finishingBean"+JSON.stringify(finishingBean));

	colorBean = {
		colorId : colorId,
		colorName : colorName,
		colorCode : colorCode,
		colorHexCode : colorHexCode
	};
	// console.log("colorBean"+JSON.stringify(colorBean));

	infillFactorBean = {
		infillId : infillId,
		infillType : infillType,
		infillPercentage : infillPercentage,
		infillFactor : infillFactor
	};
	// console.log("infillFactorBean"+JSON.stringify(infillFactorBean));

	layerThicknessFactorBean = {
		layerThicknessId : layerThicknessId,
		layerType : layerType,
		layerThickness : layerThickness,
		layerFactor : layerFactor
	};
	// console.log("layerThicknessFactorBean"+JSON.stringify(layerThicknessFactorBean));

	mfgProcessBean = {
		processId : processId,
		processName : processName,
		processCode : processCode,
		formula : formula,
		minimumCost : minimumCost,
		minimumThickness : minimumThickness,
		infillFactor : infillFactorP,
		layerThicknessFactor : layerThicknessFactor,
		maxBuildX : maxBuildX,
		maxBuildY : maxBuildY,
		maxBuildZ : maxBuildZ
	};
	// console.log("mfgProcessBean"+JSON.stringify(mfgProcessBean));

	materialBean = {
		materialId : materialId,
		materialName : materialName,
		description : description,
		imageFile : image,
		density : density,
		rate : rate,
		categoryId : categoryId,
		categoryName : categoryName,
		materialCode : materialCode,
		materialProcessId : materialProcessId
	};
	// console.log("materialBean"+JSON.stringify(materialBean));

	tempquoteBean = {
		fileDataBean : fileDataBean,
		mfgProcessBean : mfgProcessBean,
		materialBean : materialBean,
		finishingBean : finishingBean,
		colorBean : colorBean,
		layerThicknessFactorBean : layerThicknessFactorBean,
		infillFactorBean : infillFactorBean,
		orderAttachmentsBeans : orderAttachmentsBeans
	};
	console.log("tempquoteBean" + JSON.stringify(tempquoteBean));

	return tempquoteBean;
}

function addToCart() {

	if ($('.checked').length == 0) {
		$("#snackbar").text("Please select the parts to be added in cart");
		snackBar();
	} else {
		$('.template-download tbody .checked').each(function() {
			var trid = $(this).attr("id");
			quoteBean = populateQuoteBean(trid);
			quoteBeans.push(quoteBean);
			// console.log("quoteBean"+JSON.stringify(quoteBean));
			console.log("quoteBeans" + JSON.stringify(quoteBeans));
		});

		var list = {
			quoteBeans : quoteBeans
		};
		// console.log("list"+JSON.stringify(list));

		$.ajax({
			url : '/Rapidquote/upload/quoteToCart',
			contentType : 'application/json',
			type : 'POST',
			data : JSON.stringify(list),
			success : function(data) {
				
				window.location.href = '/Rapidquote/upload/cart';
			},
			error : function(e1, e2) {
				console.log("ERROR1 : ", e1);
				console.log("ERROR2 : ", e2);
			}
		});

	}

}

function updateSelectionPanel() {
	if ($(".activeFile #selectedprocess").text() == ""
			|| $(".activeFile #selectedMaterial").text() == ""
	/* || $(".activeFile #selectedFinishing").text() == "" */) {
		var process, material, finishing;
		if ($(".activeFile #selectedprocess").text() == "") {
			process = "Process | ";
		} else {
			process = "";
		}
		if ($(".activeFile #selectedMaterial").text() == "") {
			material = "Material ";
		} else {
			material = "";
		}
		$("#snackbar").text(process + material + "not selected");
		snackBar();

	} else {
		if ($(".activeFile #editIcon").css('display') == 'block') {
			$("#snackbar").text("Updated");
			snackBar();
		} else {
			$("#snackbar").text("Saved");
			snackBar();
		}
		$.ajax({
			url : "/Rapidquote/upload/getUpdatedQuoteSelection",
			cache : false,
			headers : {
				Accept : "*/*"
			},
			type : "GET",
			contentType : "application/json",

			success : function(data) {
				$("#UploadBoxScroll2").html("");
				$("#UploadBoxScroll2").html(data);
				$(".noMaterialMsg").css("display", "block");
				$(".materialBoxGrid").css("display", "none");
				$(".activeFile #editIcon").css("display", "block");
				$(".activeFile").find('input[type=checkbox]').attr("disabled",
						false);
				$(".activeFile").removeClass("activeFile");

				if ($("#categoryt1drp").children().length <= 0) {
					$("#categoryt1btn").attr("disabled", "disabled");
				}
				if ($("#categoryt2drp").children().length <= 0) {
					$("#categoryt2btn").attr("disabled", "disabled");
				}
			},
			error : function(e) {

				console.log("ERROR : ", e);

			}
		});
	}

}
function selectedProcess(id) {

	var selectedProcess1 = $("#" + id).attr("processid");
	var processname = $("#" + id).attr("processName");
	var processCode = $("#" + id).attr("processCode");
	var processFormula = $("#" + id).attr("formula");

	var minimumCost = $("#" + id).attr("minimumCost");
	var minimumThickness = $("#" + id).attr("minimumThickness");
	var infillFactor = $("#" + id).attr("infillFactor");
	var layerThicknessFactor = $("#" + id).attr("layerThicknessFactor");
	var maxBuildX = $("#" + id).attr("maxBuildX");
	var maxBuildY = $("#" + id).attr("maxBuildY");
	var maxBuildZ = $("#" + id).attr("maxBuildZ");

	$(".activeFile #selectedprocess").text("| Process : " + processname);
	$(".activeFile #selectedprocess").attr("customid", selectedProcess1);
	$(".activeFile #selectedprocess").attr("processName", processname);
	$(".activeFile #selectedprocess").attr("processCode", processCode);
	$(".activeFile #selectedprocess").attr("formula", processFormula);
	$(".activeFile #selectedprocess").attr("minimumCost", minimumCost);
	$(".activeFile #selectedprocess")
			.attr("minimumThickness", minimumThickness);
	$(".activeFile #selectedprocess").attr("infillFactor", infillFactor);
	$(".activeFile #selectedprocess").attr("layerThicknessFactor",
			layerThicknessFactor);
	$(".activeFile #selectedprocess").attr("maxBuildX", maxBuildX);
	$(".activeFile #selectedprocess").attr("maxBuildY", maxBuildY);
	$(".activeFile #selectedprocess").attr("maxBuildZ", maxBuildZ);

	$("#snackbar").text("Process Selected");
	snackBar();
	getMaterialByProcessId(selectedProcess1);
	/*
	 * if( (layerThicknessFactor == "true") && (infillFactor == "true"){
	 * $(".uploadingInfillLayer").html("Infills & Layer Thickness");
	 * $(".layerdropdown").css("display","block");
	 * $(".infilldropdown").css("display","block"); }else{
	 * $(".uploadingInfillLayer").html("");
	 * $(".layerdropdown").css("display","none");
	 * $(".infilldropdown").css("display","none"); }
	 */

	if (infillFactor == "true") {
		$(".infilldropdown").css("display", "block");
	} else if (infillFactor == "false") {
		$(".infilldropdown").css("display", "none");
	}

	if (layerThicknessFactor == "true") {
		$(".layerdropdown").css("display", "block");
	} else if (layerThicknessFactor == "false") {
		$(".layerdropdown").css("display", "none");
	}

	enableCheckBox();

}


function snackBar() {
	var x = document.getElementById("snackbar");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}
function snackBar7() {
	var x = document.getElementById("snackBar7");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}
function getQuantity(id) {
	// var divname = $("#" +
	// id).parent().parent().find(":nth-child(1)").find("input:nth-child(1)").attr("value");

	var divname = $("#" + id).parent().parent().parent().attr("id");

	var sth = $("#" + divname).find("div:nth-child(1)").attr("id");
	var cartId = $("#" + sth).find("input:nth-child(1)").attr("value");
	// alert(cartId);
	var status = $("#" + id).attr('class');
	var qty;
	if (status == "plus") {
		qty = parseInt($("#" + divname + " .count").attr("value")) + 1;
		$("#" + divname + " .count").attr("value", qty);

		// ajax call

		$.ajax({
			url : '/Rapidquote/upload/updateCartItemQty',
			type : 'POST',
			data : {
				cartId : cartId,
				quantity : qty
			},
			success : function(data) {
				// alert(data);
				if (data == "success") {

					var sth = $("#" + id).attr("divid");
					$("#" + sth).attr("value", qty);

					// unit rate
					var uid = $("#" + id).attr('urate'); // Input Id :
					// Holding Unit Rate
					var unitValue = parseFloat($("#" + uid).attr("value")); // Getting
					// value
					// for
					// Id
					// console.log("Unit Rate ID (MSP) : " + uid);
					console.log("Unit Rate (MSP) : " + unitValue);

					// total rate
					var tid = $("#" + id).attr('trate'); // Input Id :
					// Holding Total
					// Rate
					var totalValue = parseFloat($("#" + tid).attr("value")); // Getting
					// value
					// for
					// Id
					// console.log("Total Rate ID (MSP) : " + tid);
					console.log("Total Rate (MSP) : " + totalValue);

					var temp = totalValue + unitValue; // Adding unitRate to
					// totalRate
					console.log("Total Rate Temp (MSP): " + temp);

					$("#" + tid).attr("value", temp.toFixed(2)); // Setting
					// Total
					// Rate in
					// Input
					// holding
					// it
					console.log("Set Total Rate Temp at : " + tid);

					var fid = $("#" + id).attr('frate'); // ID of element
					// where total cost
					// is displayed
					console.log("Final Rate ID (MSP) : " + fid);
					$("#" + fid).text(currencyName + " " + temp.toFixed(2)); // Setting
					// Total
					// Rate
					// with
					// currency
					// on
					// view
					console.log("Set Total Rate Temp at : " + currencyName
							+ " " + temp.toFixed(2));

					var userCurrency = $("#currencyUser").val();
					if (userCurrency == "") {

					} else {
						currencyName = userCurrency;
					}

					// unit rate
					var uidC = $("#" + id).attr('urateC'); // Input Id :
					// Holding Unit Rate
					var unitValueC = parseFloat($("#" + uidC).attr("value")); // Getting
					// value
					// for
					// Id
					// console.log("Unit Rate ID (User) : " + uidC);
					console.log("Unit Rate (User) : " + unitValueC);

					// total rate
					var tidC = $("#" + id).attr('trateC'); // Input Id :
					// Holding Total
					// Rate
					var totalValueC = parseFloat($("#" + tidC).attr("value")); // Getting
					// value
					// for
					// Id
					// console.log("Total Rate ID (User) : " + tidC);
					console.log("Total Rate (User) : " + totalValueC);

					var tempC = totalValueC + unitValueC; // Adding unitRate
					// to totalRate
					console.log("Total Rate Temp (User): " + tempC);

					$("#" + tidC).attr("value", tempC.toFixed(2)); // Setting
					// Total
					// Rate in
					// Input
					// holding
					// it
					console.log("Set Total Rate TempC at : " + tidC);

					var fidC = $("#" + id).attr('frateC'); // ID of element
					// where total cost
					// is displayed
					console.log("Final Rate ID (User) : " + fidC);
					$("#" + fidC).text(currencyName + " " + tempC.toFixed(2)); // Setting
					// Total
					// Rate
					// with
					// currency
					// on
					// view
					console.log("Set Total Rate TempC at : " + currencyName
							+ " " + tempC.toFixed(2));

					var uwid = $("#" + id).attr('uweight'); // Input Id :
					// Holding unit
					// weight
					var unitWeightValue = parseFloat($("#" + uwid)
							.attr("value"));
					console.log("Unit Weight ID : " + uwid);
					console.log("Unit Weight : " + unitWeightValue);

					var twid = $("#" + id).attr('tweight'); // Input Id :
					// Holding total
					// weight
					var totalWeightValue = parseFloat($("#" + twid).attr(
							"value"));
					console.log("Total Weight ID : " + twid);
					console.log("Total Weight : " + totalWeightValue);

					var tempWeight = totalWeightValue + unitWeightValue;
					console.log("Total Weight Temp : " + tempWeight);

					$("#" + twid).attr("value", tempWeight);
					console.log("Set Total Weight at : " + twid);
					updateTotal();
					/*
					 * window.location.href = '/upload/cart';
					 * $("#snackbar").text("Cart Item Updated Successfully");
					 * snackBar();
					 */

				} else {
					alert("Something went wrong");
				}
			},
			error : function(e1, e2) {
				// window.location.href = '/quote';
				console.log("ERROR1 : ", e1);
				console.log("ERROR2 : ", e2);
			}
		});

	}

	if (status == "minus") {
		qty = parseInt($("#" + divname + " .count").attr("value")) - 1;
		$("#" + divname + " .count").attr("value", qty);

		if ($("#" + divname + " .count").attr("value") > 0) {

			// ajax call
			$
					.ajax({
						url : '/Rapidquote/upload/updateCartItemQty',

						type : 'POST',
						data : {
							cartId : cartId,
							quantity : qty
						},
						success : function(data) {
							// alert(data);
							if (data == "success") {
								var sth = $("#" + id).attr("divid");
								$("#" + sth).attr("value", qty);

								var uid = $("#" + id).attr('urate'); // Input
								// Id :
								// Holding
								// Unit
								// Rate
								var unitValue = parseFloat($("#" + uid).attr(
										"value")); // Getting value for Id
								console.log("Unit  Rate ID (MSP) : " + uid);
								console.log("Unit Rate (MSP) : " + unitValue);

								// total rate
								var tid = $("#" + id).attr('trate'); // Input
								// Id :
								// Holding
								// Total
								// Rate
								var totalValue = parseFloat($("#" + tid).attr(
										"value")); // Getting value for Id
								console.log("Total Rate ID (MSP) : " + tid);
								console.log("Total Rate (MSP) : " + totalValue);

								var temp = totalValue - unitValue; // Adding
								// unitRate
								// to
								// totalRate
								console.log("Total Rate Temp (MSP): " + temp);

								$("#" + tid).attr("value", temp.toFixed(2)); // Setting
								// Total
								// Rate
								// in
								// Input
								// holding
								// it
								console.log("Set Total Rate Temp at : " + tid);

								var fid = $("#" + id).attr('frate'); // ID of
								// element
								// where
								// total
								// cost
								// is
								// displayed
								console.log("Final Rate ID (MSP) : " + fid);
								$("#" + fid).text(
										currencyName + " " + temp.toFixed(2)); // Setting
								// Total
								// Rate
								// with
								// currency
								// on
								// view
								console.log("Set Total Rate Temp at : "
										+ currencyName + " " + temp.toFixed(2));

								var userCurrency = $("#currencyUser").val();
								if (userCurrency == "") {

								} else {
									currencyName = userCurrency;
								}

								// unit rate
								var uidC = $("#" + id).attr('urateC'); // Input
								// Id :
								// Holding
								// Unit
								// Rate
								var unitValueC = parseFloat($("#" + uidC).attr(
										"value")); // Getting value for Id
								console.log("Unit  Rate ID (User) : " + uidC);
								console.log("Unit Rate (User) : " + unitValueC);

								// total rate
								var tidC = $("#" + id).attr('trateC'); // Input
								// Id :
								// Holding
								// Total
								// Rate
								var totalValueC = parseFloat($("#" + tidC)
										.attr("value")); // Getting value for
								// Id
								console.log("Total Rate ID (User) : " + tidC);
								console.log("Total Rate (User) : "
										+ totalValueC);

								var tempC = totalValueC - unitValueC;
								console.log("Total Rate Temp (User): " + tempC);

								$("#" + tidC).attr("value", tempC.toFixed(2)); // Setting
								// Total
								// Rate
								// in
								// Input
								// holding
								// it
								console
										.log("Set Total Rate TempC at : "
												+ tidC);

								var fidC = $("#" + id).attr('frateC'); // ID of
								// element
								// where
								// total
								// cost
								// is
								// displayed
								console.log("Final Rate ID (User) : " + fidC);

								$("#" + fidC).text(
										currencyName + " " + tempC.toFixed(2)); // Setting
								// Total
								// Rate
								// with
								// currency
								// on
								// view
								console
										.log("Set Total Rate TempC at : "
												+ currencyName + " "
												+ tempC.toFixed(2));

								var uwid = $("#" + id).attr('uweight'); // Input
								// Id :
								// Holding
								// unit
								// weight
								var unitWeightValue = parseFloat($("#" + uwid)
										.attr("value"));
								console.log("Unit Weight ID : " + uwid);
								console.log("Unit Weight : " + unitWeightValue);

								var twid = $("#" + id).attr('tweight'); // Input
								// Id :
								// Holding
								// total
								// weight
								var totalWeightValue = parseFloat($("#" + twid)
										.attr("value"));
								console.log("Total Weight ID : " + twid);
								console.log("Total Weight : "
										+ totalWeightValue);

								var tempWeight = totalWeightValue
										- unitWeightValue;
								console
										.log("Total Weight Temp : "
												+ tempWeight);

								$("#" + twid).attr("value", tempWeight);
								console.log("Set Total Weight at : " + twid);
								updateTotal();

								/*
								 * window.location.href = '/upload/cart';
								 * $("#snackbar").text("Cart Item Updated
								 * Successfully"); snackBar();
								 */

							} else {
								alert("Something went wrong");
							}
						},
						error : function(e1, e2) {
							// window.location.href = '/quote';
							console.log("ERROR1 : ", e1);
							console.log("ERROR2 : ", e2);
						}
					});

		}

	}

	if ($("#" + divname + " .count").attr("value") == 0) {
		$("#" + divname + " .count").attr("value", "1");
	}

}

function updateTotal() {
	totalCost = parseFloat(0);
	shippingCost = parseFloat(0);
	subtotal = parseFloat(0);
	totalWeight = parseFloat(0);

	totalCostC = parseFloat(0);
	shippingCostC = parseFloat(0);
	subtotalC = parseFloat(0);

	var inputs = $(".class1");
	for (var i = 0; i < inputs.length; i++) {
		temp = parseFloat($(inputs[i]).val());
		subtotal = subtotal + temp;
		console.log("Subtotal Temp : " + subtotal);

	}

	var inputs1 = $(".class2");
	for (var i = 0; i < inputs1.length; i++) {
		tempW = parseFloat($(inputs1[i]).val());
		totalWeight = totalWeight + tempW;
		console.log("UnitWeight : " + tempW);
	}

	var inputs2 = $(".class3");
	for (var i = 0; i < inputs2.length; i++) {
		tempC = parseFloat($(inputs2[i]).val());
		subtotalC = subtotalC + tempC;
		console.log("SubtotalC Temp : " + subtotalC);
	}

	$.ajax({
		url : '/Rapidquote/upload/getShippingCost',
		type : 'POST',
		data : {
			totalWeight : totalWeight
		},
		success : function(data) {
			console.log("totalWeight : " + totalWeight);

			shippingCost = parseFloat(data);
			console.log("shippingCost : " + shippingCost);

			console.log("subtotal : " + subtotal);

			totalCost = subtotal + shippingCost;
			console.log("totalCost : " + totalCost);
			$("#totalWeightCart").val(totalWeight);
			$("#totalshippingCost").val(shippingCost);
			$("#totalCost").val(totalCost);
			$("#subtotalCost").val(subtotal);

			shippingCostC = parseFloat(data);
			console.log("shippingCostC : " + shippingCostC);

			console.log("subtotalC : " + subtotalC);

			totalCostC = subtotalC + shippingCostC;
			console.log("totalCostC : " + totalCostC);

			$("#totalWeightCart").val(totalWeight);
			$("#totalshippingCostC").val(shippingCostC);
			$("#totalCostC").val(totalCostC);
			$("#subtotalCostC").val(subtotalC);

			var userCurrencytemp = $("#currencyUser").val();
			if (userCurrencytemp == "") {
				$("#shippingCost").text(
						currencyName + " " + shippingCost.toFixed(2));
				$("#subtotal").text(currencyName + " " + subtotal.toFixed(2));
				$("#total").text(currencyName + " " + totalCost.toFixed(2));
			} else {

				$("#shippingCostC").text(
						userCurrencytemp + " " + shippingCostC.toFixed(2));
				$("#subtotalC").text(
						userCurrencytemp + " " + subtotalC.toFixed(2));
				$("#totalC").text(
						userCurrencytemp + " " + totalCostC.toFixed(2));
			}

		},
		error : function(e1, e2) {
			console.log("ERROR1 : ", e1);
			console.log("ERROR2 : ", e2);
		}
	});

}

function hiddenUserCurrency() {
	var userCurrency = $("#currencyUser").val();
	if (userCurrency == "") {
		var currencyCurrent = $("#currencyCurrent").val();
		$(".user").css("display", "none");
		$(".msp").css("display", "block");
		var exists = false;
		$('#currencySelect option').each(function() {
			if (this.value == currencyCurrent) {
				exists = true;
				$(this).attr('selected', 'selected');
				return false;
			}
		});
	} else {

		var exists = false;
		$('#currencySelect option').each(function() {
			if (this.value == userCurrency) {
				exists = true;
				$(this).attr('selected', 'selected');
				return false;
			}
		});
		console.log("status :  " + exists);
		// $('#currencySelect option:eq('+userCurrency+')').attr('selected',
		// 'selected');
		$(".user").css("display", "block");
		$(".msp").css("display", "none");
	}
}
function editData(id) {
	// alert(id);
	var divdata = $("#" + id).attr("divdata");
	var updatediv = $("#" + id).attr("updatediv");
	// alert(divdata);

	$.ajax({
		url : "/Rapidquote/upload/getDataToModal",
		cache : false,
		headers : {
			Accept : "*/*"
		},
		type : "GET",
		contentType : "application/json",
		success : function(data) {
			// console.log("data" + data)
			$("#edit-modal .modal-body").html("");
			$("#edit-modal .modal-body").html(data);

			var cartidid = $("#" + divdata + " input:nth-child(1)").attr("id");
			var cartid = $("#" + cartidid).attr("value");

			var fileNameid = $("#" + divdata + " input:nth-child(2)")
					.attr("id");
			var fileName = $("#" + fileNameid).attr("value");

			var xid = $("#" + divdata + " input:nth-child(3)").attr("id");
			var x = $("#" + xid).attr("value");

			var yid = $("#" + divdata + " input:nth-child(4)").attr("id");
			var y = $("#" + yid).attr("value");

			var zid = $("#" + divdata + " input:nth-child(5)").attr("id");
			var z = $("#" + zid).attr("value");

			var said = $("#" + divdata + " input:nth-child(6)").attr("id");
			var sa = $("#" + said).attr("value");

			var vid = $("#" + divdata + " input:nth-child(7)").attr("id");
			var v = $("#" + vid).attr("value");

			var pid = $("#" + divdata + " input:nth-child(8)").attr("id");
			var pdata = $("#" + pid).attr("value");

			var fid = $("#" + divdata + " input:nth-child(10)").attr("id");
			var fdata = $("#" + fid).attr("value");

			var cid = $("#" + divdata + " input:nth-child(12)").attr("id");
			var cdata = $("#" + cid).attr("value");

			var fcpid = $("#" + divdata + " input:nth-child(23)").attr("id");
			var fcpdata = $("#" + fcpid).attr("value");

			var sfnid = $("#" + divdata + " input:nth-child(24)").attr("id");
			var sfndata = $("#" + sfnid).attr("value");

			var ufnid = $("#" + divdata + " input:nth-child(25)").attr("id");
			var ufndata = $("#" + ufnid).attr("value");

			var fsid = $("#" + divdata + " input:nth-child(26)").attr("id");
			var fsdata = $("#" + fsid).attr("value");

			var forid = $("#" + divdata + " input:nth-child(27)").attr("id");
			var fordata = $("#" + forid).attr("value");

			var uncid = $("#" + divdata + " input:nth-child(28)").attr("id");
			var udata = $("#" + uncid).attr("value");

			var ttccid = $("#" + divdata + " input:nth-child(28)").attr("id");
			var ttcdata = $("#" + ttccid).attr("value");

			// alert(pid+fid+cid+mid);
			$("#edit-modal .modal-body #fileVol").attr("value", v);

			var inputs = $("#edit-modal .modal-body .process");

			for (var i = 0; i < inputs.length; i++) {

				var tempid = $(inputs[i]).attr("processId");
				if (tempid == pdata) {
					// alert("checked");
					$(inputs[i]).attr("checked", true);
					getMaterialByProcessIdModal(tempid);

					var processid = $(inputs[i]).attr("processId");
					var processname = $(inputs[i]).attr("processName");
					var formula = $(inputs[i]).attr("formula");

					var divname = $("#divname").attr("value");

					var pid = $("#" + divname + " input:nth-child(8)").attr(
							"id");
					$("#" + pid).attr("value", processid);
					var pNid = $("#" + divname + " input:nth-child(9)").attr(
							"id");
					$("#" + pNid).attr("value", processname);

					var pFid = $("#" + divname + " input:nth-child(28)").attr(
							"id");
					$("#" + pFid).attr("value", formula);

				}

			}

			var inputs = $("#edit-modal .modal-body .finishing");

			for (var i = 0; i < inputs.length; i++) {
				var tempid = $(inputs[i]).attr("finishingId");
				if (tempid == fdata) {
					// alert("checked");
					$(inputs[i]).attr("checked", true);
					var fid = $(inputs[i]).attr("finishingId");
					var fname = $(inputs[i]).attr("fname");
					var fcode = $(inputs[i]).attr("finishingCode");

					var divname = $("#divname").attr("value");

					var fide = $("#" + divname + " input:nth-child(10)").attr(
							"id");
					$("#" + fide).attr("value", fid);
					// alert(mqid);
					var fnide = $("#" + divname + " input:nth-child(11)").attr(
							"id");
					$("#" + fnide).attr("value", fname);
					// alert(fnide);
				}

			}
			var inputs = $("#edit-modal .modal-body .dot");

			for (var i = 0; i < inputs.length; i++) {
				var tempid = $(inputs[i]).attr("colorid");
				if (tempid == cdata) {
					$(inputs[i]).html(
							'<span class="selectColor glyphicon-ok"></span');
					var cid = $(inputs[i]).attr("colorid");
					var cname = $(inputs[i]).attr("colorName");
					var ccode = $(inputs[i]).attr("colorCode");

					var divname = $("#divname").attr("value");

					var cide = $("#" + divname + " input:nth-child(12)").attr(
							"id");
					$("#" + cide).attr("value", cid);
					// alert(mqid);
					var cnide = $("#" + divname + " input:nth-child(13)").attr(
							"id");
					$("#" + cnide).attr("value", cname);

				}

			}

			var midid = $("#" + divdata + " input:nth-child(14)").attr("id");
			var middata = $("#" + midid).attr("value");

			var mnameid = $("#" + divdata + " input:nth-child(15)").attr("id");
			var mnamedata = $("#" + mnameid).attr("value");

			var mpidid = $("#" + divdata + " input:nth-child(20)").attr("id");
			var mpdata = $("#" + mpidid).attr("value");

			var mpdid = $("#" + divdata + " input:nth-child(16)").attr("id");
			var mpddata = $("#" + mpdid).attr("value");

			var mprid = $("#" + divdata + " input:nth-child(17)").attr("id");
			var mprdata = $("#" + mprid).attr("value");

			var cidid = $("#" + divdata + " input:nth-child(18)").attr("id");
			var ciddata = $("#" + cidid).attr("value");

			var cnameid = $("#" + divdata + " input:nth-child(19)").attr("id");
			var cnamedata = $("#" + cnameid).attr("value");

			var cartidid = $("#" + divdata + " input:nth-child(1)").attr("id");
			var cartid = $("#" + cartidid).attr("value");

			var fileNameid = $("#" + divdata + " input:nth-child(2)")
					.attr("id");
			var fileName = $("#" + fileNameid).attr("value");

			var xid = $("#" + divdata + " input:nth-child(3)").attr("id");
			var x = $("#" + xid).attr("value");

			var yid = $("#" + divdata + " input:nth-child(4)").attr("id");
			var y = $("#" + yid).attr("value");

			var zid = $("#" + divdata + " input:nth-child(5)").attr("id");
			var z = $("#" + zid).attr("value");

			var said = $("#" + divdata + " input:nth-child(6)").attr("id");
			var sa = $("#" + said).attr("value");

			var vid = $("#" + divdata + " input:nth-child(7)").attr("id");
			var v = $("#" + vid).attr("value");

			var pid = $("#" + divdata + " input:nth-child(8)").attr("id");
			var pdata = $("#" + pid).attr("value");

			var fid = $("#" + divdata + " input:nth-child(10)").attr("id");
			var fdata = $("#" + fid).attr("value");

			var cid = $("#" + divdata + " input:nth-child(12)").attr("id");
			var cdata = $("#" + cid).attr("value");

			var fcpid = $("#" + divdata + " input:nth-child(23)").attr("id");
			var fcpdata = $("#" + fcpid).attr("value");

			var sfnid = $("#" + divdata + " input:nth-child(24)").attr("id");
			var sfndata = $("#" + sfnid).attr("value");

			var ufnid = $("#" + divdata + " input:nth-child(25)").attr("id");
			var ufndata = $("#" + ufnid).attr("value");

			var fsid = $("#" + divdata + " input:nth-child(26)").attr("id");
			var fsdata = $("#" + fsid).attr("value");

			var forid = $("#" + divdata + " input:nth-child(27)").attr("id");
			var fordata = $("#" + forid).attr("value");

			var uncid = $("#" + divdata + " input:nth-child(28)").attr("id");
			var uncdata = $("#" + uncid).attr("value");

			var ttccid = $("#" + divdata + " input:nth-child(22)").attr("id");
			var ttcdata = $("#" + ttccid).attr("value");
			// alert(divdata);
			var qty = $("#" + divdata).parent().find('.count').attr("value");
			// alert(qty);

			var sth1 = $("#" + divname + " input:nth-child(14)").attr("id");
			$("#" + sth1).attr("value", middata);
			// alert(mqid);
			var sth2 = $("#" + divname + " input:nth-child(15)").attr("id");
			$("#" + sth2).attr("value", mnamedata);
			// alert(mname);
			var sth3 = $("#" + divname + " input:nth-child(20)").attr("id");
			$("#" + sth3).attr("value", mpdata);

			var sth4 = $("#" + divname + " input:nth-child(17)").attr("id");
			$("#" + sth4).attr("value", mprdata);

			var sth5 = $("#" + divname + " input:nth-child(16)").attr("id");
			$("#" + sth5).attr("value", mpddata);

			var sth52 = $("#" + divname + " input:nth-child(18)").attr("id");
			$("#" + sth52).attr("value", ciddata);

			var sth53 = $("#" + divname + " input:nth-child(19)").attr("id");
			$("#" + sth53).attr("value", cnamedata);

			var sth54 = $("#" + divname + " input:nth-child(1)").attr("id");
			$("#" + sth54).attr("value", cartid);

			var sth55 = $("#" + divname + " input:nth-child(2)").attr("id");
			$("#" + sth55).attr("value", fileName);

			var sth56 = $("#" + divname + " input:nth-child(3)").attr("id");
			$("#" + sth56).attr("value", x);

			var sth57 = $("#" + divname + " input:nth-child(4)").attr("id");
			$("#" + sth57).attr("value", y);

			var sth58 = $("#" + divname + " input:nth-child(5)").attr("id");
			$("#" + sth58).attr("value", z);

			var sth59 = $("#" + divname + " input:nth-child(6)").attr("id");
			$("#" + sth59).attr("value", sa);

			var sth60 = $("#" + divname + " input:nth-child(7)").attr("id");
			$("#" + sth60).attr("value", v);

			var sth61 = $("#" + divname + " input:nth-child(21)").attr("id");
			$("#" + sth61).attr("value", uncdata);

			var sth62 = $("#" + divname + " input:nth-child(22)").attr("id");
			$("#" + sth62).attr("value", ttcdata);

			var sth63 = $("#" + divname + " input:nth-child(23)").attr("id");
			$("#" + sth63).attr("value", fcpdata);

			var sth64 = $("#" + divname + " input:nth-child(24)").attr("id");
			$("#" + sth64).attr("value", sfndata);

			var sth65 = $("#" + divname + " input:nth-child(25)").attr("id");
			$("#" + sth65).attr("value", ufndata);

			var sth66 = $("#" + divname + " input:nth-child(26)").attr("id");
			$("#" + sth66).attr("value", fsdata);

			var sth67 = $("#" + divname + " input:nth-child(27)").attr("id");
			$("#" + sth67).attr("value", fordata);

			var sth68 = $("#" + divname + " input:nth-child(30)").attr("id");
			$("#" + sth68).attr("value", qty);

			$("#edit-modal .modal-body #editMaterial").text(
					"(Selected Material : " + mnamedata + ")");

			$("#saveDiv").attr("value", divdata);
			$("#updateDiv").attr("value", updatediv);

			$("#edit-modal").modal('show');

		},
		error : function(e) {
			$("#result").text(e.responseText);
			$("#tabs").html("");
			$("#tabs").html(e.responseText);
			console.log("ERROR : ", e);
		}
	});

}

function getMaterialByProcessIdModal(selectedProcess) {
	// alert(selectedProcess);
	$.ajax({
		url : "/Rapidquote/upload/getUpdatedListModal",
		cache : false,
		data : {
			selectedProcess : selectedProcess
		},
		headers : {
			Accept : "*/*"
		},
		type : "GET",
		contentType : "application/json",

		success : function(data) {
			$("#edit-modal .materialPanel").html("");
			$("#edit-modal .materialPanel").html(data);
			console.log("DATA : ", data);
			if ($("#edit-modal #categoryt1drp").children().length <= 0) {
				$("#edit-modal #categoryt1btn").attr("disabled", "disabled");
			}
			if ($("#edit-modal #categoryt2drp").children().length <= 0) {
				$("#edit-modal #categoryt2btn").attr("disabled", "disabled");
			}

		},
		error : function(e) {
			$("#result").text(e.responseText);
			$("#tabs").html("");
			$("#tabs").html(e.responseText);
			console.log("ERROR : ", e);

		}
	});
}



function edit_selectedProcess(id) {
	var selectedProcess = $("#edit-modal #" + id).attr("processid");
	var processname = $("#edit-modal #" + id).attr("processName");
	var processCode = $("#edit-modal #" + id).attr("processCode");
	var formula = $("#edit-modal #" + id).attr("formula");

	getMaterialByProcessIdModal(selectedProcess);
	var divname = $("#divname").attr("value");

	var pid = $("#" + divname + " input:nth-child(8)").attr("id");
	$("#" + pid).attr("value", selectedProcess);

	var pNid = $("#" + divname + " input:nth-child(9)").attr("id");
	$("#" + pNid).attr("value", processname);

	var pFid = $("#" + divname + " input:nth-child(27)").attr("id");
	// alert(pFid);
	$("#" + pFid).attr("value", formula);
	// alert(formula);

	$("#snackBar7").text("Select relevant material");
	snackBar7();
	materialStatus = "1";

}

function edit_materialDetails(id) {
	var mqid = $("#edit-modal #" + id).attr("materialId");
	// alert(mqid);
	var mname = $("#edit-modal #" + id).attr("materialName");
	// alert(mname);
	var mpid = $("#edit-modal #" + id).attr("materialProcessId");
	// alert(mpid);
	var mrate = $("#edit-modal #" + id).attr("rate");
	// alert(mrate);
	var density = $("#edit-modal #" + id).attr("density");
	// alert(density);
	var categoryId = $("#edit-modal #" + id).attr("categoryId");
	// alert(categoryId);
	var categoryName = $("#edit-modal #" + id).attr("categoryName");
	// alert(categoryName);

	var divname = $("#divname").attr("value");

	var mid = $("#" + divname + " input:nth-child(14)").attr("id");
	$("#" + mid).attr("value", mqid);
	// alert(mqid);
	var mNid = $("#" + divname + " input:nth-child(15)").attr("id");
	$("#" + mNid).attr("value", mname);
	// alert(mname);
	var mpid2 = $("#" + divname + " input:nth-child(20)").attr("id");
	$("#" + mpid2).attr("value", mpid);
	// alert(mpid);

	var mrid = $("#" + divname + " input:nth-child(17)").attr("id");
	$("#" + mrid).attr("value", mrate);

	var mdid = $("#" + divname + " input:nth-child(16)").attr("id");
	$("#" + mdid).attr("value", density);

	var cidid = $("#" + divname + " input:nth-child(18)").attr("id");
	$("#" + cidid).attr("value", categoryId);

	var cnid = $("#" + divname + " input:nth-child(19)").attr("id");
	$("#" + cnid).attr("value", categoryName);

	materialStatus = "0";
	$(".dropdown-menu").css("display", "none");
}

function edit_selectColor(id) {

	if ($("#" + id).html() == "") {
		var cid = $("#edit-modal #" + id).attr("colorId");
		// alert(cid);
		var cname = $("#edit-modal #" + id).attr("colorName");
		// /alert(cname);

		var divname = $("#divname").attr("value");

		var cide = $("#" + divname + " input:nth-child(12)").attr("id");
		$("#" + cide).attr("value", cid);
		// alert(mqid);

		var cnide = $("#" + divname + " input:nth-child(13)").attr("id");
		$("#" + cnide).attr("value", cname);
		// alert(mname);
		// alert("dasd");

		$(".selectColor").remove();
		$("#" + id).html('<span class="selectColor glyphicon-ok"></span');

	} else {

		$(".selectColor").remove();
		var divname = $("#divname").attr("value");

		var cide = $("#" + divname + " input:nth-child(12)").attr("id");
		$("#" + cide).attr("value", "");
		// alert(mqid);

		var cnide = $("#" + divname + " input:nth-child(13)").attr("id");
		$("#" + cnide).attr("value", "");
		// alert(mname);
		// alert("dasd");

	}

}

function edit_selectFinishing(id) {

	var fid = $("#edit-modal #" + id).attr("finishingId");
	// alert(fid);
	var fname = $("#edit-modal #" + id).attr("fname");
	// alert(fname);
	var divname = $("#divname").attr("value");

	var fide = $("#" + divname + " input:nth-child(10)").attr("id");
	$("#" + fide).attr("value", fid);
	// alert(mqid);

	var fnide = $("#" + divname + " input:nth-child(11)").attr("id");
	$("#" + fnide).attr("value", fname);
	// alert(fnide);

}

function updateQuote() {

	if (materialStatus == "1") {
		$("#snackbar7").text("Select relevant material");
		snackBar7();
	} else {
		var saveDiv = $("#saveDiv").attr("value");
		var updateDiv = $("#updateDiv").attr("value");

		var cartId = $("#cartId").attr("value");
		var edit_fileName = $("#edit_fileName").attr("value");
		var edit_x = $("#edit_x").attr("value");
		var edit_y = $("#edit_y").attr("value");
		var edit_z = $("#edit_z").attr("value");
		var edit_surfaceArea = $("#edit_surfaceArea").attr("value");
		var edit_actualVolume = $("#edit_actualVolume").attr("value");

		var edit_processId = $("#edit_processId").attr("value");
		var edit_processName = $("#edit_processName").attr("value");
		var edit_finishingId = $("#edit_finishingId").attr("value");
		var edit_finishingName = $("#edit_finishingName").attr("value");
		var edit_colorId = $("#edit_colorId").attr("value");
		var edit_colorName = $("#edit_colorName").attr("value");
		var edit_materialId = $("#edit_materialId").attr("value");
		var edit_materialName = $("#edit_materialName").attr("value");
		var edit_materialDensity = $("#edit_materialDensity").attr("value");
		var edit_materialRate = $("#edit_materialRate").attr("value");

		var edit_categoryId = $("#edit_categoryId").attr("value");
		var edit_categoryName = $("#edit_categoryName").attr("value");
		var edit_materialProcessId = $("#edit_materialProcessId").attr("value");
		var edit_unitCost = $("#edit_unitCost").attr("value");
		var edit_totalCost = $("#edit_totalCost").attr("value");
		var edit_capturePath = $("#edit_capturePath").attr("value");
		var edit_serverFileName = $("#edit_serverFileName").attr("value");
		var edit_uploadedFileName = $("#edit_uploadedFileName").attr("value");
		var edit_fileSize = $("#edit_fileSize").attr("value");
		var edit_formula = $("#edit_formula").attr("value");
		var quantity = $("#edit_qty").attr("value");
		var userId = $("#userId").attr("value");

		var cartBean = {
			cartId : cartId,
			fileName : edit_fileName,
			actualVolume : edit_actualVolume,
			surfaceArea : edit_surfaceArea,
			x : edit_x,
			y : edit_y,
			z : edit_z,
			unitCost : edit_unitCost,
			capturePath : edit_capturePath,
			serverFileName : edit_serverFileName,
			uploadedFileName : edit_uploadedFileName,
			fileSize : edit_fileSize,
			processId : edit_processId,
			processName : edit_processName,
			formula : edit_formula,
			materialId : edit_materialId,
			materialName : edit_materialName,
			density : edit_materialDensity,
			rate : edit_materialRate,
			categoryId : edit_categoryId,
			categoryName : edit_categoryName,
			materialProcessId : edit_materialProcessId,
			finishingId : edit_finishingId,
			finishingName : edit_finishingName,
			colorId : edit_colorId,
			colorName : edit_colorName,
			userId : userId,
			totalCost : edit_totalCost,
			quantity : quantity
		};
		console.log("CartBean : " + JSON.stringify(cartBean));

		$.ajax({
			url : '/Rapidquote/upload/updateCartItem',
			contentType : 'application/json',
			type : 'POST',
			data : JSON.stringify(cartBean),
			success : function(data) {
				// alert(data);
				if (data == "success") {
					window.location.href = '/Rapidquote/upload/cart';
					$("#snackbar").text("Cart Item Updated Successfully");
					snackBar();

				} else {
					alert("Something went wrong");
				}
			},
			error : function(e1, e2) {
				// window.location.href = '/quote';
				console.log("ERROR1 : ", e1);
				console.log("ERROR2 : ", e2);
			}
		});
	}
}


function changeCurrency(value) {
	var userId = $("#userId").val();
	// alert(currencyName);
	$("#divLoading").addClass('show');
	$.ajax({
		type : "GET",
		url : "/Rapidquote/upload/changeCurrencyForCart",
		data : {
			userId : userId,
			toCurrency : value,
			fromCurrency : currencyName
		},
		contentType : 'application/json',
		success : function(data) {
			console.log(data);
			if (data == "success") {
				window.location.href = '/Rapidquote/upload/cart';
			}
			if (data == "error") {
				window.location.href = '/Rapidquote/customer/error';
			}
		},
		error : function(a, b, c) {
			// alert("error");
			console.log(a + b + c);
		}
	});
}



function checkShippingField(){
	var sth = true;
	var id="scontactEmailU";
	

	$('#shippingForm .signUpcheck').each(
			function() {
				if (($(this).val() == "")
						|| ($(this).css("border-color") === "rgb(255, 0, 0)")) {
					// alert("false");
					$(this).css("border-color", "red");
					$(this).parent().attr("data-tip",
							"Fields should not be empty");
					sth = false;
				}
			
			/* if( $(this).css('border-color') ==getUserOrderItems(this.id)= "red") { alert("false1");
				 * sth = false; }*/
				
				email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
				if ($("#" + id).val() == "") {
					$("#" + id).css("border-color", "red");
					$("#" + id).parent().attr("data-tip", "Fields should not be empty");
				} else if (!email_regex.test($("#" + id).val())) {
					$("#" + id).css("border-color", "red");
					$("#" + id).parent().attr("data-tip", "Please enter valid email");
				} else {
					$("#" + id).css("border-color", "");
					$("#" + id).parent().removeAttr("data-tip");
				}
				var email = $("#" + id).val();
				 
			});
 
	if(sth==true){
	  $("#modalSignUpForm1").modal('hide');
		    $("#confirmOrder-modal").modal('show');

			
		
	}
 
}

function placeOrder() {

	//var mspid = $("#mspid").val();
	var orderBeans = [];
	var userId = null;
	var orderItemBeans = [];
	var dt = new Date();
	
	  var strDate = dt.getDate() + "/" +(dt.getMonth()+1) + "/" +
	 dt.getFullYear() ;
	 
	var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
	 console.log("Date : " + strDate); 
	 console.log("Time : " + time); 

	var count = 0;
	$('.orderItems .order').each(function() {
		count++;
		if (!$("#userId").attr("value") == "") {
			userId = $("#userId").attr("value");
		}

		var dataid = $(':nth-child(1)', this).attr('id');

		var temp2 = $("#" + dataid + " input:nth-child(2)").attr("id");
		var temp3 = $("#" + dataid + " input:nth-child(3)").attr("id");
		var temp4 = $("#" + dataid + " input:nth-child(4)").attr("id");
		var temp5 = $("#" + dataid + " input:nth-child(5)").attr("id");
		var temp6 = $("#" + dataid + " input:nth-child(6)").attr("id");
		var temp7 = $("#" + dataid + " input:nth-child(7)").attr("id");

		var temp8 = $(this).find('.count').attr("value");
		var temp22 = $("#" + dataid + " input:nth-child(22)").attr("id");

		var temp20 = $("#" + dataid + " input:nth-child(20)").attr("id");

		var temp10 = $("#" + dataid + " input:nth-child(10)").attr("id");
		var temp12 = $("#" + dataid + " input:nth-child(12)").attr("id");

		var temp24 = $("#" + dataid + " input:nth-child(24)").attr("id");

		var temp25 = $("#" + dataid + " input:nth-child(25)").attr("id");

		var temp26 = $("#" + dataid + " input:nth-child(26)").attr("id");
		var temp28 = $("#" + dataid + " input:nth-child(28)").attr("id");

		var temp29 = $("#" + dataid + " input:nth-child(29)").attr("id");

		var temp30 = $("#" + dataid + " input:nth-child(30)").attr("id");
		var temp31 = $("#" + dataid + " input:nth-child(31)").attr("id");

		var temp34 = $("#" + dataid + " input:nth-child(34)").attr("id");
		var temp38 = $("#" + dataid + " input:nth-child(38)").attr("id");

		var temp41 = $("#" + dataid + " input:nth-child(41)").attr("id");

		var temp42 = $("#" + dataid + " input:nth-child(42)").attr("id");
		
		var temp46 = $("#" + dataid + " input:nth-child(46)").attr("id");

		var fileName = $("#" + temp2).attr("value");
		var x = $("#"+temp3).attr("value");
		var y = $("#"+temp4).attr("value");
		var z = $("#"+temp5).attr("value");
		var surfaceArea = $("#"+temp6).attr("value");
		var actualVolume = $("#"+temp7).attr("value");
		var measureUnit = $("#"+temp41).attr("value");
		var attachmentIds = $("#"+temp42).attr("value");
		
		var note = $("#"+temp46).attr("value");

		var stlfile = $("#"+temp24).attr("value");
		var uploadedFile = $("#"+temp25).attr("value");
		var fileSize = $("#"+temp26).attr("value");
		var unitCost = $("#"+temp28).attr("value");
		var quantity = $("#"+temp29).attr("value");
		var totalCost = $("#"+temp22).attr("value");

		var unitWeight = $("#"+temp30).attr("value");
		var totalWeight = $("#"+temp31).attr("value");

		var materialProcessId = $("#"+temp20).attr("value");

		var chkfinishingId = $("#"+temp10).attr("value");
		var chkcolorId = $("#"+temp12).attr("value");
		var chkinfillId = $("#"+temp34).attr("value");
		var chklayerThicknessId = $("#"+temp38).attr("value");

		if (chkfinishingId == "") {
			var finishingId = null;
			// alert("No finishing");
		} else {
			var finishingId = $("#"+temp10).attr("value");
			// alert("finishing");
		}

		if (chkcolorId == "") {
			var colorId = null;
			// alert("No color");
		} else {
			var colorId = $("#"+temp12).attr("value");
			// alert("Color");
		}

		if (chkinfillId == "") {
			var infillId = null;
			// alert("No color");
		} else {
			var infillId = $("#"+temp34).attr("value");
			// alert("Color");
		}

		if (chklayerThicknessId == "") {
			var layerThicknessId = null;
			// alert("No color");
		} else {
			var layerThicknessId = $("#"+temp38).attr("value");
			// alert("Color");
		}

		var orderItemBean = {
			fileName : fileName,
			x : x,
			y : y,
			z : z,
			surfaceArea : surfaceArea,
			actualVolume : actualVolume,
			stlfile : stlfile,
			uploadedFile : uploadedFile,
			fileSize : fileSize,
			unitCost : unitCost,
			totalCost : totalCost,
			quantity : quantity,
			unitWeight : unitWeight,
			totalWeight : totalWeight,
			materialProcessId : materialProcessId,
			finishingId : finishingId,
			colorId : colorId,
			infillFactorId : infillId,
			layerThicknessFactorId : layerThicknessId,
			attachmentIds : attachmentIds,
			measureUnit : measureUnit,
			note:note
		};

		orderItemBeans.push(orderItemBean);
	});

	var totalWeight = $("#totalWeightCart").val();
	var shippingCost = $("#totalshippingCost").val();
	var totalMainCost = $("#totalCost").val();
	var subtotalCost = $("#subtotalCost").val();
	var data1 = $("#shippingForm #fullNameS").val();
	var data2 = $("#shippingForm #scontactEmailU").val();
	var data3 = $("#shippingForm #scontactNumber").val();
	var data4 = $("#shippingForm #sAddressU").val();
	var data5 = $("#shippingForm #sCountryU").val();
	var data6 = $("#shippingForm #szipCodeU").val();
	
	var orderBean = {
		//mspid : mspid,
		userId : userId,
		totalCost : totalMainCost,
		subtotal : subtotalCost,
		orderTime : time,
		orderItemBeans : orderItemBeans,
		noOfItems : count,
		totalWeight : totalWeight,
		shippingCost : shippingCost,
		sfullName:data1,
		scontactEmail:data2,
		scontactNumber:data3,
		sAddress:data4,
		sCountry:data5,
		szipCode: data6
				
	}
	console.log("OrderBean : " + JSON.stringify(orderBean));
	$.ajax({
		url : '/Rapidquote/order/place',
		contentType : 'application/json',
		type : 'POST',
		data : JSON.stringify(orderBean),
		success : function(data) {
			console.log("Order response : ", data);
			if (data == "failed") {
				$("#snackbar").text("Order Failed");
				snackBar();
			} else {
				$("#snackbar").text("Order Placed Successfully");
				snackBar();
				$('.addToCartButton').prop('disabled', true);
				$(".cart_panel *").css("pointer-events", "none");
				$(".cart_panel").html("");
				$(".cart_panel").css("display", "none");
				$('.afterOrderemptycart_panel').css('display', "block");
				$("#orderNos").attr("value", data);
				$(".cartNotify").text("0");
				var newData = data.replace(/[\[\]']/g, '')
				$('.afterOrderemptycart_panel').html(newData);
				$("#orderForm").submit();
			}
		},
		error : function(e1, e2) {
			// window.location.href = '/quote';
			console.log("ERROR1 : ", e1);
			console.log("ERROR2 : ", e2);
		}
	});
}



/*
function placeOrder() {
//	var mspid = $("#mspid").val();
	var orderBeans = [];
	var userId = null;
	var orderItemBeans = [];
	var dt = new Date();

	var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
	var count = 0;
	$('.orderItems .order').each(function() {
		count++;
		if (!$("#userId").attr("value") == "") {
			userId = $("#userId").attr("value");
		}

		var dataid = $(':nth-child(1)', this).attr('id');

		var temp2 = $("#" + dataid + " input:nth-child(2)").attr("id");
		var temp3 = $("#" + dataid + " input:nth-child(3)").attr("id");
		var temp4 = $("#" + dataid + " input:nth-child(4)").attr("id");
		var temp5 = $("#" + dataid + " input:nth-child(5)").attr("id");
		var temp6 = $("#" + dataid + " input:nth-child(6)").attr("id");
		var temp7 = $("#" + dataid + " input:nth-child(7)").attr("id");

		var temp7 = $("#" + dataid + " input:nth-child(22)").attr("id");
		var temp8 = $(this).find('.count').attr("value");
		var temp22 = $("#" + dataid + " input:nth-child(22)").attr("id");

		var temp20 = $("#" + dataid + " input:nth-child(20)").attr("id");

		var temp10 = $("#" + dataid + " input:nth-child(10)").attr("id");
		var temp12 = $("#" + dataid + " input:nth-child(12)").attr("id");

		var temp24 = $("#" + dataid + " input:nth-child(24)").attr("id");

		var temp25 = $("#" + dataid + " input:nth-child(25)").attr("id");

		var temp26 = $("#" + dataid + " input:nth-child(26)").attr("id");
		var temp28 = $("#" + dataid + " input:nth-child(28)").attr("id");

		var temp29 = $("#" + dataid + " input:nth-child(29)").attr("id");

		var fileName = $("#" + temp2).attr("value");
		var x = $("#" + temp3).attr("value");
		var y = $("#" + temp4).attr("value");
		var z = $("#" + temp5).attr("value");
		var surfaceArea = $("#" + temp6).attr("value");
		var actualVolume = $("#" + temp7).attr("value");

		var stlfile = $("#" + temp24).attr("value");
		var uploadedFile = $("#" + temp25).attr("value");
		var fileSize = $("#" + temp26).attr("value");
		var unitCost = $("#" + temp28).attr("value");
		var quantity = $("#" + temp29).attr("value");
		var totalCost = $("#" + temp22).attr("value");
		var materialProcessId = $("#" + temp20).attr("value");

		var chkfinishingId = $("#" + temp10).attr("value");
		var chkcolorId = $("#" + temp12).attr("value");

		if (chkfinishingId == "") {
			var finishingId = null;
			// alert("No finishing");
		} else {
			var finishingId = $("#" + temp10).attr("value");
			// alert("finishing");
		}

		if (chkcolorId == "") {
			var colorId = null;
			// alert("No color");
		} else {
			var colorId = $("#" + temp12).attr("value");
			// alert("Color");
		}

		var orderItemBean = {
			fileName : fileName,
			x : x,
			y : y,
			z : z,
			surfaceArea : surfaceArea,
			actualVolume : actualVolume,
			stlfile : stlfile,
			uploadedFile : uploadedFile,
			fileSize : fileSize,
			unitCost : unitCost,
			totalCost : totalCost,
			quantity : quantity,
			materialProcessId : materialProcessId,
			finishingId : finishingId,
			colorId : colorId
		};

		orderItemBeans.push(orderItemBean);
	});

	var orderBean = {
		userId : userId,
		totalCost : totalCost,
		 orderDate : dt , 
		orderTime : time,
		orderItemBeans : orderItemBeans,
		noOfItems : count
	}

	$.ajax({
		url : '/Rapidquote/order/place',
		contentType : 'application/json',
		type : 'POST',
		data : JSON.stringify(orderBean),
		success : function(data) {
			if (data == "error") {

			} else {
				console.log("SUCCESS : ", data);
				$("#snackbar").text("Order Placed Successfully");
				snackBar();
				$('.addToCartButton').prop('disabled', true);
				$(".cart_panel *").css("pointer-events", "none");
				$(".cart_panel").html("");
				$(".cart_panel").css("display", "none");
				$('.afterOrderemptycart_panel').css('display', "block");
				$("#orderNos").attr("value", data);

				$(".cartNotify").text("0");
				var newData = data.replace(/[\[\]']/g, '')
				$('.afterOrderemptycart_panel').html(newData);

				$("#orderForm").submit();
			}
		},
		error : function(e1, e2) {
			// window.location.href = '/Rapidquote/quote';
			console.log("ERROR1 : ", e1);
			console.log("ERROR2 : ", e2);
		}
	});

}*/
function removeitems(id) {
	// alert(id);
	var cartId = $("." + id + " div:first-child").find('*').filter(
			':input:nth(0)').attr("value");
	// alert(cartId);
	$
			.ajax({
				url : '/Rapidquote/upload/removeCartItem',
				type : 'POST',
				data : {
					cartId : cartId
				},
				success : function(data) {
					$("#remove-modal").modal('hide');
					/* $('.modal-backdrop').remove(); */
					window.location.href = '/Rapidquote/upload/cart';
					/*
					 * $(".cartNotify").text($('.orderItems .order').length);
					 * $(".cartNotify").css("display","block");
					 */
					console.log("M : ", data);
					if (data == "success") {
						$("." + id).remove();
						if ($('.orderItems .order').length == 0) {
							window.location.href = '/Rapidquote/upload/emptycart';
						}
						$("#itemNumber").text(
								"(" + $('.orderItems .order').length
										+ ") items added");
						updateTotal();
					}/*
						 * else if(data == "failed"){
						 * $("#snackbar2").text("Failed to remove item from
						 * cart"); snackBar2(); }
						 */
				},
				error : function(e1, e2) {
					// window.location.href = '/Rapidquote/quote';
					console.log("ERROR1 : ", e1);
					console.log("ERROR2 : ", e2);
				},
				complete : function(XMLHttpRequest, status) {
					console.log("Status : " + status);

				}
			});

	if ($('.orderItems .order').length == 0) {
		window.location.href = '/Rapidquote/upload/emptycart';
	}
	$("#itemNumber").text(
			"(" + $('.orderItems .order').length + ") items added");
	updateTotal();

}
function checkOrderlist() {

}

function redirectUpload() {
	emptyEntities();
	var lang = $("#langInput").val();
	if(lang ==null || lang==""){
		window.location.href = '/Rapidquote/';
	}else{
	window.location.href = '/Rapidquote/?lang='+ lang;
}
}

function emptyEntities() {
	fileDataBeans = [];
	fileDataBean = {};
	mfgProcessBean = {};
	materialBean = {};
	finishingBean = {};
	colorBean = {};
	quoteBean = {};
	quoteBeans = [];
}
function myFunction() {
	return "Write something clever here...";
}

function load() {
	$(".upload_file").css("display", "block");
}

function checkFields(id) {
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}

}

function passwordCheck(id) {
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
		var password = $("#signUppassword").val();
		var confirmPassword = $("#" + id).val();
		if (password != confirmPassword) {
			$("#" + id).css("border-color", "red");
			$("#" + id).parent().attr("data-tip", "Password do not match");
		}
	}
}

function checkContactNumber(id) {
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else if (!/^[0-9]+$/.test($("#" + id).val())) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent()
				.attr("data-tip", "Please enter numeric characters");
	}

	else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}

function checkNotEmptyU(id) {
	if ($("#" + id).val() == " ") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}
function checkContactEmail(id) {
	email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else if (!email_regex.test($("#" + id).val())) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Please enter valid email");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
	var email = $("#" + id).val();

	$.ajax({
		url : "/Rapidquote/customer/checkEmail/",
		data : {
			email : email
		},
		dataType : 'json',
		type : "POST",
		success : function(data) {
			console.log(data);
			if (data == true) {
				$("#" + id).css("border-color", "red");
				$("#" + id).parent().attr("data-tip",
						"Email is already registered here");
			} else if (data == false) {
				$("#" + id).css("border-color", "");
				$("#" + id).parent().removeAttr("data-tip");
			}
		},
		error : function(e) {
			$("#result").text(e.responseText);
			$("#tabs").html("");
			$("#tabs").html(e.responseText);
			console.log("ERROR : ", e);

		}
	});

}

function checkshippingContactEmail(id) {
	email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else if (!email_regex.test($("#" + id).val())) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Please enter valid email");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
	var email = $("#" + id).val();

}


function createAppointment() {

	var sth = true;
	$('#userForm .signUpcheck').each(
			function() {
				if (($(this).val() == "")
						|| ($(this).css("border-color") === "rgb(255, 0, 0)")) {
					// alert("false");
					$(this).css("border-color", "red");
					$(this).parent().attr("data-tip",
							"Fields should not be empty");
					sth = false;
				}
				
			/* if( $(this).css('border-color') === "red") { alert("false1");
				 * sth = false; }*/
				 
			});
	// alert(sth);

	if (sth == true) {
		var formData = new FormData();
		var data1 = $("#userForm #firstNameU").val();
		// alert(data1);
		var data2 = $("#userForm #Age").val();
		// alert(data2);
		var data3 = $("#userForm #contactEmailU").val();
		// alert(data3);
		var data4 = $("#userForm #contactNumberU").val();
		// alert(data4);
		var data5 = $("#userForm #addressU").val();
		// alert(data5);
	
		
		var data6 = $("#userForm #booking").val();
		var data7 = $("#userForm #birthday").val();

		
		if (document.getElementById("reprotfile").files.length == 0) {
			// alert("No file selected");
		} else {
			formData.append('report',
					document.getElementById("reprotfile").files[0]);
		}

		formData.append('firstName', data1);
		formData.append('age', data2);
		formData.append('contactEmail', data3);
		formData.append('contactNumber', data4);
		formData.append('address', data5);
		formData.append('booking', data6);
		formData.append('birthdate', data7);
		$.ajax({
			type : "post",
			data : formData,
			url : '/Rapidquote/user/register',
			contentType : 'application/json',
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				$("#modalSignUpForm").modal('hide');
				$("#notify-modal .modal-header h3").html(
						"Verification Sent Successfully");
				$("#notify-modal .modal-body").html(data);
				$("#notify-modal").modal('show');

			},
			error : function(a, b, c) {
				// alert("error");
				console.log(a + b + c);
			}
		});
	}

}

function loginUser() {
	var sth = true;
	$('#loginForm .form-control').each(
			function() {
				if (($(this).val() == "")
						|| ($(this).css("border-color") === "rgb(255, 0, 0)")) {
					$(this).css("border-color", "red");
					$(this).parent().attr("data-tip",
							"Fields should not be empty");
					sth = false;
				}
			});

	if (sth == true) {
		var data1 = $("#loginForm #username").val();
		// alert(data1);
		var data2 = $("#loginForm #signInpassword").val();
		// alert(data2);

		$.ajax({
			type : "GET",
			data : {
				username : data1,
				password : data2
			},
			url : "/Rapidquote/user/authenticate",
			contentType : 'application/json',
			success : function(data) {

				if (data.status == "User Doesnt Exist") {
					$("#modalLoginForm").modal('hide');
					$("#snackbar").text(data.result);
					snackBar();
				}

				if (data.status == "User Not Verified") {
					$("#data-tip-username").attr("data-tip", data.result);
					$("#data-tip-username #username")
							.css("border-color", "red");
					$("#snackbar").text(data.result);
					snackBar();
				}

				if (data.status == "Password Invalid") {
					$("#data-tip-password").attr("data-tip", data.result);
					$("#data-tip-password #password")
							.css("border-color", "red");
				}

				if (data.status == "Login Failed") {
					$("#modalLoginForm").modal('hide');
					$("#snackbar").text(data.result);
					snackBar();
				}

				if (data.status == "Login Success") {
					var str = JSON.parse(data.result);
					$("#modalLoginForm").modal('hide');
					$("#snackbar").text(str.message);
					snackBar();
					$("#userfullname").append(
							str.firstName + " " + str.lastName);
					$("#userfullname1").append(
							str.firstName + " " + str.lastName);
					$("#userId").attr("value", str.userId);
					$("#userfullname").css("display", "block");
					$("#userfullname1").css("display", "block");
					$("#cartItemNo").val(str.cartNo);
					$(".cartNotify").text(str.cartNo);
					$("#cart1").css("display", "block");
					$("#cart").css("display", "block");
					checkUser();
					checkUser1();
					window.location.href = '/Rapidquote/';
					console.log(data);
				}

			},
			error : function(a, b, c) {
				// alert("error");
				console.log(a + b + c);
			}
		});
	}
}

function checkUser1() {
	if (($("#userId").attr("value") == "")) {

	} else {
		$("#signOut1").css("display", "block");
		$("#myOrders1").css("display", "block");
		$("#cart1").css("display", "block");
		$("#signIn1").css("display", "none");
		$("#signUp1").css("display", "none");
		$("#userfullname1").css("display", "block");

	}
}

function logout1() {

	$("#userId").attr("value", "");
	$("#signOut1").css("display", "none");
	$("#myOrders1").css("display", "none");
	$("#signIn1").css("display", "block");
	$("#signUp1").css("display", "block");
	$("#userfullname1").css("display", "none");
	$("#cart1").css("display", "none");
	checkUser();
	window.location.href = '/Rapidquote/user/logout';
}

function checkUser() {
	if (($("#userId").attr("value") == "")) {

	} else {
		$("#signOut").css("display", "block");
		$("#myOrders").css("display", "block");
		$("#cart").css("display", "block");
		$("#signIn").css("display", "none");
		$("#signUp").css("display", "none");
		$("#userfullname").css("display", "block");

	}
}

function logout() {
	$("#userId").attr("value", "");

	$("#signOut").css("display", "none");
	$("#myOrders").css("display", "none");
	$("#signIn").css("display", "block");
	$("#signUp").css("display", "block");

	$("#userfullname").css("display", "none");
	$("#cart").css("display", "none");
	checkUser();
	window.location.href = '/Rapidquote/user/logout';
}

function getOrders() {
	var userId = $("#userId").attr("value");

	// alert(userId1);
	// alert(userId2);
	// alert(userId);
	$.ajax({
		type : "GET",
		data : {
			userId : userId
		},
		url : "/Rapidquote/customer/orders",
		contentType : 'application/json',
		success : function(data) {
			console.log(data);
			if (data == "success") {
				window.location.href = '/Rapidquote/customer/ordersToView';
			}
			if (data == "error") {
				window.location.href = '/Rapidquote/customer/error';
			}
		},
		error : function(a, b, c) {
			// alert("error");
			console.log(a + b + c);
		}
	});

}


function openProfile(){
	userId = $("#userId").attr("value");
	$.ajax({
		type : "GET",
		url : '/Rapidquote/user/profile',
		data : {
			userId : userId
		},
		contentType : "application/json",
		success : function(data) {
		    /*$("#modalprofile" ).html(data);*/
			$("#modalEditprofile .modal-content").html(data);
			$("#modalEditprofile").modal('show');
		},
		error : function(e) {
			console.log(e);
			console.log(e.responseText);
		}
	});
}

function openForm() {
	 // document.getElementById("myFormmm").style.display = "block";
	 $("#modalSignUpForm1").modal('show');

	}

function addShippingAddress(){
	 $("#modalSignUpForm1").modal('hide');
	 $(".modal-backdrop fade show").css("display", "none");
}


function openSignUp() {
	$("#modalLoginForm").modal('hide');
	$("#modalSignUpForm").modal('show');
}
function emptyFileList() {
	if ($('selectedFiles').html() === '') {
		deleteAll();
	}
}
function checkOrderData() {
	if (isEmpty($("#customerOrderData"))) {
		$(".noOrderDiv").css("display", "block");
	} else {
		$("#customers").css("display", "block");
	}

}

function openNav() {
	document.getElementById("fileDetailsDiv").style.width = "250px";

}

function closeNav() {
	document.getElementById("fileDetailsDiv").style.width = "0";

}

function changeLang() {
	$("#listLang").css("display", "block");
}

function changeLang1() {
	$("#listLang1").css("display", "block");
}

function updateLang() {
	if ($("#langInput").val() == "" || $("#langInput").val() == "en") {
		$("#currentLang").html("English" + '<i class="fa fa-caret-down"></i>');

	} else {

		var lang = $("#langInput").val();
		console.log("lang : " + lang);
		if ($("#langInput").val() == "fr") {
			$("#currentLang").html(
					"French  " + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput").val() == "de") {
			$("#currentLang").html(
					"German  " + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput").val() == "cn") {
			$("#currentLang").html(
					"Chinese  " + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput").val() == "sp") {
			$("#currentLang").html(
					"Spanish" + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput").val() == "vi") {
			$("#currentLang").html(
					"Vietnamese" + '<i class="fa fa-caret-down"></i>');
		}
	}
	$("#listLang").css("display", "none");

}

function updateLang1() {
	if ($("#langInput").val() == "" || $("#langInput").val() == "en") {
		$("#currentLang1").html("English");

	} else {

		var lang = $("#langInput").val();
		console.log("lang : " + lang);
		if ($("#langInput").val() == "fr") {
			$("#currentLang1").html("French");
		}
		if ($("#langInput").val() == "de") {
			$("#currentLang1").html("German");
		}
		if ($("#langInput").val() == "cn") {
			$("#currentLang1").html("Chinese");
		}
		if ($("#langInput").val() == "sp") {
			$("#currentLang1").html("Spanish");
		}
		if ($("#langInput").val() == "vi") {
			$("#currentLang1").html("Vietnamese");
		}

	}
	$("#listLang1").css("display", "none");
}
function conversion() {

	if ($(".slider-text").html() == "&nbsp;&nbsp;&nbsp;mm") {
		var x = $("#labelFileScale").attr("x");
		var y = $("#labelFileScale").attr("y");
		var z = $("#labelFileScale").attr("z");

		var a = $("#labelFileArea").attr("a");
		var v = $("#labelFileVolume").attr("v");

		var x_inch = (parseFloat(x) / 25.4).toFixed();
		var y_inch = (parseFloat(y) / 25.4).toFixed();
		var z_inch = (parseFloat(z) / 25.4).toFixed();
		var a_inch = (parseFloat(a) / 25.4).toFixed();
		var v_inch = (parseFloat(v) / 25.4).toFixed();

		var scale_inch = x_inch + " X " + y_inch + " X " + z_inch + " inch";

		$("#labelFileScale").html(scale_inch);

		$("#labelFileArea").html(a_inch + " inch" + two.sup());
		$("#labelFileVolume").html(v_inch + " inch" + three.sup());
		$(".slider-text")
				.html(
						"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inch")

	} else if ($(".slider-text").html() == "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inch") {
		var x = $("#labelFileScale").attr("x");
		var y = $("#labelFileScale").attr("y");
		var z = $("#labelFileScale").attr("z");

		var a = $("#labelFileArea").attr("a");
		var v = $("#labelFileVolume").attr("v");

		var scale = x + " X " + y + " X " + z + " mm";

		$("#labelFileScale").html(scale);

		$("#labelFileArea").html(a + "mm" + two.sup());
		$("#labelFileVolume").html(v + "mm" + three.sup());

		$(".slider-text").html("&nbsp;&nbsp;&nbsp;mm")

	}

}
function checkFinishing3() {

	var inputs = $(".finishingStatus");
	for (var i = 0; i < inputs.length; i++) {
		temp = $(inputs[i]).text().trim();
		tempid = $(inputs[i]).attr("id");

		if (temp == "Finishing:") {
			$("#" + tempid).hide();
		} else if (temp == "Refinamiento:") {
			$("#" + tempid).hide();
		} else if (temp == "Finition:") {
			$("#" + tempid).hide();
		} else if (temp == "Fertigstellung:") {
			$("#" + tempid).hide();
		} else if (temp == "\u7CBE\u52A0\u5DE5:") {
			$("#" + tempid).hide();
		} else {
			$("#" + tempid).show();
		}
		// alert(tempid);
	}
}

function checkColor3() {
	var inputs = $(".colorStatus");
	for (var i = 0; i < inputs.length; i++) {
		temp = $(inputs[i]).text().trim();
		tempid = $(inputs[i]).attr("id");

		if (temp == "Color :") {
			$("#" + tempid).hide();
		} else if (temp == "Couleur :") {
			$("#" + tempid).hide();
		} else if (temp == "Farbe :") {
			$("#" + tempid).hide();
		} else if (temp == "\u989C\u8272 :") {
			$("#" + tempid).hide();
		} else if (temp == "Color :") {
			$("#" + tempid).hide();
		} else {
			$("#" + tempid).show();
		}
		// alert(tempid);
	}
}
function checkInfill() {
	var inputs = $(".infillStatus");
	for (var i = 0; i < inputs.length; i++) {
		temp = $(inputs[i]).text().trim();
		tempid = $(inputs[i]).attr("id");

		if (temp == "Infill :") {
			$("#" + tempid).hide();
		} else if (temp == "Couleur :") {
			$("#" + tempid).hide();
		} else if (temp == "Farbe :") {
			$("#" + tempid).hide();
		} else if (temp == "\u989C\u8272 :") {
			$("#" + tempid).hide();
		} else if (temp == "Color :") {
			$("#" + tempid).hide();
		} else {
			$("#" + tempid).show();
		}
		// alert(tempid);
	}
}

function checkLayerThickness() {
	var inputs = $(".layerThicknessStatus");
	for (var i = 0; i < inputs.length; i++) {
		temp = $(inputs[i]).text().trim();
		tempid = $(inputs[i]).attr("id");

		if (temp == "Layer Thickness :") {
			$("#" + tempid).hide();
		} else if (temp == "Couleur :") {
			$("#" + tempid).hide();
		} else if (temp == "Farbe :") {
			$("#" + tempid).hide();
		} else if (temp == "\u989C\u8272 :") {
			$("#" + tempid).hide();
		} else if (temp == "Color :") {
			$("#" + tempid).hide();
		} else {
			$("#" + tempid).show();
		}
		// alert(tempid);
	}
}

function hideLangDiv() {
	// if( $(".template-download tbody")!= ""){
	// $("#langDiv").css("display","none");
	// }
}

function getUserOrderItems(id) {
	// alert(id);
	var orderId = $("#" + id).attr("orderId");
	// alert(orderId);
	var orderCode = $("#" + id).attr("orderCode");
	// alert(orderCode);

	$.ajax({
		type : "GET",
		url : '/Rapidquote/order/viewOrderItems',
		data : {
			orderId : orderId
		},
		contentType : "application/json",
		success : function(data) {
			$("#customers").html(data);
			$("#orderCodeTitle").html(orderCode);
			$("#backbuttonuser").css("display", "inline-block");
			console.log(data);
		},
		error : function(e) {
			console.log(e);
			console.log(e.responseText);
		}
	});

}

function demochk() {
	var checkDemo = $("#checkDemo").val();
	if (checkDemo == "") {
		$(".miniUploadFile").css("display", "block");
		$(".addToCartButton2").css("display", "block");
	} else if (checkDemo != "") {
		$(".miniUploadFile").css("display", "none");
		$(".addToCartButton2").css("display", "none");
	}

}

/*
 * function downloadQuote(){ $("#quoteTable").html("");
 * 
 * $("#quotePerson").text("Contact Person : " + $("#firstName").val() +
 * $("#lastName").val()); $("#quoteContactNumber").text("Contact No : " +
 * $("#contact").val()); $("#quoteContactEmail").text("Email : " +
 * $("#email").val()); $("#quoteAddress").text($("#address").val());
 * $("#quoteDate").text(new Date());
 * 
 * var count = 0; $('.orderItems .order').each(function() { count++;
 * 
 * var dataid =$(':nth-child(1)', this).attr('id');
 * 
 * var temp1 = $("#" + dataid + " input:nth-child(1)").attr("id"); var temp2 =
 * $("#" + dataid + " input:nth-child(2)").attr("id"); var temp3 = $("#" +
 * dataid + " input:nth-child(3)").attr("id"); var temp4 = $("#" + dataid + "
 * input:nth-child(4)").attr("id"); var temp5 = $("#" + dataid + "
 * input:nth-child(5)").attr("id"); var temp6 = $("#" + dataid + "
 * input:nth-child(6)").attr("id");
 * 
 * var temp7 = $("#" + dataid + " input:nth-child(22)").attr("id"); var temp8 =
 * $(this).find('.count').attr("value"); var temp9 = $("#" + dataid + "
 * input:nth-child(23)").attr("id");
 * 
 * var temp10 = $("#" + dataid + " input:nth-child(21)").attr("id"); var temp11 =
 * $("#" + dataid + " input:nth-child(9)").attr("id"); var temp12 = $("#" +
 * dataid + " input:nth-child(11)").attr("id");
 * 
 * var temp13 = $("#" + dataid + " input:nth-child(25)").attr("id");
 * 
 * var ext; var fileName = $("#"+temp1).attr("value"); // alert(fileName); if(
 * fileName.indexOf(".") > 0 ){ ext = fileName.substring(
 * fileName.lastIndexOf("."),fileName.length); } var sth1 =
 * $("#"+temp13).attr("value"); // alert(sth1);
 * 
 * if( sth1.indexOf(".") > 0 ){ pname = sth1.substring(0,
 * sth1.lastIndexOf(".")); // alert(pname); } var partName = pname +ext; //
 * alert(partName); var unitCost = $("#"+temp7).attr("value"); var quantity =
 * temp8 ; var totalCost = $("#"+temp9).attr("value");
 * 
 * 
 * var html = "<tr>"+ "<td>"+ count +"</td>"+ "<td>"+ fileName +"</td>"+ "<td>"+
 * quantity +"</td>"+ "<td>"+ unitCost +"</td>"+ "<td>"+ totalCost +"</td>"+ "</tr>";
 * $("#quoteTable").append(html);
 * 
 * var subtotal = $("#subtotal").text(); $("#subTotalQuote").text(subtotal);
 * $("#totalCostQuote").text(subtotal); $("#content").css("display","block");
 * }); var pdf = new jsPDF('p', 'pt', 'a4'); pdf.addHTML($("#content").get(0),
 * function () { pdf.save('quote.pdf'); }); $("#content").css("display","none"); }
 */

function downloadQuote() {
	$("#quoteTable").html("");
	var count = 0;

	$('.orderItems .order').each(
			function() {
				count++;

				var dataid = $(':nth-child(1)', this).attr('id');
				var temp2 = $("#" + dataid + " input:nth-child(2)").attr("id");
				var temp23 = $("#" + dataid + " input:nth-child(23)")
						.attr("id");
				var temp3 = $("#" + dataid + " input:nth-child(3)").attr("id");
				var temp4 = $("#" + dataid + " input:nth-child(4)").attr("id");
				var temp5 = $("#" + dataid + " input:nth-child(5)").attr("id");
				var temp9 = $("#" + dataid + " input:nth-child(9)").attr("id");
				var temp15 = $("#" + dataid + " input:nth-child(15)")
						.attr("id");
				var temp11 = $("#" + dataid + " input:nth-child(11)")
						.attr("id");
				var temp13 = $("#" + dataid + " input:nth-child(13)")
						.attr("id");
				var temp21 = $("#" + dataid + " input:nth-child(21)")
						.attr("id");
				var temp22 = $("#" + dataid + " input:nth-child(22)")
						.attr("id");
				var temp28 = $("#" + dataid + " input:nth-child(28)")
						.attr("id");
				var temp29 = $("#" + dataid + " input:nth-child(29)")
						.attr("id");
				var temp23 = $("#" + dataid + " input:nth-child(23)")
						.attr("id");

				var ext;
				var fileName = $("#" + temp2).attr("value");
				var fileName = $("#" + temp2).attr("value");
				var quantity = $("#" + temp29).attr("value");
				var unitCost = $("#" + temp28).attr("value");
				var x = $("#" + temp3).attr("value");
				var y = $("#" + temp4).attr("value");
				var z = $("#" + temp4).attr("value");
				var material = $("#" + temp15).attr("value");
				var colorName = $("#" + temp13).attr("value");
				var process = $("#" + temp9).attr("value");
				var finishing = $("#" + temp11).attr("value");
				var size = x + "*" + y + "*" + z + "mm";
				var totalUnitCost = $("#" + temp22).attr("value");
				var capture = $("#" + temp23).attr("value");

				var specification = "<label>Size : " + size + "</label><br>"
						+ "<label>Material : " + material + "</label><br>"
						+ "<label>Process : " + process + "</label><br>";
				/*
				 * var specification = "<label>Size : "+size +"</label><br>"+"<label>Material :
				 * "+material+"</label><br>"+"<label>Process : "+process+"</label><br>"+"<label>Finishing :
				 * "+finishing+"</label><br>"+"<label>Color : "+colorName+"</label>";
				 */
				if (!(finishing == "")) {
					specification = specification + "<label>Finishing : "
							+ finishing + "</label><br>";
				}
				if (!(colorName == "")) {
					specification = specification + "<label>Color : "
							+ colorName + "</label>";
				}
				var path;
				if (!(capture == "")) {
					path = "/Rapidquote/cfimages/" + capture;
				} else {
					path = "/Rapidquote/resources/images/no-image.jpg";
				}
				$("#quotePerson").text(
						"Contact Person : " + $("#firstName").val() + " "
								+ $("#lastName").val());
				$("#quoteContactNumber").text(
						"Contact No : " + $("#contact").val());
				$("#quoteContactEmail").text("Email : " + $("#email").val());
				$("#quoteAddress").text("Address : " + $("#address").val());

				var fileInfo = fileName + "<br><br><img src=" + path
						+ " height=" + "50" + " width=" + "50" + ">";

				var htmlSpecification = "<tr style="
						+ "line-height:0.8;height : 75px>" + "<td style="
						+ "padding-top:4%;padding-left:2%;" + " >"
						+ count
						+ "</td>"
						+ "<td style="
						+ "padding-top:0.7%;"
						+ ">"
						+ fileInfo
						+ "</td>"
						+ "<td style="
						+ "padding-top:0.5%;"
						+ ">"
						+ specification
						+ "</td>"
						+ "<td style="
						+ "padding-top:4%;padding-left:3%"
						+ ">"
						+ unitCost
						+ "</td>"
						+ "<td style="
						+ "padding-top:4%;padding-left:3%"
						+ ">"
						+ quantity
						+ "</td>"
						+ "<td style="
						+ "padding-top:4%;padding-left:3%;"
						+ ">"
						+ totalUnitCost + "</td>" + "</tr>";

				$("#quoteTable").append(htmlSpecification);
				var subtotal = $("#subtotal").text();
				$("#subTotalQuote").text(subtotal);
				$("#totalCostQuote").text(subtotal);
			});

	$("body").css("overflow", "unset");
	$(".section5").css("display", "none");
	$("#content").css("display", "block");

	printPdf();

	$("body").css("overflow", "hidden");
	$(".section5").css("display", "block");
	$("#content").css("display", "none");

	/*
	 * var pdf = new jsPDF('p', 'pt', 'a4'); var options = { pagesplit: true };
	 * pdf.addHTML($("#content").get(0),options, function () {
	 * pdf.save('quote.pdf'); });
	 */
	// $("#content").css("display","none");
}

function printPdf() {
	var iframe = document.frames ? window.frames.frames["frPDF"] : document
			.getElementById("frPDF");
	var ifWin = iframe.contentWindow || iframe;
	try {
		ifWin.focus();
		ifWin.print();
	} catch (e) {
		window.print(false);
		// or when you get Invalid calling object error for IE9 and above
		// set the browser into IE8 compatibility mode will work

	}

	return false;

}

function getCart() {
	if ($("#cartItemNo").val() == "0") {
		window.location.href = '/Rapidquote/upload/emptycart';
	} else {
		window.location.href = '/Rapidquote/upload/cart';
	}

}

function trigDropdown1() {
	$("#categoryt1drp").css("display", "block");

}

function trigDropdown2() {
	$("#categoryt2drp").css("display", "block");

}
function openClipMenu() {
	$("#angleSectionMain").css("display", "none");
	$("#clipSectionMain2").css("display", "none");
	$("#clipSectionMain").css("display", "block");
}

function openAngleClipMenu() {
	$('.slider1').css("display", "none");
	$("#clipSectionMain").css("display", "none");
	$("#clipSectionMain2").css("display", "block");
	$("#angleSectionMain").css("display", "block");
}


function downloadAttachment(id) {

	var orderItemId = $("#" + id).attr("orderId");

	$.ajax({
		type : 'GET',
		url : '/Rapidquote/order/getOrderAttachments',
		data : {
			orderItemId : orderItemId
		},
		success : function(data) {
			console.log(data.length);
			if (data.length == 0) {
				alert("No attachments");
			}
			$.each(data,
					function(key, value) {
						console.log(key + ": " + value.attachmentName);
						var link = document.createElement('a');
						link.setAttribute('download', null);
						link.style.display = 'none';
						document.body.appendChild(link);
						var fileName = '/Rapidquote/attachment/'
								+ value.attachmentName;
						link.setAttribute('href', fileName);
						link.setAttribute('download', value.attachmentName);
						link.click();
						document.body.removeChild(link);
					});
		},
		error : function(e) {
			$("#result").text(e.responseText);
			console.log("ERROR : ", e);

		}

	});

}


function downloadCadFile(id) {

	var fileOriginalName = $("#" + id).attr("ffile");

	var file1 = $("#" + id).attr("sfile");

	/* window.open('/Rapidquote/3dimages/'+file1); */

	var file2 = $("#" + id).attr("ufile");

	/* window.open('/Rapidquote/3dimages/'+file2); */

	if (file1 == file2) {
		var link = document.createElement('a');
		link.setAttribute('download', null);
		link.style.display = 'none';
		document.body.appendChild(link);
		var fileName = '/Rapidquote/3dimages/' + file1;
		link.setAttribute('href', fileName);
		link.setAttribute('download', fileOriginalName);
		link.click();
		// document.body.removeChild(link);
	} else {

		var files = [ file1, fileOriginalName ];

		var fileName1 = '/Rapidquote/3dimages/' + file1;
		var fileName2 = '/Rapidquote/3dimages/' + file2;

		var links = [ fileName1, fileName2 ];

		var link = document.createElement('a');
		link.setAttribute('download', null);
		link.style.display = 'none';
		document.body.appendChild(link);

		for (var i = 0; i < 2; i++) {
			link.setAttribute('href', links[i]);
			link.setAttribute('download', files[i]);
			link.click();
		}
		document.body.removeChild(link);
	}

}
function getSupplier3DPreview(id) {

	var fileName = $("#" + id).attr("file");
	var stlFileName = $("#" + id).attr("sfile");

	$("#frame").empty();
	// alert("saasd");

	$('#preview').modal();
	$("#preview .modal-title").text(fileName);

	imagepath = "/Rapidquote/3dimages/" + stlFileName;

	var obj, manager, loaderObj, man, child, positions;
	var i, geo, mesh, mesh1, vertices, faces, center, orbitControls, geometry, child;
	var gridHelper, manager, scene, camera, helper, material, wireframe, object, distance, bounding_box, position;
	var Box = 1;
	var wirebox = 0;
	var trasprt = 0;
	var gridHelp = 0;
	var minyvalue = 0;
	var maxyvalue = 0;
	var count = 0;
	var localPlane;
	var bounding_box_x;
	var bounding_box_y;
	var bounding_box_z;
	var shading = 0;
	init();
	function init() {

		var width = $("#frame").css("width");
		var height = $('#frame').css("height");

		var newWidth = parseInt(width, 10) - 20;
		var newHeight = parseInt(height, 10) - 20;

		var container = document.getElementById("frame");
		scene = new THREE.Scene();
		camera = new THREE.PerspectiveCamera(45, newWidth / newHeight, 0.1,
				10000);
		webGLRenderer = new THREE.WebGLRenderer({
			antialias : true,
			logarithmicDepthBuffer : true,
		});
		webGLRenderer.setClearColor(0xffffff, 1.0);
		webGLRenderer.setSize(newWidth, newHeight);

		container.appendChild(webGLRenderer.domElement);

		var light = new THREE.PointLight(0xffffff, 0.9);
		camera.add(light);
		scene.add(camera);
		orbitControls = new THREE.OrbitControls(camera,
				webGLRenderer.domElement);
		material = new THREE.MeshPhongMaterial({
			color : 0x5C98BD,
			overdraw : 1,
			side : THREE.DoubleSide,
			clippingPlanes : [ localPlane ],
			clipShadows : true
		});
		var ext;
		if (imagepath.indexOf(".") > 0) {
			ext = imagepath.substring(imagepath.lastIndexOf("."),
					imagepath.length);
			// alert(ext);
		}
		if (ext == ".stl" || ext == ".STL") {
			var loader = new THREE.STLLoader();

			loader.load(imagepath, function(geometry1) {
				geometry = new THREE.Geometry().fromBufferGeometry(geometry1);
				mesh = new THREE.Mesh(geometry, material);
				scene.add(mesh);
				geometry.center();
				setIsoView();
				var size = (bounding_box_x + bounding_box_z);
				var divisions = 7;
				gridHelper = new THREE.GridHelper(size, divisions);
				gridHelper.position.x = 0;
				gridHelper.position.y = 0 - (Math.abs(bounding_box_y) / 2);
				gridHelper.position.z = 0;
				scene.add(gridHelper);
				helper = new THREE.BoxHelper(mesh, 0x000000);
				helper.update();
				scene.add(helper);
				helper.name = "BoundingBox";

				document.getElementById('colorCode').onchange = function() {
					mesh.material.color.set(this.value);
					$(".slider1").css("display", "block");

				}
			});

			render();

		} else if (ext == ".obj" || ext == ".OBJ") {

			obj = new THREE.OBJLoader();
			manager = new THREE.LoadingManager();
			loaderObj = new THREE.OBJLoader(manager);
			loaderObj.load(imagepath, function(object) {
				man = object;
				man.traverse(function(child) {
					if (child instanceof THREE.Mesh) {
						child.geometry.computeFaceNormals();
						child.geometry.computeVertexNormals(true);

					}
				});
				child = object.children[0];
				geometry = new THREE.Geometry()
						.fromBufferGeometry(child.geometry);
				positions = child.geometry.getAttribute('position').array;
				mesh = new THREE.Mesh(geometry, material);
				scene.add(mesh);
				geometry.center();
				setIsoView();
				grid();
				mesh.name = "OBJModel";
				helper = new THREE.BoxHelper(mesh, 0x000000);
				scene.add(helper);
				helper.name = "BoundingBox";

				document.getElementById('colorCode').onchange = function() {
					$(".slider1").css("display", "block");
					mesh.material.color.set(this.value);

				}

			});
			render();
		}

		window.addEventListener('resize', onWindowResize, false);

		function onWindowResize() {
			camera.aspect = container.offsetWidth / container.offsetHeight;
			camera.updateProjectionMatrix();
			webGLRenderer
					.setSize(container.offsetWidth, container.offsetHeight);
			render();
		}

		function grid() {
			var size = (bounding_box_x + bounding_box_z);
			var divisions = 7;
			gridHelper = new THREE.GridHelper(size, divisions);
			gridHelper.position.x = 0;
			gridHelper.position.y = 0 - (Math.abs(bounding_box_y) / 2);
			gridHelper.position.z = 0;
			scene.add(gridHelper);
			gridHelper.name = "Grid";
		}
		// Spin
		function check_spin() {
			if (orbitControls.autoRotate === false) {
				orbitControls.autoRotate = true;
			} else {
				orbitControls.autoRotate = false;
			}
		}
		function BoundingBox() {
			if (Box == 1) {
				Box = 0;
				var object = scene.getObjectByName('BoundingBox');
				scene.remove(object);
			} else {
				Box = 1;
				scene.add(helper);
			}
		}
		;
		function Wireframe() {
			if (wirebox == 0) {
				wirebox = 1;
				scene.remove(mesh);
				wireframe = new THREE.WireframeHelper(mesh, 0x808080);
				scene.add(wireframe);
				wireframe.name = "wireframeBox";
			} else {
				wirebox = 0;
				object = scene.getObjectByName('wireframeBox');
				scene.remove(object);
				scene.add(mesh);
			}
		}
		;
		function Transparent() {
			if (trasprt == 0) {
				trasprt = 1;
				object = scene.getObjectByName('wireframeBox');
				scene.remove(object);
				scene.add(mesh);
				material.transparent = true;
				material.opacity = 0.2;

			} else {
				trasprt = 0;
				// scene.add(mesh);
				material.transparent = false;
				scene.remove(object);
			}
		}
		;

		function Right_view() {
			orbitControls.center.copy(center);
			camera.position.x = center.x + distance * 2.5;
			camera.position.y = 0;
			camera.position.z = 0;
			camera.lookAt(center);
		}
		function Left_view() {
			orbitControls.center.copy(center);
			camera.position.x = center.x - distance * 2.5;
			camera.position.y = 0;
			camera.position.z = 0;
			camera.lookAt(center);
		}
		function Top_view() {
			orbitControls.center.copy(center);
			camera.position.x = 0;
			camera.position.y = center.y + distance * 2.5;
			camera.position.z = 0;
			camera.lookAt(center);
		}
		function Bottom_view() {
			orbitControls.center.copy(center);
			camera.position.x = 0;
			camera.position.y = center.y - distance * 2.5;
			;
			camera.position.z = 0;
			camera.lookAt(center);
		}
		function Back_view() {
			orbitControls.center.copy(center);
			camera.position.x = 0;
			camera.position.y = 0;
			camera.position.z = center.z - distance * 2.5;
			camera.lookAt(center);
		}
		function Front_view() {
			orbitControls.center.copy(center);
			camera.position.x = 0;
			camera.position.y = 0;
			camera.position.z = center.z + distance * 2.5;
			camera.lookAt(center);
		}
		function getBoundingBox() {
			var box = new THREE.Box3();
			scene.traverse(function(child) {
				if (child instanceof THREE.Mesh) {
					box.setFromObject(child);
				}
			});
			return box;
		}

		function setIsoView() {
			bounding_box = getBoundingBox();
			bounding_box_x = bounding_box.max.x - bounding_box.min.x;
			bounding_box_y = bounding_box.max.y - bounding_box.min.y;
			bounding_box_z = bounding_box.max.z - bounding_box.min.z;
			center = bounding_box.getCenter().clone();

			if (bounding_box_x == bounding_box_y) {
				largebboxvalue = bounding_box_x;
			} else if (bounding_box_x > bounding_box_z) {
				largebboxvalue = bounding_box_x;
			} else {
				largebboxvalue = bounding_box_z;
			}
			// console.log(largebboxvalue);
			if (bounding_box_y == bounding_box_z) {
				largebboxvalue = bounding_box_y;
			} else if (bounding_box_y > bounding_box_x) {
				largebboxvalue = bounding_box_y;
			} else {
				largebboxvalue = bounding_box_x;
			}
			// console.log(largebboxvalue);

			if (bounding_box_x == bounding_box_z) {
				largebboxvalue = bounding_box_x;
			} else if (bounding_box_x > bounding_box_y)
				largebboxvalue = bounding_box_x;
			else {
				largebboxvalue = bounding_box_y;
			}
			var dir_vec = new THREE.Vector3(largebboxvalue, largebboxvalue,
					largebboxvalue);
			position = center.clone();
			dir_vec = new THREE.Vector3().subVectors(bounding_box.max.clone(),
					center);
			distance = bounding_box.min.clone().distanceTo(bounding_box.max);
			position.addScaledVector(dir_vec.normalize(), distance * 2.5);
			camera.position.copy(position);
			camera.lookAt(center);
			var val = ($(".vertical").val() - $(".vertical").attr('min'))
					/ ($(".vertical").attr('max') - $(".vertical").attr('min'));

			$(".vertical").css(
					'background-image',
					'-webkit-gradient(linear, left top, right top, '
							+ 'color-stop(' + val + ', gray), ' + 'color-stop('
							+ val + ', #2e86c1)' + ')');
		}

		function render() {
			orbitControls.update();
			requestAnimationFrame(render);
			webGLRenderer.render(scene, camera);
		}
	}
	;

}


function updateUnit(object) {

	var optionId = object.value;

	var unit = $("#" + optionId).attr("unitvalue");
	console.log("Unit : " + unit);

	var dimensions = $("#" + optionId).attr("dimensions");
	console.log("Dimensions : " + dimensions);

	var labelId = $("#" + optionId).attr("labelId");
	console.log("LabelId : " + labelId);

	var output = dimensions + " " + unit;

	$("#" + labelId).text(output);

	$(".default").prop("selected", "true");

	var fileId = $("#" + optionId).parent().parent().parent().find(
			"div:nth-child(2)").attr("id");
	$("#" + fileId).attr("measureUnit", unit);

}

function checkVerify() {
	var message = $("#messageVerified").val();

	if (message != "") {
		$("#notify-modal .modal-header h3").html("Account Verified");
		$("#notify-modal .modal-body").html(message);
		$("#notify-modal").modal('show');

		setTimeout(function() {
			$("#notify-modal").modal('hide');
			$("#modalLoginForm").modal('show');
		}, 2000);

	}
}

function forgotPassword() {
	var forgotpass_email = $("#forgotpass_email").val();
	$.ajax({
		url : "/Rapidquote/user/forgotPassword",
		type : "GET",
		data : {
			"email" : forgotpass_email
		},
		success : function(data) {
			$("#modal_forgot_password").modal('hide');
			$("#notify-modal .modal-header h3").html("Reset Link Status");
			$("#notify-modal .modal-body").html(data.result);
			$("#notify-modal").modal('show');
		},
		error : function() {
			// alert('Something went wrong');
		}
	});

}




function saveQuotePdf() {
	var userId = $("#userId1").val();
	var orderNo = $("#orderNo").val();
	//var mspid = $("#mspid").val();

	$.ajax({
		url : '/Rapidquote/order/pdf',
		type : "GET",
		data : {
			//mspid : mspid,
			userId : userId,
			orderNo : orderNo
		},
		contentType : "application/json",
		success : function(data) {
			console.log(data);

			$("#content").css("display", "block");
			$("#content").html(data);

			var doc = new jsPDF('p', 'pt', 'a4');
//			var imgData='data:image/jpeg;base64,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';
			var img = new Image()
			img.src = '/Rapidquote/resources/images/logo.png'
			doc.addImage(img, 'png', 35,25,160,50);
			//doc.addImage(imgData,'JPEG ',35,25,160,50);

			  var options ={
			            margin:{
			                top: 30
			            },
			            startY:80
			        };

			var res =doc.autoTableHtmlToJson(document.getElementById("user"));
			doc.autoTable(res.columns, res.data,options);
			
			var options1={
					 styles: {overflow: 'none', columnWidth: 'wrap', fontSize: 9,},
		                columnStyles: {
		                			   0: {columnWidth: 'wrap'},
		                			   1: {overflow: 'linebreak',columnWidth: 'auto'},
		                	 	       2: {columnWidth: 'wrap'},
		                			   3: {overflow: 'linebreak',columnWidth: 'auto'}
		                },
					
			                 startY: doc.autoTableEndPosY() + 20
			        };
			var res2 =  doc.autoTableHtmlToJson(document.getElementById("item_block"));
			doc.autoTable(res2.columns, res2.data,options1);
			
			 var options2 = {
			            startY: doc.autoTableEndPosY() + 20
			        };
			var res3 =  doc.autoTableHtmlToJson(document.getElementById("shipping_block"));
			doc.autoTable(res3.columns, res3.data,options2);
			
			
			    var options3 = {
			    		styles: {overflow: 'linebreak', columnWidth: 'auto', fontSize: 9},
			            startY: doc.autoTableEndPosY() + 20
			        };
			    var res4 =  doc.autoTableHtmlToJson(document.getElementById("manufacturing_block"));
				doc.autoTable(res4.columns, res4.data,options3);
				
				
				 var options4 = {
				    		theme:"plain",
				    		styles: {fontSize: 9},
				            margin: {
				            	fontSize:9,
				                top: 90
				            },
				            startY: doc.autoTableEndPosY() + 20
				        };
				var res5 =  doc.autoTableHtmlToJson(document.getElementById("supp"));
				doc.autoTable(res5.columns, res5.data,options4);
				
			    var options5 = {
			    		theme:"plain",
			    		  margin: {
			    			  fontSize:9,
				                top: 50,
				                right: 305
				            },
			    		 styles: { fontSize: 9,
			    			  columnWidth: 'wrap'	 
			    		 },
			            startY: doc.autoTableEndPosY() + 10
			        };

			
			var res6 =  doc.autoTableHtmlToJson(document.getElementById("supplierdetails"));
			doc.autoTable(res6.columns, res6.data,options5);
			
			var options6 = {
		    		theme:"plain",
		    		  margin: {
		    			  fontSize:9
			            },
		    		 styles: { fontSize: 9,
		    			  columnWidth: 'wrap'	 
		    		 },
		            startY: doc.autoTableEndPosY() + 10
		        };

		
		var res7 =  doc.autoTableHtmlToJson(document.getElementById("shippingdetails"));
		doc.autoTable(res7.columns, res7.data,options6);
		
		
				

			const pageCount = doc.internal.getNumberOfPages()
			 for (var i = 1; i <= pageCount; i++) {
				    doc.setPage(i);
				    doc.setFontSize(9);
				    doc.text('Page ' + String(i) + ' of ' + String(pageCount), doc.internal.pageSize.width / 2, doc.internal.pageSize.height-10, {
				      align: 'center'
				    })
				  }
				
			var opdf=doc.output('blob')
			var data=new FormData()
			data.append('data',opdf);
			data.append('orderNo',orderNo);
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				url : '/Rapidquote/order/savepdf',
				data : data,
				processData : false,
				contentType : false,
				success : function(data) {
					console.log(data);
				},
				error : function(e) {
					console.log(e);
					console.log(e.responseText);
				}

			});
	 
			
			$("#content").css("display","none");
			
			doc.save(orderNo+".pdf");
	       
			},
			error : function(e) {
				console.log(e);
				console.log(e.responseText);
			}
		});

}





function resetPassword() {
	if (($("#password").val() == "" || $("#confirmPassword").val() == "")
			|| $("#password").val() != $("#confirmPassword").val()) {
		alert("Please enter details correctly!");
	} else {
		var email = $("#email").val();
		var password = $("#password").val();

		var jsonObj = {
			"email" : email,
			"newPassword" : password
		};
		$.ajax({
			url : "/Rapidquote/user/savePassword",
			contentType : "application/json",
			type : "POST",
			data : JSON.stringify(jsonObj),
			dataType : 'json',
			success : function(data) {
				// alert(data.result);
				redirectUpload();
			},
			error : function() {
			}
		});
		console.log(jsonObj);
	}
}

$(document)
		.ready(
				function() {
					checkVerify();
					demochk();
					pageURL = $(location).attr("href");
					/*checkUser();
					checkUser1();
					checkColor3();
					checkFinishing3();
					updateLang();
					updateLang1();
					hideLangDiv();*/
				//	pageURL = window.location.href;
					hiddenUserCurrency();
					//demochk();
					//accessLink = $("#mspaccessLink").val();
					currencyName = $("#currencyCurrent").val();
					checkUser();
					checkUser1();
					checkOrderData();
					checkColor3();
					checkInfill();
					checkLayerThickness();
					checkFinishing3();
					updateLang();
					updateLang1();
					hideLangDiv();
					/*
					 * // file Download $('#fileDownload').click( function() { //
					 * var name = this.fileName1.substring(
					 * "0",fileName1.lastIndexOf(".")) // + ".stl"; var
					 * name=fileDownloadName; // alert(name); stlExporter = new
					 * THREE.STLExporter(); var link =
					 * document.createElement('a'); link.style.display = 'none';
					 * document.body.appendChild(link);
					 * 
					 * function save(blob, filename) { link.href =
					 * URL.createObjectURL(blob); link.download = filename ||
					 * 'data.json'; link.click();
					 *  }
					 * 
					 * function saveString(text, filename) { save(new Blob(
					 * [text] , { type: 'text/plain' } ),filename); }
					 * 
					 * if(mesh.name == "STLModel"){
					 * saveString(stlExporter.parse(scene.getObjectByName('STLModel')),
					 * fileDownloadName); }else if(mesh.name == "OBJModel"){
					 * saveString(stlExporter.parse(scene.getObjectByName('OBJModel')),
					 * fileDownloadName); }
					 * 
					 * });
					 */
					$('.dropdown-toggle').dropdown();

					$('.guide1').tooltip("show");
					setTimeout(function() {
						$('.guide1').tooltip('hide');
					}, 3000);

					// $("#edit-modal").modal('show');
					$("#itemNumber").text(
							"(" + $('.orderItems .order').length
									+ ") items added");
/*
					$(".cartNotify").text($("#No").val());
					$(".cartNotify").css("display", "block");
*/
					$(".cartNotify").text($("#cartItemNo").val());
					$(".cartNotify").css("display", "block");
					var rowCount = $('#fileId tr').length + " Files Added";
					$("#fileCountnew").text(rowCount);

					$("#uploading_block0").addClass("activeFile");
					populatefileDetails();

					$("#materialDetails").hide();

					$('[data-toggle="tooltip"]').tooltip({
						trigger : 'hover'
					})

					//updateTotal();

					$('.count').prop('disabled', true);

					$('.delete_check').val(this.unchecked);

					$("#modal-btn-yes0").on("click", function() {
						deleteSelected();
						$("#delete-modal-0").modal('hide');
					});

					$("#modal-btn-no0").on("click", function() {
						$("#delete-modal-0").modal('hide');
					});

					$("#modal-btn-yes1").on("click", function() {
						deleteAll();
						$("#delete-modal-1").modal('hide');
					});

					$("#modal-btn-no1").on("click", function() {
						$("#delete-modal-1").modal('hide');
					});

					$("#modal-btn-yes3").on("click", function() {
						var id = $(this).attr("removeid");
						var sid = $(this).attr("serverFileName");
						var fileName = $(this).attr("fileName");

						$.ajax({
							type : "POST",
							data : {
								fileName : fileName,
							},
							url : "/Rapidquote/deleteFile",
							success : function(data) {
								if (data == "success") {
									console.log("Data : " + data);
									singleDelete(id);
									$("#delete-modal-3").modal('hide');
								}
							},
							error : function(error) {
								console.log("Error : " + error.responseText());
							}
						});
					});

					$("#modal-btn-no3").on("click", function() {
						$("#delete-modal-3").modal('hide');
					});

					$('.uploading_block :input[type=checkbox]')
							.click(
									function() {

										if ($(this).prop('checked') == true) {
											$(this).closest('tr').removeClass(
													"unchecked");
											$(this).closest('tr').addClass(
													"checked");
											var filetext = $(this)
													.attr("fname");
											$("#snackbar").text(
													"Part selected : "
															+ filetext);
											snackBar();

										}
										if ($(this).prop('checked') == false) {
											$(this).closest('tr').removeClass(
													"checked");
											$(this).closest('tr').addClass(
													"unchecked");
											var filetext = $(this)
													.attr("fname");
											$("#snackbar").text(
													"Part deselected : "
															+ filetext);
											snackBar();
										}

									});

					$('#remove-modal').on('show.bs.modal', function(event) {
						var div = $(event.relatedTarget);
						var id = div.data('whatever');

						var modal = $(this);
						modal.find('#modal-btn-yes4').attr('removeid', id);

					});

					$('#delete-modal-3').on(
							'show.bs.modal',
							function(event) {
								var div = $(event.relatedTarget); // Button
																	// that
																	// triggered
																	// the modal
								var id = div.data('whatever');
								// alert(id);
								var remove = $("#" + id).attr("removeid");
								// alert(remove);

								var serverFileName = $("#" + id).attr(
										"serverFileName");

								var modal = $(this);
								modal.find('#modal-btn-yes3').attr('removeid',
										remove);
								modal.find('#modal-btn-yes3').attr('fileName',
										serverFileName);

							});

					$("#modal-btn-yes4").on("click", function() {
						var id = $(this).attr("removeid");
						removeitems(id);
					});

					$("#modal-btn-no4").on("click", function() {
						$("#remove-modal").modal('hide');
						/* $('.modal-backdrop').remove(); */
						window.location.href = '/Rapidquote/upload/cart';
					});

					$('#modalSignUpForm')
							.on(
									'hidden.bs.modal',
									function() {
										$(this)
												.find("input,textarea,select")
												.val('')
												.end()
												.find(
														"input[type=checkbox], input[type=radio]")
												.prop("checked", "").end()
												.find("input").css(
														"border-color", "")
												.end().find(".form-group")
												.removeAttr("data-tip").end();
									});

					$('#modalLoginForm')
							.on(
									'hidden.bs.modal',
									function() {
										$(this)
												.find("input,textarea,select")
												.val('')
												.end()
												.find(
														"input[type=checkbox], input[type=radio]")
												.prop("checked", "").end()
												.find("#username").css(
														"border-color", "")
												.end().find("#password").css(
														"border-color", "")
												.end().find(
														"#data-tip-username")
												.removeAttr("data-tip").end()
												.find("#data-tip-password")
												.removeAttr("data-tip").end();
									});
					$("#modal-btn-yes16").unbind('click').click(function() {
						placeOrder();
					});

					$("#modal-btn-no16").on("click", function() {
						$("#confirmOrder-modal").modal('hide');
						window.location.href = '/Rapidquote/upload/cart';
					});


				});