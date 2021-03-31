<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body
	style="color:white;
background-image: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.5)),url('${pageContext.request.contextPath}/resources/images/maxresdefault.jpg');">
	<div class="section3" style="position: unset; height: 12%">
		<jsp:include page="header3.jsp" />

	</div>
	<div class="section3" style="height: 84%;">
		<div style="padding-top: 5%; padding-left: 30%; padding-right: 30%;">
			<form id="passwordForm">
				<input type="hidden" name="email" id="email" value="${email}">
				<div>
					<label><fmt:message key="message.text73" /> :</label> <input
						class="form-control" type="password" name="password" id="password"
						style=""><br>
				</div>
				<div>
					<label><fmt:message key="message.text74" /> :</label> <input
						class="form-control" type="password" name="confirmPassword"
						id="confirmPassword" style=""><br>
				</div>
				<div class="form-group" style="text-align: center;">
					<button type="button" class="btn " onclick="resetPassword()"
						id="reset_new_password"
						style="font-size: 16px;; font-weight: bold">
						<fmt:message key="message.text72" />
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="section3">
		<footer
			style="color: black; height: 2%; text-align: right; background-color: #d8dee3;">
			<p style="font-size: 90%; margin-left: 1%; float: left;">
				<i class="fa fa-lock" aria-hidden="true"></i> Rapidquote
				<fmt:message key="message.uploadFile.text17" />
			</p>
			<p style="display: inline-block;">Copyright© 2019 TechniSURE</p>&nbsp&nbsp <a href="#">
				<p class="copyright" style="display: inline-block;">
					<fmt:message key="message.other.text8" />
				</p>
			</a>&nbsp&nbsp <a href="#"><p class="copyright"
					style="display: inline-block;">
					<fmt:message key="message.other.text9" />
				</p>
				</a>&nbsp&nbsp
		</footer>
	</div>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="modal_callout.jsp"%>
	<%@ include file="modal_signin.jsp"%>
	<%@ include file="modal_signup.jsp"%>
	<%@ include file="modal_why.jsp"%>
	<%@ include file="modal_delete.jsp"%>
	<%@ include file="hidden_customer.jsp"%>
</body>