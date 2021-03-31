<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${param.lang}">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/ts3d.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/iphone.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- <script type="text/javascript"
src="http://maps.googleapis.com/maps/api/js?sensor=true"></script> -->

<script
	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.ui.widget.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>



<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/3dlogo.png">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<title>3D PRINTING QUOTE SYSTEM</title>
</head>
<style>
.quote table {
	border-collapse: collapse;
	width: 100%;
}

.quote th, .quote td {
	text-align: left;
	padding: 8px;
	
}

/* #shipping_block td, #quote_block td {
	padding: unset;
} */
#shipping_block tr {
	border: 1px solid #ddd;
/ 	line-height: 1; /
	    font-size: 1vw;
	/ font-size: 15px; /
	/  font-style:normal; /
	  font: normal 14px arial;
	
}

#item_block tr, #item_block1 tr, #manufacturing_block tr {
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
/* 	line-height: 1;
	font-size: 15px; */
	/ font-style:normal; /
font: normal 14px arial; 
	     font-size: 1vw;
	 color:black;
	
}



#quote_block tr, #remark tr, #shipping_block tr{

/* line-height: 1;
font-size: 15px; */
 color:black;
/  font-style:normal; /
line-height: 0.3;
 font: normal 14px arial;
     font-size: 1vw;
/  font-family: Arial, Helvetica, sans-serif; /
}



/* .quote tr:nth-child(even) {
	background-color: lightblue;
}

.quote tr:hover {
	background-color: #ddd;
} */

/* .quote tr:nth-child(even) {
	background-color: lightblue;
}

.quote tr:hover {
	background-color: #ddd;
}
 */
body {
	background-color: white;
}

.print {
	background-color: white;
	/ font-family: arial; /
/ 	font-style:normal; /
 font: normal 14px arial;
    font-size: 1vw;
	/ border-width: 2px; /
	/ border-style: dotted; /
	/ //padding: 1em; /
	/ font-size: 170%; /
	/ font-size: 1.25rem; /
	/ line-height: 1.8em; /
	/ //margin : 2%; /
}
</style>
<body>
	<div class="print container-fluid" id="content" style="display: none;">
		<img class="img-ts3d1"
			src="${pageContext.request.contextPath}/resources/images/logo.png" />
		<br>
		<table class="table table-bordered" style="margin-top: 1%;">

			<tbody id="quote_block">
				<tr>
					<td style="padding-left: 10px;"><b>Quote No. :</b>
						<p style="display: inline-block;"></p></td>
					<td style="padding-left: 10px;"><b>Date :</b>
						<p style="display: inline-block;"></p></td>

				</tr>
				<tr>
					<td style="padding-left: 10px;"><b>To :</b>
						<p style="display: inline-block;"></p></td>
					<td style="padding-left: 10px;"><b>Attn :</b>
						<p style="display: inline-block;"></p></td>

				</tr>

			</tbody>
		</table>

		<table class="table" id="item_block" style="margin-top: 3%;">
			<thead>
				<tr style="color:black;">
					<th>No.</th>
					<th>Part Name</th>
					<th>Specifications</th>
					<th>Unit Price (USD)</th>
					<th>Qty (PCS)</th>
					<th>Total (USD)</th>
				</tr>
			</thead>
			<tbody id="quoteTable">
			</tbody>
		</table>

<!-- 
		<table class="view table quote quotetableHeader1" id="item_block1">
			<thead>
				<tr>
					<th>No.</th>
					<th>Part Name</th>
					<th>Specifications</th>
					<th>Unit Price (USD)</th>
					<th>Qty (PCS)</th>
					<th>Total (USD)</th>
				</tr>
			</thead>
			<tbody id="quotetableBody1">
			</tbody>
		</table>
 -->

		<table class="table table-bordered" id="shipping_block" style="margin-top: 3%;">
			<tbody>
				<tr style="border-bottom: unset; line-height: 0.3;">
					<td style="width: 85%; text-align: right; padding-right: 5px;"><b>Order
							Total</b> :</td>
					<td style="width: 15%; padding-left: 10px;" id="subTotalQuote"></td>
				</tr>
				<tr style="border-bottom: unset; line-height: 0.3;">
					<td style="width: 85%; text-align: right; padding-right: 5px;"><b>Shipping</b>
						:</td>
					<td style="width: 15%; padding-left: 10px;"></td>
				</tr>
				<tr style="line-height: 0.3;">
					<td style="width: 85%; text-align: right; padding-right: 5px;"><b>Total:</b>
					</td>
					<td style="width: 15%; padding-left: 10px;" id="totalCostQuote"></td>
				</tr>
			</tbody>
		</table>


		<table class="table" id="manufacturing_block"
			style="margin-top: 3%; line-height: 0.8; margin-right: 3%;">
			<thead>
				<tr>
					<th style="text-align: center;">Manufacturing Time(days)</th>
					<th style="text-align: center;">Shipping Time(days)</th>
					<th style="text-align: center;">Total Lead Time(days)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: center;">9</td>
					<td style="text-align: center;">3</td>
					<td style="text-align: center;">12</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-bordered" id="remark"
			style="margin-top: 1%; line-height: 0.8;">
			<thead>
				<tr>
					<th>Remarks:</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>

		<div class="quoteFooter" style="margin-top: 3%; color: black;">

			<div style="line-height: 1.3; font-size: 1vw; color: black;">
				<label style="margin-bottom: unset; font-size: 1vw;"
					id="quotePerson">Contact Person : </label><br> <label
					style="margin-bottom: unset; font-size: 1vw;"
					id="quoteContactNumber">Contact Number : </label><br> <label
					style="margin-bottom: unset; font-size: 1vw;"
					id="quoteContactEmail">Email :</label><br> <label
					style="width: 50%; margin-bottom: unset; font-size: 1vw;"
					id="quoteAddress">Address : </label>
			</div>

		</div>


	</div>
</body>
<embed id="frPDF" height="10" type="application/pdf" width="800"
	src="http://eurecaproject.eu/files/5013/9885/7113/example4.pdf"></embed>
</html>