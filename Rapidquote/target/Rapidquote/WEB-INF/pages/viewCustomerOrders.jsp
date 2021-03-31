<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="links.jsp" />

<style>
table {
	width: 100%;
}

thead {
	display: table; /* to take the same width as tr */
	width: calc(100% - 17px); /* - 17px because of the scrollbar width */
}

tbody {
	display: block; /* to enable vertical scrolling */
	max-height: 480px; /* e.g. */
	overflow-y: scroll;
	/* keeps the scrollbar even if it doesn't need it; display purpose */
}

th, td {
	text-align: center;
	width: 11.11%; /* to enable "word-break: break-all" */
	padding: 5px;
	word-break: break-all; /* 4. */
}

tr {
	display: table; /* display purpose; th's border */
	width: 100%;
	box-sizing: border-box;
	/* because of the border (Chrome needs this line, but not FF) */
}

td {
	text-align: center;
	border-bottom: none;
	border-left: none;
}
</style>
<body style="">
	<!-- <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
<div class="row">
<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
<i onclick="viewOrders1()" id="backbutton_User"
style="display:none;color: #1f6fc0; font-size: 270%; margin: 1%;"
class="pointer fas fa-arrow-alt-circle-left"></i>
<i onclick="getOrders()" id="backbuttonuser"
style="display:none;color: #1f6fc0; font-size: 270%; margin: 1%;"
class="pointer fas fa-arrow-alt-circle-left"></i>
<h2 style="color:white;display: inline-block;" id="orderCodeTitle"></h2>


</div>

</div>
</div> -->
	<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
		<div class="row">
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<i onclick="viewCustomers()" id="backbutton_User" id="${userId}"
					style="display: none; color: #1f6fc0; font-size: 270%; margin: 1%;"
					class="pointer fas fa-arrow-alt-circle-left"></i>
				<h2 style="display: inline-block; color: white;">
					<fmt:message key="message.text1" />
				</h2>

			</div>

		</div>
	</div>
	<%-- <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
<div class="row">
<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
<h2 style="color:white;"><fmt:message key="message.text1" /></h2>

</div>

</div>
</div> --%>
	<table class="view">
		<thead class="thead1">
			<tr>
				<%-- <th style="width: 10%;text-align: center;"><fmt:message key="message.orders.text1" /></th> --%>
				<th><fmt:message key="message.orders.text2" /></th>
				<th><fmt:message key="message.orders.text3" /></th>
				<th><fmt:message key="message.orders.text4" /></th>
				<th><fmt:message key="message.orders.text5" /></th>
				<th><fmt:message key="message.orders.text6" /></th>
				<th><fmt:message key="message.orders.text7" /></th>
				<%-- <th style="text-align: center;width: 10%"><fmt:message key="message.message.text8" /></th>
<th style="text-align: center;width: 10%"><fmt:message key="message.message.text9" /></th> --%>
			</tr>
		</thead>
		<tbody id="">
			<c:forEach items="${item}" var="item" varStatus="theCount">
				<tr>
					<%-- <td style="width: 10%;text-align: center;">${theCount.count}</td> --%>
					<td style="overflow: hidden; text-overflow:"
						userId="${item.userId}" orderId="${item.orderId}"ellipsis;white-space:nowrap;">${item.orderCode}</td>
					<td>${item.totalCost}</td>
					<td>${item.noOfItems}</td>
					<td>${item.orderDate}</td>
					<td>${item.orderStatus}</td>
					<td><i onclick="viewCustomerOrderItems(this.id)"
						id="sth${theCount.index}" orderCode="${item.orderCode}"
						orderId="${item.orderId}" userId="${userId}"
						class="pointer fas fa-eye" style="color: #1f6fc0;"></i>
						</td>
				
				</tr>
			</c:forEach>
		</tbody>
	</table>



	<div class="section4">
		<%@ include file="footer.jsp"%>
	</div>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="hidden_customer.jsp"%>

	<script>
$(document).ready(function() {
checkOrderData();
});
</script>

</body>