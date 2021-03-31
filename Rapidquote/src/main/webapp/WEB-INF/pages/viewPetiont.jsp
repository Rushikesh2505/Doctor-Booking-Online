<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<body>
<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
		<div class="row">
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<h2 style="color:white;"><fmt:message key="message.text107" /></h2>
				
			
			</div>
			
		</div>
	</div>
	<table class="view">
		<thead style="background-color: black; color: white;">
			<tr>
				<th><fmt:message key="message.text22" /></th>
				<th><fmt:message key="message.other.text10" /></th>
				<th><fmt:message key="message.text23" /></th>
				<th>Age</th>
				<th><fmt:message key="label.text32" /></th>
				<th>Booking Date</th>
				<th>DOB</th>
				<th><fmt:message key="message.text27" /></th>
			</tr>
		</thead>
		<tbody class="tbody">
			<c:forEach items="${list}" var="item" varStatus="theCount">
				<tr>
					<td>${item.firstName}</td>
					<td>${item.contactEmail}</td>
					<td>${item.contactNumber}</td>.
					<td>${item.age}</td>
					<td>${item.address}</td>
					<td>${item.booking}</td>
					<td>${item.birthdate}
					<td> <i onclick="confirmedAppointment(this.id)" data-toggle="tooltip" title="Confirmed Appointment" id="${item.userId}" class="fa fa-envelope" style="color: #1f6fc0;font-size: x-large;"></i> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>