<%@ include file="links.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body
	style="background-image: url('${pageContext.request.contextPath}/resources/images/maxresdefault.jpg'); ">
	<div class="section">
		<%@ include file="header.jsp"%>
		
	</div>

	<%@ include file="hidden_customer.jsp"%>
	<%@ include file="modal_profile.jsp"%>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="modal_callout.jsp"%>
	<%@ include file="modal_signin.jsp"%>
	<%@ include file="modal_signup.jsp"%>
	<%@ include file="modal_why.jsp"%>
	<%@ include file="modal_delete.jsp"%>
	<%@ include file="modal_notify.jsp"%>
	<%@ include file="modal_forgotPassword.jsp"%>
	<%-- <%@ include file="modal_profile.jsp"%> --%>
	

</body>

