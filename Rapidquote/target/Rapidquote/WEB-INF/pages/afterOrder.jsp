<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body style="overflow: hidden">
	<div class="section6">
		<%@ include file="header3.jsp"%>
		<label id="snackbar3" class="promptmessage"></label> <input
			type="hidden" id="userId1" name="userId1" value="${user.userId}" />
		<input type="hidden" id="userId2" name="userId2" value="" />
	</div>
	<div class="afterOrderemptycart_panel container-fluid">
		<div>
			<label class="messageorder"><fmt:message key="message.message.text3" />:${orderNos}</label><br> 
			<label
				class="messagecart">"<fmt:message key="label.message.text11" />"</label><br>
			<img
				src="${pageContext.request.contextPath}/resources/images/empty-cart.png"
				alt="Smiley face" height="160" width="160"><br>

			<button type="button" class="emptyUploadbutton btn btn-danger"
				onclick="redirectUpload()"><fmt:message key="message.message.text1" /> +</button>
			
			<br> <input type="hidden" id="orderNo" value="${orderNos}" />
			<button style="display:none" id="getquote" onclick="saveQuotePdf()"></button>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
		<%@ include file="modal_langAlert.jsp"%>
		<%@ include file="hidden_customer.jsp"%>
		<%@ include file="quote.jsp"%>
</body>


<script>
	$(document).ready(function() {
		$("#getquote").trigger("click");
	});
</script>