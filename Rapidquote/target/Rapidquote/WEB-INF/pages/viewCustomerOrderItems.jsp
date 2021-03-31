<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
table {
	font-size: smaller;
	width: 100%;
}

/* table, td {
  border-collapse: collapse;
  border: 1px solid #000;
}
 */
th, td {
	text-align: center;
	width: 2.11%; /* to enable "word-break: break-all" */
	padding: 5px;
	word-break: break-all; /* 4. */
}

tr {
	display: table; /* display purpose; th's border */
	width: 100%;
	box-sizing: border-box;
	/* because of the border (Chrome needs this line, but not FF) */
}
</style>
<body>

	<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
		<div class="row">
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<i onclick="viewCustomerOrders('${userId}')" id="backbuttonuser1"
					style="color: #1f6fc0; font-size: 270%; margin: 1%;"
					class="pointer fas fa-arrow-alt-circle-left"></i>
				<!-- <h2 style="color: white; display: inline-block;" id="orderCodeTitle"></h2> -->
				<h2 style="color: white; display: inline-block;">
					<%-- <fmt:message key="message.text108" /> --%>
					${orderCode}
				</h2>
			</div>

		</div>
	</div>
	<table class="table5 view">
		<thead class="thead5" style="background-color: black; color: white;">
			<tr class="tr5">
				<th class="td5"><fmt:message key="message.text34" /></th>
				<th class="td5"
					style="max-width: 40px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><fmt:message
						key="message.message.text4" /></th>
				<th class="td5"><fmt:message key="message.message.text7" /></th>
				<th class="td5"><fmt:message key="message.text35" /></th>
				<th class="td5"><fmt:message key="message.text36" /></th>
				<th class="td5"><fmt:message key="message.text37" /></th>
				<th class="td5"><fmt:message key="message.quoteDetails.text16" /></th>
				<th class="td5"><fmt:message key="message.quoteDetails.text15" /></th>
				<th class="td5"><fmt:message key="message.text10" /></th>
				<th class="td5"><fmt:message key="message.text13" /></th>
				<th class="td5"><fmt:message key="message.text8" /></th>
				<th class="td5"><fmt:message key="message.text5" /></th>
				<th class="td5" colspan="3">Action</th>
			</tr>
		</thead>
		<tbody class="tbody5">
			<div class="tbodydiv">
				<c:forEach items="${beans}" var="bean" varStatus="status">
					<tr class="tr5">
						<td class="td5" orderId="${bean.orderItemId}">ORIM00${bean.orderItemId}</td>
						<td class="td5"
							style="max-width: 40px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
							title="${bean.fileName}" id="file${status.count}">${bean.fileName}</td>
						<td class="td5">${bean.quantity}</td>
						<td class="td5">${bean.coordinate_x}</td>
						<td class="td5">${bean.coordinate_y}</td>
						<td class="td5">${bean.coordinate_z}</td>
						<td class="td5">${bean.actualVolume}</td>
						<td class="td5">${bean.surfaceArea}</td>
						<td class="td5">${bean.processName }</td>
						<td class="td5"
							style="max-width: 40px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
							title="${bean.materialName}">${bean.materialName }</td>
						<td class="td5">${bean.finishingName }</td>
						<td class="td5">${bean.colorName }</td>
						<td><i style="color: rgb(31, 111, 192);"
							id="download${status.count}" ffile="${bean.fileName}"
							sfile="${bean.stlFile}" ufile="${bean.uploadedFileName}"
							onclick="downloadCadFile(this.id);" class="fa fa-download"
							aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp; <i
							style="color: rgb(31, 111, 192);" id="preview${status.count}"
							file="${bean.fileName}" sfile="${bean.stlFile}"
							onclick="getSupplier3DPreview(this.id);" class="fas fa-eye"></i>
						</td>
					</tr>
				</c:forEach>
			</div>
		</tbody>
	</table>



</body>
<%@ include file="pv_3dpreview.jsp"%>