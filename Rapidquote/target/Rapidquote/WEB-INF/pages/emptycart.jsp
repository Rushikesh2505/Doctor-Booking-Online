 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body style="overflow: hidden">
	<div class="section7">
		<%@ include file="header3.jsp"%>
		
	</div>
	<div class="emptycart_panel container-fluid">
		<div>
			<label class="messagecart">"<fmt:message key="message.message.text2" />"</label><br> <img
				src="${pageContext.request.contextPath}/resources/images/empty-cart.png"
				alt="Smiley face" height="160" width="160"><br>
			<button type="button" class="emptyUploadbutton btn btn-danger"
				onclick="redirectUpload()"><fmt:message key="message.message.text1" /> +</button>
			<br>
		</div>

	</div>
	<%@ include file="footer.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
		<%@ include file="modal_langAlert.jsp"%>
		<%@ include file="hidden_customer.jsp"%>
			<%@ include file="modal_profile.jsp"%>
</body>

 
<%--  
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body style="overflow: hidden">
	<div class="section7">
		<%@ include file="header3.jsp"%>

	</div>
	<div class="emptycart_panel container-fluid">
		<div>
			<label class="messagecart">"<fmt:message
					key="label.message.text2" />"
			</label><br> <img
				src="${pageContext.request.contextPath}/resources/images/empty-cart.png"
				alt="Smiley face" height="160" width="160"><br>
			<button type="button" class="emptyUploadbutton btn btn-danger"
				onclick="redirectUpload()">
				<fmt:message key="label.message.text1" />
				+
			</button>
			<br>
		</div>

	</div>
	<%@ include file="footer.jsp"%>
	<%@ include file="hidden_customer.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="modal_langAlert.jsp"%>
</body>

  --%>