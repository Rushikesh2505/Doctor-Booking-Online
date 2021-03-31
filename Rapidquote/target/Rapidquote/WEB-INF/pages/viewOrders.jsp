
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="http://github.com/malsup/media/raw/master/jquery.media.js?v0.92"></script> 
<style>

/* table, td {
  border-collapse: collapse;
  border: 1px solid #000;
}
 */
th, td {
	text-align: center;
	column-width: 100px !important; /* to enable "word-break: break-all" */
	padding: 5px;
	/*word-break: break-all; /* 4. */
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
				<h2 style="color: white;">
					<fmt:message key="label.text1" />
				</h2>
			</div>
		</div>

	<table class="table2 view" style="font-size: smaller;">
		<thead class="thead2" style="background-color: black; color: white;">
			<tr>
				<!-- OrderNo -->
				<th class="wrapCol4"
					title="<fmt:message key="label.orders.text2" />"
					data-toggle="tooltip"><fmt:message key="label.orders.text2" /></th>

				<!-- Customer Name	 -->
				<th class="wrapCol4"
					title="<fmt:message key="label.text31" />"
					data-toggle="tooltip"><fmt:message key="label.text31" /></th>

				<!-- Country -->
				<th class="wrapCol4"
					title="<fmt:message key="label.text32" />"
					data-toggle="tooltip"><fmt:message key="label.text32" /></th>

				<!-- Email -->
				<th class="wrapCol4"
					title="<fmt:message key="label.other.text10" />"
					data-toggle="tooltip"><fmt:message key="label.other.text10" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>

				<!-- Contact -->
				<th class="wrapCol4" title="<fmt:message key="label.text23" />"
					data-toggle="tooltip"><div style="margin-left: 28%;"><fmt:message key="label.text23" /></div></th>

				<!-- No. ot items -->
				<th class="wrapCol4"
					title="<fmt:message key="label.orders.text4" />"
					data-toggle="tooltip"><fmt:message key="label.orders.text4" /></th>

				<!-- Subtotal -->
				<th class="wrapCol4"
					title="Subtotal(${currency.currencyName})"
					data-toggle="tooltip"><div style=" margin-left: 18%;">Subtotal  (${currency.currencyName})  </div></th>

				<!-- Shipping Cost -->
				<th class="wrapCol4"
					title="Shipping Cost(${currency.currencyName})"
					data-toggle="tooltip">Shipping Cost  (${currency.currencyName})</th>

				<!-- Total Cost -->
				<th class="wrapCol4"
					title="<fmt:message key="label.orders.text9" />"
					data-toggle="tooltip"><fmt:message key="label.orders.text9" /> (${currency.currencyName})</th>

				<!-- Total Weight -->
				<th class="wrapCol4" title="Total Weight(Kg)"
					data-toggle="tooltip">Total Weight(Kg)</th>

				<!-- Total File Size	 -->
				<!-- <th class="wrapCol4" title="FileSize(bytes)" data-toggle="tooltip">FileSize(bytes)</th> -->

				<!-- Order Date -->
				<th class="wrapCol4"
					title="<fmt:message key="label.orders.text5" />"
					data-toggle="tooltip"><fmt:message key="label.orders.text5" /></th>

				<%-- <!-- 	Order Status -->
				<th class="wrapCol4"
					title="<fmt:message key="label.orders.text6" />"
					data-toggle="tooltip"><fmt:message key="label.orders.text6" /></th> --%>

				<!-- Action -->
				<th class="wrapCol4" title="<fmt:message key="label.text27" />"
					data-toggle="tooltip"><fmt:message key="label.text27" /></th>
					<!-- <th>Download Quote</th> -->
					
			</tr>
		</thead>
		<tbody class="tbody2">
			<c:forEach items="${beans}" var="bean" varStatus="status">
				<tr>
					<td class="td2 wrapCol3" orderId="${bean.orderId}">${bean.orderCode}</td>
					<td class="td2 wrapCol3" title="${bean.firstName} ${bean.lastName}"data-toggle="tooltip" userId="${bean.userId}">
						${bean.firstName} ${bean.lastName}</td>
				<td class="td2 wrapCol3" title="${bean.address}"data-toggle="tooltip">${bean.address}</td>
					<td style="word-break: break-word; white-space: nowrap;overflow: hidden;"class="td2 wrapCol3" title="${bean.contactEmail}"data-toggle="tooltip">${bean.contactEmail}</td>&nbsp;&nbsp;&nbsp;
					<td class="td2 wrapCol3" title="${bean.contactNumber}"
						data-toggle="tooltip">${bean.contactNumber}</td>

					<td class="td2 wrapCol3" title="${bean.noOfItems}"
						data-toggle="tooltip">${bean.noOfItems}</td>

					<td class="td2 wrapCol3" title="${bean.subTotal}"
						data-toggle="tooltip">${bean.subTotal}</td>
					<td class="td2 wrapCol3" title="${bean.shippingCost}"
						data-toggle="tooltip">${bean.shippingCost}</td>
					<td class="td2 wrapCol3" style="width: 0%;" title="${bean.totalCost}"
						data-toggle="tooltip">${bean.totalCost}</td>

					<td class="td2 wrapCol3" title="${bean.totalWeight}"
						data-toggle="tooltip">${bean.totalWeight}</td>
					<%-- <td class="td2 wrapCol3" title="${bean.totalCadFileSize}" 
						data-toggle="tooltip"> ${bean.totalCadFileSize} </td>
					--%>
					<td class="td2 wrapCol3" title="${bean.orderDate}"
						data-toggle="tooltip">${bean.orderDate}</td>
					<%-- <td class="td2 wrapCol3" title="${bean.orderStatus}"
						data-toggle="tooltip">${bean.orderStatus }</td>
					 --%>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i orderCode="${bean.orderCode}"
						title="View Order Details"
						data-toggle="tooltip" onclick="viewOrderItems(this.id)" id="getOT${status.count}"
						orderId="${bean.orderId}" class="pointer fas fa-eye"
						style="color: #1f6fc0;"></i> &nbsp;
					<a href="/Rapidquote/quoteFile/${bean.quotePdf}" download><i
							title="Download Quote"	class="pointer fas fa-download"></i></a>&nbsp;	
					<a class="" href="/Rapidquote/quoteFile/${bean.quotePdf}" target="_blank"><i  class="fa fa-file-pdf-o" title="View Quote" style="font-size:15px;margin-left:0%;color:red"></i></a>
					</td>	
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>

