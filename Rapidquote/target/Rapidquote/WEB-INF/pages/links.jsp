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
<%-- <link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet"> --%>
	
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
	
	<link href="${pageContext.request.contextPath}/resources/css/faqCSS.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cadView.js"></script>
<!-- <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous"> -->


<!-- <script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true"></script> -->

<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>


<script
	src="${pageContext.request.contextPath}/resources/scripts/three.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/OrbitControls5.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/STLLoader.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/OBJLoader.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/scripts/STLExporter.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/scripts/CSS2DRenderer.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/STLExporter.js"></script>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/3dlogo.png">
	
	<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<title>3D PRINTING QUOTE SYSTEM</title>
</head>