var fieldSet = [ "{Volume}", "{Density}", "{Rate}", "{SurfaceArea}",
		"{LayerThickness}", "{Infill}", "{BBoxX}", "{BBoxY}", "{BBoxZ}" ];
var operatorSet = [ "+", "-", "*", "/", "^" ];

var textAreaStatus;

function activea(id) {
	$(".sidenav").find('.a').removeClass("activeA");
	$("#" + id).addClass("activeA");
}

function snackBar5() {
	var x = document.getElementById("snackbar5");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}


/*function snackBar2() {
	var x = document.getElementById("snackBar2");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}*/
function checkAdmin() {
	if (($("#status").val() == "set") && ($("#adminId1").val() == "Admin")) {
		updateHeader();
		viewOrders("link5");
	} else
	// alert($("#status").val());
	if (($("#status").val() == "unset")) {
		$('#modalSetFormAdmin').modal({
			backdrop : 'static',
			keyboard : false
		});
	} else if (($("#status").val() == "set")) {
		// alert($("#adminId1").val());
		// alert($("#adminId2").val());
		if (($("#adminId1").val() == "") && ($("#adminId2").val() == "")) {
			$('#modalLoginFormAdmin').modal({
				backdrop : 'static',
				keyboard : false
			});
		}
	} else {
		if (($("#adminId1").val() == "") && ($("#adminId2").val() == "")) {
			$('#modalLoginFormAdmin').modal({
				backdrop : 'static',
				keyboard : false
			});
		}
	}
}

function clear() {
	$("#addCurrencyForm #countryName").val("");
	$("#addCurrencyForm #currencyName").val("");
}




function logoutAdmin() {

	$("#adminId1").attr("value", "");
	$("#adminId2").attr("value", "");
	$("#signOutAdmin").css("display", "none");
	$("#signInAdmin").css("display", "block");
	$("#signUpAdmin").css("display", "block");
	$("#adminName").css("display", "none");
	checkAdmin();
	window.location.href = '/Rapidquote/admin/logout';
}

function updateHeader() {
	$("#signInAdmin").css("display", "none");
	$("#signUpAdmin").css("display", "none");
	$("#signOutAdmin").css("display", "block");
}

function setAdmin() {

	var sth = true;
	$('#setFormAdmin .form-control').each(
			function() {
				if (($(this).val() == "")
						|| ($(this).css("border-color") === "rgb(255, 0, 0)")) {
					$(this).css("border-color", "red");
					$(this).parent().attr("data-tip",
							"Fields should not be empty");
					sth = false;
				}

			});
	// alert(sth);
	if (sth == true) {
		var data1 = $("#setFormAdmin #setUsernameAdmin").val();

		var data2 = $("#setFormAdmin #setAdminPassword").val();

		$.ajax({
			type : "GET",
			data : {
				username : data1,
				password : data2
			},
			url : "/Rapidquote/admin/setauthenticate",
			contentType : 'application/json',
			success : function(data) {
				// console.log(data);
				if (data == "Error") {
					$("#data-tip-username").attr("data-tip",
							"User Name Invalid");
					$("#data-tip-username #username")
							.css("border-color", "red");
				}
				if (data == "Error") {
					$("#data-tip-password")
							.attr("data-tip", "Password Invalid");
					$("#data-tip-password #password")
							.css("border-color", "red");
				} else {
					$("#adminId2").attr("value", data);
					$("#modalSetFormAdmin").modal('hide');
					viewOrders("link5");
				}
				updateHeader();
				// console.log(data);
			},
			error : function(a, b, c) {
				alert("error");
				console.log(a + b + c);
			}
		});
	}
}

