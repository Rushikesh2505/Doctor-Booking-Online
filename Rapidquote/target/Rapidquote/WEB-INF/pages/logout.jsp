<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body style="overflow: hidden">
	<div style="height: 10%">
		<jsp:include page="header3.jsp" />
		<input type="hidden" id="userId1" name="userId1"
			value="${user.userId}" /> <input type="hidden" id="userId2"
			name="userId2" value="" />
	</div>
	<div id="loggedOutDiv"
		style="height:85%;background-size: cover;background-image: url('${pageContext.request.contextPath}/resources/images/logout.jpg');">

		<button type="button" class="logoutUploadbutton btn btn-danger"
			onclick="redirectUpload()"><fmt:message key="message.text3" /></button>
		<br>
	</div>
	<div style="height: 5%">
		<%@ include file="footer.jsp"%>
	</div>
		<%@ include file="modal_signin.jsp"%>
	<%@ include file="modal_signup.jsp"%>
	<%@ include file="modal_why.jsp"%>
</body>
