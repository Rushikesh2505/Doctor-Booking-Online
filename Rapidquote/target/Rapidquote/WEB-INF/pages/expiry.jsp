<%@ include file="links.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
	<div style="height: 80px;">
		<%@ include file="header4.jsp"%>
	</div>
	<div
		style="text-align: center; height: 200px; background-color: #cc0d0d;">
		<i style="color: white; margin-top: 3%; font-size: 700%;"
			class="fas fa-exclamation-triangle"></i>

	</div>

	<div style="text-align: center;
    margin: 5%;">
	<h2><fmt:message key="message.text64" /></h2>
	
	<h5>To continue using Rapidquote, you need to purchase an Rapidquote Subscription.</h5>
	<h5>For any question or support contact us at info@technisure.com</h5>
<%-- ${subscriptionRecordBean.startDate}
${subscriptionRecordBean.endDate}
${subscriptionRecordBean.planDuration}
${subscriptionRecordBean.supplierBean.firstName}
${subscriptionRecordBean.supplierBean.lastName}
${subscriptionRecordBean.supplierBean.companyName} --%>
	
	</div>

<div >
		<%@ include file="footer.jsp"%>
	</div>

</body>
