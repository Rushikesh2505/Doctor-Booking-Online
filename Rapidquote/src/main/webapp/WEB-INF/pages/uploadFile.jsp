<%@ include file="links.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body
	style="background-image: url('${pageContext.request.contextPath}/resources/images/dd.jpg'); ">
	<div class="section">
		<%@ include file="header.jsp"%>
		
	</div>
<div>

<a id="signUp" href="#"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"
				data-toggle="modal" data-target="#modalSignUpForm">Book Appointment</a>
</div>
	<%@ include file="hidden_customer.jsp"%>
	<%@ include file="modal_callout.jsp"%>
	<%@ include file="modal_signin.jsp"%>
	<%@ include file="modal_signup.jsp"%>

	<%@ include file="modal_notify.jsp"%>

	<%-- <%@ include file="modal_profile.jsp"%> --%>
	

</body>

