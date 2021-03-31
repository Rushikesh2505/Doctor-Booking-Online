<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<i onclick="viewOrders1()" id="backbuttonall"
					style="display: none; color: #1f6fc0; font-size: 270%; margin: 1%;"
					class="pointer fas fa-arrow-alt-circle-left"></i> <i
					onclick="getOrders()" id="backbuttonuser"
					style="display: none; color: #1f6fc0; font-size: 270%; margin: 1%;"
					class="pointer fas fa-arrow-alt-circle-left"></i>
				<h2 style="color: white; display: inline-block;" id="orderCodeTitle"></h2>


			</div>

		</div>
	</div>
	<table class="table5 view">
		<thead class="thead5" style="background-color: black; color: white;">
			<tr class="tr5">
				<th class="td5"><fmt:message key="message.text34" /></th>
				<th class="td5"
					style="max-width: 50px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><fmt:message
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
							id="file${status.count}">${bean.fileName}</td>
						<td class="td5">${bean.quantity}</td>
						<td class="td5">${bean.coordinate_x}</td>
						<td class="td5">${bean.coordinate_y}</td>
						<td class="td5">${bean.coordinate_z}</td>
						<td class="td5">${bean.actualVolume}</td>
						<td class="td5">${bean.surfaceArea}</td>
						<td class="td5">${bean.processName }</td>
						<td class="td5"
							style="max-width: 40px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
							title="${bean.materialName}">${bean.materialName}</td>
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
<%@ include file="pv_3dpreview.jsp"%> --%>

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
zoom:93%;
	text-align: center;
	width: 4.11%; /* to enable "word-break: break-all" */
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
				<i onclick="viewOrders1()" id="backbuttonall"
					style="display: none; color: #1f6fc0; font-size: 270%; margin: 1%;"
					class="fas fa-arrow-alt-circle-left pointer"></i> <i
					onclick="getOrders()" id="backbuttonuser"
					style="display: none; color: #1f6fc0; font-size: 270%; margin: 1%;"
					class="fas fa-arrow-alt-circle-left"></i>
				<h2 style="color: white; display: inline-block;" id="orderCodeTitle"></h2>
			</div>
		</div>
	</div>
	<table class="table5 view">
		<thead class="thead5" style="background-color: black; color: white;">
			<tr class="tr5">
				<th class="wrapCol4"><fmt:message key="label.text34" /></th>
				<th class="wrapCol4"><fmt:message key="label.message.text4" /></th>
				<th class="wrapCol4"><fmt:message key="label.text10" /></th>
				<th class="wrapCol4"><fmt:message key="label.text13" /></th>
				<th class="wrapCol4"><fmt:message key="label.text8" /></th>
				<th class="wrapCol4"><fmt:message key="label.text5" /></th>
				<th class="wrapCol4"><fmt:message key="tabel.text.msg1"/>(%)</th>
				<th class="wrapCol4"><fmt:message key="tabel.text.msg2"/>(&micro;)</th>
				<th class="wrapCol4"><fmt:message key="tabel.text.msg3"/>(${currency.currencyName})</th>
				<th class="wrapCol4"><fmt:message key="label.message.text7" /></th>
				<th class="wrapCol4"><fmt:message key="tabel.text.msg4"/>(${currency.currencyName})</th>
				<th class="wrapCol4"><fmt:message key="tabel.text.msg5"/>(Kg)</th>
				<th class="wrapCol4"><fmt:message key="tabel.text.msg6"/></th>
				<th class="wrapCol4" colspan="3">Action<fmt:message key="tabel.text.msg7"/></th>
			</tr>
		</thead>
		<tbody class="tbody5">
			<div class="tbodydiv">
				<c:forEach items="${beans}" var="bean" varStatus="status">
					<tr class="tr5">
						<td class="td5 wrapCol2" orderId="${bean.orderItemId}">ORIM00${bean.orderItemId}</td>
						<td class="td5 wrapCol2" data-toggle="tooltip" title="${bean.fileName}"
							id="file${status.count}">${bean.fileName}</td>
						<td class="td5 wrapCol2" title="${bean.processName}" data-toggle="tooltip">${bean.processName}</td>
						<td class="td5 wrapCol2" title="${bean.materialName}" data-toggle="tooltip">${bean.materialName}</td>
						<td class="td5 wrapCol2" title="${bean.finishingName}" data-toggle="tooltip">${bean.finishingName}</td>
						<td class="td5 wrapCol2" title="${bean.colorName}" data-toggle="tooltip">${bean.colorName}</td>
						<td class="td5 wrapCol2" title="${bean.infillPercentage}" data-toggle="tooltip">${bean.infillPercentage}</td>
						<td class="td5 wrapCol2" title="${bean.layerThickness}" data-toggle="tooltip">${bean.layerThickness}</td>
						<td class="td5 wrapCol2" title="${bean.unitCost}" data-toggle="tooltip">${bean.unitCost}</td>
						<td class="td5 wrapCol2" title="${bean.quantity}" data-toggle="tooltip">${bean.quantity}</td>
						<td class="td5 wrapCol2" title="${bean.totalCost}" data-toggle="tooltip">${bean.totalCost}</td>
						<td class="td5 wrapCol2" title="${bean.totalWeight}" data-toggle="tooltip">${bean.totalWeight}</td>
						<td class="td5 wrapCol2" title="${bean.note}" data-toggle="tooltip">${bean.note}</td>
						<td>
						<i style="color: rgb(31, 111, 192);"
							id="download${status.count}" ffile="${bean.fileName}"
							sfile="${bean.stlFile}" ufile="${bean.uploadedFileName}"
							onclick="downloadCadFile(this.id);" class="fa fa-download"
							aria-hidden="true" title="Download CAD Files" data-toggle="tooltip"></i>
							&nbsp;&nbsp;&nbsp;&nbsp;
						<i 
							style="color: rgb(31, 111, 192);" id="preview${status.count}"
							file="${bean.fileName}" sfile="${bean.stlFile}"
							title="View 3D Preview" data-toggle="tooltip" onclick="getSupplier3DPreview(this.id);" class="fas fa-eye"></i>
							&nbsp;&nbsp;&nbsp;&nbsp;
						<i orderId="${bean.orderItemId}" onclick="downloadAttachment(this.id)" style="color: rgb(31, 111, 192);font-size: medium;font-weight: bold;" title="Download Attachments" data-toggle="tooltip" id="attach${status.count}" class="fa fa-paperclip" aria-hidden="true"></i>
						</td>

					</tr>
				</c:forEach>
			</div>
		</tbody>
	</table>

</body>
<%@ include file="pv_3dpreview.jsp"%>