function loginAdmin() {

	var sth = true;
	$('#loginFormAdmin .form-control').each(
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
		var data1 = $("#loginFormAdmin #usernameAdmin").val();
		// alert(data1);
		var data2 = $("#loginFormAdmin #signInpasswordAdmin").val();
		// alert(data2);

		$.ajax({
			type : "GET",
			data : {
				username : data1,
				password : data2
			},
			url : "/Rapidquote/admin/authenticate",
			contentType : 'application/json',
			success : function(data) {
				console.log(data);
				if (data == "Error") {
					$("#data-tip-username").attr("data-tip",
							"User Name Invalid");
					$("#data-tip-username #username")
							.css("border-color", "red");
				}
				if (data == "Error") {
					$("#data-tip-password")
							.attr("data-tip", "Password Invalid");
					$("#data-tip-password #password")
							.css("border-color", "red");
				} else {
					
					$("#adminId2").attr("value", data);
					$("#modalLoginFormAdmin").modal('hide');
					viewCustomers("link6");
				}
				updateHeader();
				// console.log(data);
			},
			error : function(a, b, c) {
				alert("error");
				console.log(a + b + c);
			}
		});
	}

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


function viewCustomers(id) {
	activea(id);
	$.ajax({
		url : "/Rapidquote/customer/viewCustomers",
		cache : false,
		headers : {
			Accept : "*/*"
		},
		type : "GET",
		contentType : "application/json",
		success : function(data) {
			// console.log(data);
			// alert(data);
			$(".main").html(data);
		},
		error : function(a, b, c) {
			alert("error");
			console.log(a + b + c);
		}
	});
}



function viewReport(id){
	
}

function confirmedOrder(id) {

 var userId =  $("." + class).attr("userId");


$.ajax({
	type : "POST",
	url : '/customer/confirm',
	data : {
		orderId : orderId
	
	},
	success : function(data) {
		$(".fa fa-check").css("color", "green");
		$("#snackBar2").css("background-color", "#3d9c23c7");
		$("#snackBar2").text("Appointment Confirmed Successfully");
		snackBar2();
		
	//	console.log(data);
	},
	error : function(e) {
		console.log(e);
		console.log(e.responseText);
	}
});

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


function updateShippingCost(id) {

	$.ajax({
		url : "/Rapidquote/shippingCost/getSingleShippinCost",
		cache : false,
		headers : {
			Accept : "*/*"
		},
		data : {
			shippingCostId : id
		},
		type : "GET",
		contentType : "application/json",
		success : function(data) {
			console.log("data" + data);
			$("#modalEditShippingCost .modal-content").html(data);
			$("#modalEditShippingCost").modal('show');
		},
		error : function(e) {
			console.log(e.responseText);
			console.log("ERROR : ", e);

		}
	});

}

function editShippingCost() {

	var shippingCostId = $("#editShippingCostForm #shippingCostId").val();
	var minWeight = $("#editShippingCostForm #editMinWeight").val();
	var maxWeight = $("#editShippingCostForm #editMaxWeight").val();
	var cost = $("#editShippingCostForm #editCost").val();
	var createdBy = $("#editShippingCostForm #createdBy").val();
	var createdDate = $("#editShippingCostForm #createdDate").val();

	var sth = true;

	$('#editShippingCostForm .check').each(function() {
		var booln = $(this)[0].hasAttribute("data-tip");

		if (booln == true) {
			sth = false;
		}
	});

	var valCheck = true;
	$('#editShippingCostForm .valCheck').each(function() {

		if ($(this).val() == "") {
			$(this).css("border-color", "red");
			$(this).parent().attr("data-tip", "Fields should not be empty");
			valCheck = false;
		}
	});
	if (sth == true && valCheck == true) {

		if (!minWeight == "") {

			var shippingCostBean = {
				shippingCostId : shippingCostId,
				minWeight : minWeight,
				maxWeight : maxWeight,
				cost : cost,
				createdBy : createdBy,
				createdDate : createdDate
				
			};
			console.log(JSON.stringify(shippingCostBean));
			$.ajax({
				type : 'POST',
				url : '/Rapidquote/shippingCost/editShippingCost',
				contentType : 'application/json',
				data : JSON.stringify(shippingCostBean),
				success : function(data) {
					console.log(data);
					$("#modalEditShippingCost").modal('hide');
					$("#snackbar5").css("background-color", "#3d9c23c7");
					$("#snackbar5").text("Updated Successfully");
					snackBar5();
					viewShippingCost();
				},
				error : function(e) {
					$("#modalEditShippingCost").modal('hide');
					$("#snackbar5").css("background-color", "red");
					$("#snackbar5").text("Failed to update");
					snackBar5();
					viewShippingCost();
					$("#result").text(e.responseText);
					console.log("ERROR : ", e);
				}
			});
		}
	} else {
	}
}


function checkContactFSNumber(id) {
	var regexp = /^\d{0,50}(\.\d{1,2})?$/;
	var sth = $("#" + id).val();
	if (!regexp.test(sth)) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Enter numeric characters");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}

function checkNotEmpty(id) {
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	}

	else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}


function viewInfill(id) {
	activea(id);
	
	$.ajax({
		url : "/Rapidquote/infill/viewInfill",
		cache : false,
		headers : {
			Accept : "*/*"
		},
		type : "GET",
		contentType : "application/json",
		success : function(data) {
			// console.log(data);
			// alert(data);
			$(".main").html(data);
			$("#dashSupplier").css("display", "none");
			$(".main").css("display", "block");

		},
		error : function(a, b, c) {
			// alert("error");
			console.log(a + b + c);
		}
	});

}




function checkInfill(id) {

	var infillType = $("#addInfillForm #infillType").val();
	
	if (!infillType == "") {

		$.ajax({
			type : "GET",
			url : '/Rapidquote/infill/isInfillExists',
			data : {
				infillType : infillType,
			
			},
			contentType : "application/json",
			success : function(data) {
				console.log("Infill exists : " + data);
				if (data == "true") {
					$("#addInfillForm #InfillDiv").attr("data-tip",
							"InfillType Exists");
					$("#addInfillForm #infillType").css("border-color",
							"rgb(255, 0, 0)");
				} else {
					$("#addInfillForm #InfillDiv").removeAttr("data-tip",
							"InfillType Exists");
					$("#addInfillForm #infillType").css("border-color", "");
				}
				console.log(data);
			},
			error : function(e) {
				console.log(e);
				console.log(e.responseText);
			}
		});

	}

}





function checkContactFMNumber(id) {
	var regexp = /^\d{0,4}(\.\d{1,3})?$/;
	var sth = $("#" + id).val();
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else if (!regexp.test(sth)) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent()
				.attr("data-tip", "Please enter numeric characters");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}

function checkContactFPNumber(id) {
	var regexp = /^\d{0,50}(\.\d{1,2})?$/;
	var sth = $("#" + id).val();
	if (!regexp.test(sth)) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Enter numeric characters");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}

function checkContactFNumber(id) {
	var regexp = /^\d{0,2}(\.\d{1,2})?$/;
	var sth = $("#" + id).val();
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else if (!regexp.test(sth)) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent()
				.attr("data-tip", "Please enter numeric characters");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}

function checkNotEmpty(id) {
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	}

	else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}
}


function addAddInfillBtn() {
	if ($('#infillFactor').prop("checked") == true) {
	/*	alert("HIiiiiiiiiiiiiiii");*/
		$("#btn_op_1155").css("display", "inline-block");
	} else if ($('#infillFactor').prop("checked") == false) {
		$("#btn_op_1155").css("display", "none");
		var formula = $("#formulaSpace").val();
		var str1 = formula;
		var str2 = "Infill";
		if (str1.indexOf(str2) != -1) {
			$("#formulaSpace").val('');
		}
	}
}

function addAddLayerBtn() {
	if ($('#layerThicknessFactor').prop("checked") == true) {		
		$("#btn_op_1156").css("display", "inline-block");

	} else if ($('#layerThicknessFactor').prop("checked") == false) {
		$("#btn_op_1156").css("display", "none");
		var formula = $("#formulaSpace").val();
		var str1 = formula;
		var str2 = "LayerThickness";
		if (str1.indexOf(str2) != -1) {
			$("#formulaSpace").val('');
		}
	}
}

function checkForInteger(id) {

	var regexp = /^[1-9]\d*$/;
	var sth = $("#" + id).val();
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else if (!regexp.test(sth)) {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Please enter Integer Value");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
	}

}
function validate(formula) {
	var Volume = 100;
	var Density = 1.5;
	var Rate = 100;
	var SurfaceArea = 100;
	var LayerThickness = 1;
	var Infill = 1;
	var BBoxX = 1;
	var BBoxY = 1;
	var BBoxZ = 1;
	try {
		var ret = eval(formula);
		if (ret && ret != "NaN") {
			return true;
		}
		return false;
	} catch (e) {
		return false;
	}
}

function clearTextArea() {

	/*
	 * $("#editformulaSpace").attr("value",""); $("#editformulaSpace").val("");
	 * $("#editformulaSpace").text("");
	 */

	$(".formulaTextArea").val("");
	$(".formulaTextArea").text("");
	$(".formulaTextArea").attr("value", "");
	$("#editformulaSpace").attr("data-tip", "");
	$("#editformulaSpace").css("border-color", "");

}


function passwordCheckA(id) {
	if ($("#" + id).val() == "") {
		$("#" + id).css("border-color", "red");
		$("#" + id).parent().attr("data-tip", "Fields should not be empty");
	} else {
		$("#" + id).css("border-color", "");
		$("#" + id).parent().removeAttr("data-tip");
		var password = $("#setAdminPassword").val();
		// alert(password);
		var confirmPassword = $("#" + id).val();
		// alert(confirmPassword);
		if (password != confirmPassword) {
			$("#" + id).css("border-color", "red");
			$("#" + id).parent().attr("data-tip", "Password do not match");
		} else {
			$("#" + id).css("border-color", "");
			$("#" + id).parent().removeAttr("data-tip");
		}
	}
}

function fx(element) {
	element.focus();
	element.setSelectionRange(element.value.length, element.value.length);
}







function checkCharacter(event) {
	var pattern = /[0-9]|[\.]|[\(|\)]/g;

	var value = event.key;
	// alert(value);
	var check = $("#editformulaSpace").val();
	// alert(check);
	var lastChar = check[check.length - 1];
	// alert(lastChar);
	if (lastChar == "}") {
		event.preventDefault();
		return false;
	}

	if (pattern.test(value) == true) {
		// alert("allow");
	} else {
		// alert("not-allow");
		event.preventDefault();
		return false;
	}
}


function checkCharacter(event) {
	var pattern = /[0-9]|[\.]|[\(|\)]/g;

	var value = event.key;
	// alert(value);
	var check = $("#edit_formulaSpace").val();
	// alert(check);
	var lastChar = check[check.length - 1];
	// alert(lastChar);
	if (lastChar == "}") {
		event.preventDefault();
		return false;
	}

	if (pattern.test(value) == true) {
		// alert("allow");
	} else {
		// alert("not-allow");
		event.preventDefault();
		return false;
	}
}

$(document).ready(
		function() {
			checkAdmin();

			
							
		});
