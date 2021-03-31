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


function snackBar2() {
	var x = document.getElementById("snackBar2");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}
function checkAdmin() {
	if (($("#status").val() == "set") && ($("#adminId1").val() == "Admin")) {
		updateHeader();
		viewCustomers("link6");
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



function confirmedAppointment(id) {
	
	
  var userId = id;
    alert(userId);
	

	$.ajax({
		type : "POST",
		url : "/Rapidquote/customer/confirm",
		data : {
			userId:userId
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


function changeLang2() {
	$("#listLang").css("display", "block");
}

function updateLang2() {
	if ($("#langInput2").val() == "") {
		$("#currentLang2").html("English" + '<i class="fa fa-caret-down"></i>');

	} else {

		var lang = $("#langInput2").val();
		console.log("lang : " + lang);
		if ($("#langInput2").val() == "fr") {
			$("#adminName").html("Connexion administrateur");
			$("#currentLang2").html(
					"French  " + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput2").val() == "de") {
			$("#adminName").html("Admin Anmelden");
			$("#currentLang2").html(
					"German  " + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput2").val() == "cn") {
			$("#adminName").html("\u7BA1\u7406\u5458\u767B\u5F55");
			$("#currentLang2").html(
					"Chinese  " + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput2").val() == "sp") {
			$("#adminName").html("Iniciar sesión de administrador");
			$("#currentLang2").html(
					"Spanish" + '<i class="fa fa-caret-down"></i>');
		}
		if ($("#langInput2").val() == "vi") {
			$("#adminName").html("quản trị viên");
			$("#currentLang2").html(
					"Vietnamese" + '<i class="fa fa-caret-down"></i>');
		}

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
