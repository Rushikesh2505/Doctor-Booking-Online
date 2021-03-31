<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/autotable.js"></script>
<div class="col-md-12" style="font-size: small;color: black; padding: 1%;">
	<!-- <h1>Quotation</h1><br> -->
	<br>
	<header>
	<img style="width: 30%;" class="" id="logo"
		src="${pageContext.request.contextPath}/resources/images/logo.jpg" />
	</header>
	<br>

	<div class="container" style="margin-top: 1%">

		<table class="table table-bordered" id="user" style="font-size: small">

			<tbody id="quote_block">
				<tr>
					<td style="padding-left: 10px;"><b><fmt:message
								key="label.pdf.text11" /> : ${bean.orderNo}</b>
						<p style="display: inline-block;"></p></td>
					<td style="padding-left: 10px;"><b><fmt:message
								key="label.pdf.text12" /> : ${bean.date}</b>
						<p style="display: inline-block;" id="quoteDate"></p></td>
				</tr>
				<tr>
					<td style="padding-left: 10px;"><b><fmt:message
								key="label.pdf.text13" /> : ${bean.address}</b>
						<p style="display: inline-block;"></p></td>
					<td style="padding-left: 10px;"><b><fmt:message
								key="label.pdf.text14" /> : ${bean.firstName} ${bean.lastName}</b>
						<p style="display: inline-block;"></p></td>
				</tr>
			</tbody>
		</table>

	</div>
	<div style="height: 1300px">
		<div class="container" style="margin-top: 3%;">

			<table class="view table quote" id="item_block">
				<thead>
					<tr>
						<th><fmt:message key="label.pdf.text1" /></th>
						<th><fmt:message key="label.pdf.text2" /></th>
						<th><fmt:message key="label.pdf.text3" /></th>
						<th><fmt:message key="label.pdf.text4" />(${currency.currencyName})</th>
						<th><fmt:message key="label.pdf.text5" /></th>
						<th><fmt:message key="label.pdf.text6" />(${currency.currencyName})</th>
					</tr>
				</thead>
				<tbody id="quoteTable" style="line-height: 1;">
					<c:forEach items="${bean.orderItems}" var="quote"
						varStatus="status">
						<tr style="height: 160px">
							<td style="padding-top: 7%;">${status.count}</td>
							<td style="padding-top: 7%;"><label style="word-break: break-all;">${quote.fileName}</label></td>
							<td style="padding-top: 2%; text-align: left;"><label>
									<fmt:message key="label.pdf.text15" /> :
							</label> ${quote.coordinate_x} x ${quote.coordinate_y} x
								${quote.coordinate_z} mm<br> <label><fmt:message
										key="label.pdf.text16" /> : </label>${quote.processName}<br> <label><fmt:message
										key="label.pdf.text17" /> : </label> ${quote.materialName}<br> <label>Color :</label>${quote.colorName}<br> <label><fmt:message
										key="label.pdf.text18" /> :</label>${quote.finishingName}<br> <label><fmt:message
										key="label.pdf.text23" /> :</label>${quote.infillType}(${quote.infillPercentage})<br>
								<label><fmt:message key="label.pdf.text24" /> :</label>${quote.layerType}(${quote.layerThickness })<br>
							</td>
							<td style="padding-top: 7%;">${quote.unitCost}</td>
							<td style="padding-top: 7%;">${quote.quantity}</td>
							<td style="padding-top: 7%;">${quote.totalCost}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div class="container" style="margin-top: 3%; margin-bottom: 2%">
			<table class="table table-bordered" id="shipping_block">
				<tbody>
					<tr>
						<td style="width: 85%; text-align: right; padding-right: 5px;"><b>Subtotal (${currency.currencyName})</b> :</td>
						<td style="width: 15%; padding-left: 10px;" id="subTotalQuote">${bean.subTotal}</td>

					</tr>
					<tr>
						<td style=" width: 85%; text-align: right; padding-right: 5px;"><b>Shipping Cost (${currency.currencyName})</b> :</td>
						<td style=" width: 15%; padding-left: 10px;" id="subTotalQuote">${bean.shippingCost}</td>
					</tr>
					<tr>
						<td style="width: 85%; text-align: right; padding-right: 5px;"><b><fmt:message key="label.pdf.text20" />(${currency.currencyName}):</b></td>
						<td style="width: 15%; padding-left: 10px;" id="totalCostQuote">${bean.totalCost}</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="container" style="margin-top: 3%; margin-bottom: 2%">

			<table class="view table quote" id="manufacturing_block">
				<thead>
					<tr>
						<th style="text-align: center;"><fmt:message
								key="label.pdf.text7" /></th>
						<th style="text-align: center;"><fmt:message
								key="label.pdf.text8" /></th>
						<th style="text-align: center;"><fmt:message
								key="label.pdf.text9" /></th>
					</tr>
				</thead>
			<tbody>

					<tr>
						<td style="text-align: center;">${bean.mTime}</td>
						<td style="text-align: center;">${bean.sTime}</td>
						<td style="text-align: center;">${bean.lTime}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<table id="supp" class="container">
			<thead>
			<tr>
			<th>
			<label style="margin-bottom: unset;"> Note: </label>
			<ul>
				<li type="square"><fmt:message key="label.pdf.text21" /></li>
				<li type="square"><fmt:message key="label.pdf.text22" /></li>
			</ul>
			</th>
			</tr>
			</thead>
	</table>
	</div>
<table id="supplierdetails">
<thed>
<tr>
<th>
<li style="font-size:small">Supplier Information </li>
		<li style="margin-bottom: unset;font-size: smaller" id="quotePerson"><fmt:message key="label.other.text12"/> : ${supplierBean.firstName} ${supplierBean.lastName}</li>
		<li style="margin-bottom: unset;font-size: smaller" id="quoteCompany"><fmt:message key="label.other.text11"/> : ${supplierBean.companyName}</li>
		<li style="margin-bottom: unset;font-size: smaller" id="quoteContactNumber"><fmt:message key="label.other.text4"/> : ${supplierBean.contactNumber} </li>
		<li style="margin-bottom: unset ;font-size: smaller" id="quoteContactEmail"><fmt:message key="label.other.text3"/> : ${supplierBean.contactEmail} </li>
		<li style="width: 50%; margin-bottom: unset;font-size: smaller" id="quoteAddress"><fmt:message key="label.other.text5"/> : ${supplierBean.address}</li>
</th>	
	</tr>
	</thed>
</table>
<table id="shippingdetails">
<thed>
<tr>
<th>
<li style="font-size:small">Shipping Information </li>
		<li style="margin-bottom: unset;font-size: smaller" id="quotePerson"><fmt:message key="message.other.text11"/> : ${bean.sfullName}</li>
		<li style="margin-bottom: unset;font-size: smaller" id="quoteCompany"><fmt:message key="message.other.text3"/> : ${bean.scontactEmail}</li>
		<li style="margin-bottom: unset;font-size: smaller" id="quoteContactNumber"><fmt:message key="message.other.text4"/> : ${bean.scontactNumber} </li>
		<li style="width: 50%; margin-bottom: unset;font-size: smaller" id="quoteAddress"><fmt:message key="label.other.text5"/> : ${bean.sAddress},${bean.sCountry},${bean.sCountry} - ${bean.szipCode} </li>
</th>	
	</tr>
	</thed>
</table>
</div>


