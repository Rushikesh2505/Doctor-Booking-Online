<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<fmt:setBundle basename="messages" />
<%@ include file="links.jsp"%>

<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<body
	style="background-image: url('${pageContext.request.contextPath}/resources/images/maxresdefault.jpg'); ">
	<div class="section7">
		<%@ include file="header2.jsp"%>
		<%@ include file="hidden_admin.jsp"%>
		
	</div>
	<div class="section7">
		<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12"
			style="height: 100%;">
			<div class="row" style="height: 100%;">
				<div class="col-md-2 col-sm-2 col-xs-2 col-lg-2 sidenav">
				
			
							
					<a class="a" id="link6" href="#" onclick="viewCustomers(this.id)" style="margin-top:30%"><h6>
							Patient List</h6></a>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 main"></div>
			</div>

		</div>

	</div>
	<label id="snackbar5" class="promptmessage"></label>
</body>



<script
	src="${pageContext.request.contextPath}/resources/js/admin.js"></script>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/material-charts.js"></script>


<%@ include file="modal_signinAdmin.jsp"%>
<%@ include file="modal_setAdminLogin.jsp"%>




</html>