<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="links.jsp" />
<script type="text/javascript" src="http://github.com/malsup/media/raw/master/jquery.media.js?v0.92"></script> 
<style>

/* table, td {
  border-collapse: collapse;
  border: 1px solid #000;
}
 */
tbody {
	display: block; /* to enable vertical scrolling */
	max-height: 480px; /* e.g. */
	overflow-y: scroll;
	/* keeps the scrollbar even if it doesn't need it; display purpose */
}

th, td {
	text-align: center;
	width: 7.11%; /* to enable "word-break: break-all" */
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
	<div class="section4" style="margin-top: -35%;">
		<jsp:include page="header3.jsp" />

	</div>
	<div class="section4" style="">
		<div id="customers" style="display: none;margin-top: 37%;">
			<table class="view orderMainHeader" id="tableorder"
				style="font-size: small;">
				<thead class="thead1" id="orderHeader">
					<tr>
						<th><fmt:message key="label.orders.text2" /></th>
						<th><fmt:message key="label.orders.text4" /></th>
						<th><fmt:message key="label.orders.text11" />(${currency.currencyName})</th>
						<th><fmt:message key="label.orders.text12" />(${currency.currencyName})</th>
						<th><fmt:message key="label.orders.text9" />(${currency.currencyName})</th>
						<th><fmt:message key="label.orders.text10" />(Kg)</th>
						<th><fmt:message key="label.orders.text13" /></th>
						<th><fmt:message key="label.orders.text14" /></th>
						<th><fmt:message key="label.orders.text15" /></th>
						<!-- <th>Download Quote</th> -->
					</tr>
				</thead>
				<tbody id="customerOrderData">
					<c:forEach items="${list}" var="item" varStatus="theCount">
						<tr>
							<td title="${item.orderCode}" data-toggle="tooltip"
								style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
								userId="${item.userId}" orderId="${item.orderId}">${item.orderCode}</td>
							<td title="${item.noOfItems}" >${item.noOfItems}</td>
							<td title="${item.subtotal}" >${item.subtotal}</td>
							<td title="${item.shippingCost}" >${item.shippingCost}</td>
							<td title="${item.totalCost}">${item.totalCost}</td>
							<td title="${item.totalWeight}">${item.totalWeight}</td>
							<td title="${item.orderDate}" >${item.orderDate}</td>
							<td title="${item.orderStatus}">${item.orderStatus}</td>
							<td><i orderCode="${item.orderCode}"
								title="View Order Details"
							onclick="getUserOrderItems(this.id)"
								id="getCOT${theCount.count}" orderId="${item.orderId}"
								aria-hidden="true" class="pointer fas fa-eye" style="color: #1f6fc0;"></i> &nbsp;&nbsp;&nbsp;	
							
								<a href="/Rapidquote/quoteFile/${item.quotePdf}" download><i
								class="pointer fas fa-download" title="Download Quote" style="color: #1f6fc0;"></i></a> &nbsp;&nbsp;&nbsp;	
							<a href="/Rapidquote/quoteFile/${item.quotePdf}"target="_blank"><i  class="fa fa-file-pdf-o" title="View Quote" style="font-size:15px;margin-left:0%;color:red"></i></a>	
								</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="noOrderDiv" style="text-align: center; display: none">
			<label style="font-weight: bold; margin-top: 10%; font-size: 3vw;"><fmt:message
					key="label.message.text10" /></label><br>

			<button type="button" class="orderUploadbutton btn btn-danger"
				onclick="redirectUpload()">
				<fmt:message key="label.message.text1" />
				+
			</button>
		</div>



	</div>
	<div class="section4">
		<%@ include file="footer.jsp"%>
	</div>
	<%@ include file="hidden_customer.jsp"%>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="modal_profile.jsp"%>

</body>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
table {
	font-size: smaller;
	width: 100%;
}

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
				<th class="wrapCol4">Infill(%)</th>
				<th class="wrapCol4">Layer Thickness(&micro;)</th>
				<th class="wrapCol4">UnitCost(${supplierBean.currencyBean.currencyName})</th>
				<th class="wrapCol4"><fmt:message key="label.message.text7" /></th>
				<th class="wrapCol4">Total
					Cost(${supplierBean.currencyBean.currencyName})</th>
				<th class="wrapCol4">Total Weight(Kg)</th>
				<th class="wrapCol4">Note</th>
				<th class="wrapCol4" colspan="3">Action</th>
			</tr>
		</thead>
		<tbody class="tbody5 tbodydiv">
			<c:forEach items="${beans}" var="bean" varStatus="status">
				<tr class="tr5">
					<td class="td5 wrapCol2" orderId="${bean.orderItemId}">ORIM00${bean.orderItemId}</td>
					<td class="td5 wrapCol2" data-toggle="tooltip"
						title="${bean.fileName}" id="file${status.count}">${bean.fileName}</td>
					<td class="td5 wrapCol2" title="${bean.processName}"
						data-toggle="tooltip">${bean.processName}</td>
					<td class="td5 wrapCol2" title="${bean.materialName}"
						data-toggle="tooltip">${bean.materialName}</td>
					<td class="td5 wrapCol2" title="${bean.finishingName}"
						data-toggle="tooltip">${bean.finishingName}</td>
					<td class="td5 wrapCol2" title="${bean.colorName}"
						data-toggle="tooltip">${bean.colorName}</td>
					<td class="td5 wrapCol2" title="${bean.infillPercentage}"
						data-toggle="tooltip">${bean.infillPercentage}</td>
					<td class="td5 wrapCol2" title="${bean.layerThickness}"
						data-toggle="tooltip">${bean.layerThickness}</td>
					<td class="td5 wrapCol2" title="${bean.unitCost}"
						data-toggle="tooltip">${bean.unitCost}</td>
					<td class="td5 wrapCol2" title="${bean.quantity}"
						data-toggle="tooltip">${bean.quantity}</td>
					<td class="td5 wrapCol2" title="${bean.totalCost}"
						data-toggle="tooltip">${bean.totalCost}</td>
					<td class="td5 wrapCol2" title="${bean.totalWeight}"
						data-toggle="tooltip">${bean.totalWeight}</td>
					<td class="td5 wrapCol2" title="${bean.note}" data-toggle="tooltip">${bean.note}</td>
					<td><i style="color: rgb(31, 111, 192);"
						id="download${status.count}" ffile="${bean.fileName}"
						sfile="${bean.stlFile}" ufile="${bean.uploadedFileName}"
						onclick="downloadCadFile(this.id);" class="fa fa-download"
						aria-hidden="true" title="Download CAD Files"
						data-toggle="tooltip"></i> &nbsp;&nbsp;&nbsp;&nbsp; <i
						style="color: rgb(31, 111, 192);" id="preview${status.count}"
						file="${bean.fileName}" sfile="${bean.stlFile}"
						title="View 3D Preview" data-toggle="tooltip"
						onclick="getSupplier3DPreview(this.id);" class="fas fa-eye"></i>
						&nbsp;&nbsp;&nbsp;&nbsp; <i orderId="${bean.orderItemId}"
						onclick="downloadAttachment(this.id)"
						style="color: rgb(31, 111, 192); font-size: medium; font-weight: bold;"
						title="Download Attachments" data-toggle="tooltip"
						id="attach${status.count}" class="fa fa-paperclip"
						aria-hidden="true"></i></td>

				</tr>

			</c:forEach>
		</tbody>
	</table>

</body>
<%@ include file="pv_3dpreview.jsp"%> --%>