
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="links.jsp" />
<body>

	<div class="section5">
		<jsp:include page="header3.jsp" />
	</div>
	<!-- HEADER -->
	<div class="section5">
		<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12 col-12">
			<div class="row" style="margin-right: 1%;">
				<div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 col-8">
					<h3 style="display: inline-block;">
						<Strong><fmt:message key="label.cart.text1" /></Strong>
					</h3>
					&nbsp;&nbsp;
					<h3 style="display: inline-block;" id="itemNumber">(0)</h3>
				</div>
				<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4 col-4">
					<div class="row">
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 col-6">
							<label style="margin-left: 12%; font-size: larger;" for="sel1">Select currency:</label>
						</div>
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 col-6">
							<select onchange="changeCurrency(value)" class="form-control"
								id="currencySelect">
								<option value="USD">United States Dollars</option>
								<option value="GBP">United Kingdom Pounds</option>
								<option value="AUD">Australia Dollars</option>
								<option value="CAD">Canada Dollars</option>
								<option value="CNY">China Yuan Renmimbi</option>
								<!-- <option value="FRF">France Francs</option>
								<option value="DEM">Germany Deutsche Marks</option> -->
								<option value="HKD">Hong Kong Dollars</option>
								<option value="INR">India Rupees</option>
								<option value="JPY">Japan Yen</option>
								<option value="SGD">Singapore Dollars</option>
								<option value="EUR">Euro</option>
								<!-- <option value="VND">Vietnam Dong</option> -->
							</select>
						</div>
					</div>

				</div>

			</div>
			<hr>
		</div>
	</div>

	<!-- MAIN PANEL-->
	<div class="cart_panel section5">
		<div class="row filerow3">
			<!-- <div class="col-md-12 col-sm-12 col-xs-12 col-lg-12 col-12">
					<div class="row">
						<h5 id="itemNumber">(0)</h5>
					</div>
				</div> -->
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"
				style="padding-left: 2%;">

				<div id="style-2"
					class="orderItems col-md-12 col-sm-12 col-sm-12 col-lg-12 col-12">
					<c:forEach items="${quoteData}" var="quoteData" varStatus="status">
						<div class="order updateinfo${status.index} row"
							id="cartItem${status.index}"
							style="border: 1px solid lightgrey; height: auto; margin-bottom: 1%">
							<div id="quoteDataEdit${status.index}" style="display: none;">
								<!-- 1 -->
								<input id="cartId${status.index}" value="${quoteData.cartId}" />

								<!-- 2 -->
								<input id="fileName${status.index}"
									value="${quoteData.fileName}" />

								<!-- 3 -->
								<input id="x${status.index}" value="${quoteData.x}" />

								<!-- 4 -->
								<input id="y${status.index}" value="${quoteData.y}" />

								<!-- 5 -->
								<input id="z${status.index}" value="${quoteData.z}" />

								<!-- 6 -->
								<input id="surfaceArea${status.index}"
									value="${quoteData.surfaceArea}" />

								<!-- 7 -->
								<input id="actualVolume${status.index}"
									value="${quoteData.actualVolume}" />

								<!-- 8 -->
								<input id="processId${status.index}"
									value="${quoteData.processId}" />

								<!-- 9 -->
								<input id="processName${status.index}"
									value="${quoteData.processName}" />

								<!-- 10 -->
								<input id="finishingId${status.index}"
									value="${quoteData.finishingId}" />

								<!-- 11 -->
								<input id="finishingName${status.index}"
									value="${quoteData.finishingName}" />

								<!-- 12 -->
								<input id="colorId${status.index}" value="${quoteData.colorId}" />

								<!-- 13 -->
								<input id="colorName${status.index}"
									value="${quoteData.colorName}" />

								<!-- 14 -->
								<input id="materialId${status.index}"
									value="${quoteData.materialId}" />

								<!-- 15 -->
								<input id="materialName${status.index}"
									value="${quoteData.materialName}" />

								<!-- 16 -->
								<input id="density${status.index}" value="${quoteData.density}" />

								<!-- 17 -->
								<input id="rate${status.index}" value="${quoteData.rate}" />

								<!-- 18 -->
								<input id="categoryId${status.index}"
									value="${quoteData.categoryId}" />

								<!-- 19 -->
								<input id="categoryName${status.index}"
									value="${quoteData.categoryName}" />

								<!-- 20 -->
								<input id="materialProcessId${status.index}"
									value="${quoteData.materialProcessId}" />

								<!-- 21 -->
								<input type="hidden" id="unitrate${status.index}"
									value="${quoteData.unitCost}" />

								<!-- 22 -->
								<input onchange="updateTotal()" class="class1" type="hidden"
									id="totalrate${status.index}" value="${quoteData.totalCost}" />

								<!-- 23 -->
								<input id="fileCapturePath${status.index}"
									value="${quoteData.capturePath}" />

								<!-- 24 -->
								<input id="serverFileName${status.index}"
									value="${quoteData.serverFileName}" />

								<!-- 25 -->
								<input id="uploadedFileName${status.index}"
									value="${quoteData.uploadedFileName}" />

								<!-- 26 -->
								<input id="fileSize${status.index}"
									value="${quoteData.fileSize}" />

								<!-- 27 -->
								<input id="formula${status.index}" value="${quoteData.formula}" />

								<!-- 28 -->
								<input id="unitCost${status.index}"
									value="${quoteData.unitCost}" />

								<!-- 29 -->
								<input id="quantityS${status.index}"
									value="${quoteData.quantity}" />

								<!-- 30 -->
								<input id="unitWeight${status.index}"
									value="${quoteData.unitWeight}" />

								<!-- 31 -->
								<input class="class2" id="totalWeight${status.index}"
									value="${quoteData.totalWeight}" />

								<!-- 32 -->
								<input id="measureUnit${status.index}"
									value="${quoteData.measureUnit}" />

								<!-- 33 -->
								<input id="printableStatus${status.index}"
									value="${quoteData.printableStatus}" />

								<!-- 34 -->
								<input id="infillId${status.index}"
									value="${quoteData.infillId}" />

								<!-- 35 -->
								<input id="infillType${status.index}"
									value="${quoteData.infillType}" />

								<!-- 36 -->
								<input id="infillPercentage${status.index}"
									value="${quoteData.infillPercentage}" />

								<!-- 37 -->
								<input id="infillFactor${status.index}"
									value="${quoteData.infillFactor}" />

								<!-- 38 -->
								<input id="layerThicknessId${status.index}"
									value="${quoteData.layerThicknessId}" />

								<!-- 39 -->
								<input id="layerType${status.index}"
									value="${quoteData.layerType}" />

								<!-- 40 -->
								<input id="layerThickness${status.index}"
									value="${quoteData.layerThickness}" />


								<!-- 41 -->
								<input id="measureUnit${status.index}"
									value="${quoteData.measureUnit}" />

								<!-- 42 -->
								<input id="attachmentIds${status.index}"
									value="${quoteData.attachmentIds}" />

								<!-- 43 -->
								<input id="unitCostUserCurrency${status.index}"
									value="${quoteData.unitCostUserCurrency}" />

								<!-- 44 -->
								<input onchange="updateTotal()" class="class3"
									id="totalCostUserCurrency${status.index}"
									value="${quoteData.totalCostUserCurrency}" />

								<!-- 45 -->
								<input id="userCurrency${status.index}"
									value="${quoteData.userCurrency}" />

								<!-- 46 -->
								<input id="note${status.index}" value="${quoteData.note}" />

							</div>
							<%-- <div class="col-md-2  col-sm-2 col-xs-2 col-lg-2 col-3 "
								style="margin-bottom: 1%; margin-top: 1%; text-align: center;">
								<img id="partImage"
									onerror="this.src='/resources/images/no-image.jpg';"
									src="/Rapidquote/cfimages/${quoteData.capturePath}">
							</div>
 --%>							<div class="col-md-4 col-sm-4 col-xs-4 col-lg-4 col-4"
								style="margin-top: 1%; margin-bottom: 1%;">
								<p data-toggle="tooltip" title="${quoteData.fileName}"
									class="ptitle">${quoteData.fileName}</p>
								<p class="pbody"><fmt:message key="label.uploadFile.text15" />: ${quoteData.x} X ${quoteData.y} X ${quoteData.z} ${quoteData.measureUnit}</p>
								<p class="pbody u_process"><fmt:message key="label.message.text5" />: ${quoteData.processName}</p>
								<p class="pbody u_material"><fmt:message key="label.quoteDetails.text6" /> : ${quoteData.materialName}</p>
								<p class="pbody u_finishing finishingStatus"
									id="finishingStatus${status.index}"><fmt:message key="label.quoteDetails.text9"/>:${quoteData.finishingName}</p>
								<p class="pbody u_color colorStatus"
									id="colorStatus${status.index}"><fmt:message key="label.message.text6"/>:${quoteData.colorName}</p>
								<p class="pbody u_infill infillStatus"
									id="infillStatus${status.index}">Infill:${quoteData.infillType}</p>
								<p class="pbody u_layerThickness layerThicknessStatus"
									id="layerThicknessStatus${status.index}">Layer Thickness:${quoteData.layerType}</p>
							</div>
							<div class="col-md-2 col-lg-2 col-sm-2 col-xs-2 col-2"
								style="text-align: center;">
								<div class="qty mt-5" id="quantity1${status.index}">
									<span id="minus${status.count}"
										uweight="unitWeight${status.index}"
										tweight="totalWeight${status.index}"
										trate="totalrate${status.index}"
										frate="finalrate${status.index}"
										urate="unitrate${status.index}"
										trateC="totalCostUserCurrency${status.index}"
										frateC="finalrateC${status.index}"
										urateC="unitCostUserCurrency${status.index}" class="minus"
										divid="quantity${status.index}" onclick="getQuantity(this.id)">
										<span class="glyphiconnew glyphicon-minus"></span>
									
									</span> <input type="number" class="input count" name="qty"
										value="${quoteData.quantity}" /> <span
										id="plus${status.index}" 
										uweight="unitWeight${status.index}"
										tweight="totalWeight${status.index}"
										trate="totalrate${status.index}"
										frate="finalrate${status.index}"
										urate="unitrate${status.index}"
										trateC="totalCostUserCurrency${status.index}"
										frateC="finalrateC${status.index}"
										urateC="unitCostUserCurrency${status.index}" class="plus"
										divid="quantity${status.index}" onclick="getQuantity(this.id)">
										<span class="glyphiconnew glyphicon-plus"></span>
									</span>
								</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-4 col-lg-4 col-3">
								<!-- <div class="row"> -->
								<div style="display: none;" class="editPart"
									id="edit${status.index}" updatediv="updateinfo${status.index}"
									divdata="quoteDataEdit${status.index}"
									onclick="editData(this.id)">
									<span class="glyphicon glyphicon-edit"></span><label
										id="editLabel"><fmt:message key="label.cart.text11" /></label>
								</div>
								<div style="margin-left: 111%;" class="removePart"
									id="remove${status.index}" data-toggle="modal"
									data-target="#remove-modal"
									data-whatever="updateinfo${status.index}"
									removeid="updateinfo${status.index}">
									<span class="glyphicon glyphicon-remove"></span><label
										id="removeLabel"><fmt:message key="label.cart.text10" /></label>
								</div>
								<!-- </div> -->
								<div class="cart_rate msp" style="display: none"
									id="finalrate${status.index}">${quoteData.currency}
									${quoteData.totalCost}</div>
								<div class="cart_rate user" style="display: none"
									id="finalrateC${status.index}">${quoteData.userCurrency}
									${quoteData.totalCostUserCurrency}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"
				style="border-left: 1px solid lightgrey;">
				<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 col-12">
					<div class="row">
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 col-6"
							style="margin-top: 2%;">
							<h5>
								<fmt:message key="label.cart.text3" />
							</h5>
						</div>
						<%-- <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6 col-6">
							<button type="button" id="export" onclick="downloadQuote()"
								class="quotebtn right">
								<fmt:message key="label.cart.text4" />
							</button>
						</div> --%>
					</div>
				</div>
				<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 col-12"
					style="height: auto;">
					<div style="margin-top: 1%; font-weight: bold; font-size: 120%;">
						<table>
							<tbody>
								<tr>
									<td><p class="pbody">
											<fmt:message key="label.cart.text5" /></p></td>
									<td><p class="pbody right msp" id="subtotal"></p></td>
									<td><p class="pbody right user" id="subtotalC"></p></td>
								</tr>

								<tr>
									<td><p class="pbody">
											<fmt:message key="label.cart.text6" />
										</p></td>
									<td><p class="pbody right msp" id="shippingCost"></p></td>
									<td><p class="pbody right user" id="shippingCostC"></p></td>
								</tr>

								<%-- <tr>
									<td><p class="pbody">
											<fmt:message key="label.cart.text7" />
										</p></td>
									<td>
										<p class="pbody right" id="taxes">
									</td>
								</tr> --%>
							</tbody>
						</table>
						<hr>
						<table>
							<tbody>

								<tr>
									<td><p class="pbody">
											<fmt:message key="label.cart.text8" />
										</p></td>
									<td><p class="pbody right msp" id="total"></td>
									<td><p class="pbody right user" id="totalC"></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div><br>
				<div style="text-align: center;">
					<%-- <button type="button" class="btn btn-danger addToCartButton"
						data-toggle="modal" data-target="#confirmOrder-modal">
						<fmt:message key="label.cart.text9" />
					</button> --%>
					
					<button id="signUp1" href="#"
				class="btn btn-danger addToCartButton" data-toggle="modal"
				data-target="#modalSignUpForm1"><fmt:message key="label.cart.text9" /></button> 
				</div>
								
				<div
					style="margin-bottom: 15%; margin-top: 15%; text-align: center;">
					<h6>
						<fmt:message key="label.text2" />
					</h6>
					<button type="button" class="emptyUploadbutton btn btn-danger"
						onclick="redirectUpload()">
						<fmt:message key="label.message.text1" />
						+
					</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="totalWeightCart">
	<input type="hidden" id="totalshippingCost">
	<input type="hidden" id="totalCost">
	<input type="hidden" id="subtotalCost">
	<input type="hidden" id="totalshippingCostC">
	<input type="hidden" id="totalCostC">
	<input type="hidden" id="subtotalCostC">

	<div class="section5">
		<%@ include file="footer.jsp"%>
	</div>
</body>

<form id="orderForm"
	action="/Rapidquote/order/orderSuccess"
	method="POST">
	<input type="hidden" id="orderNos" name="orderNos">
</form>
<%@ include file="hidden_customer.jsp"%>
<%@ include file="modal_langAlert.jsp"%>
<%@ include file="modal_changeLang.jsp"%>
<%-- <%@ include file="modal_editQuoteItems.jsp"%> --%>
<%@ include file="modal_removeQuoteItem.jsp"%>
<%@ include file="shipping_address.jsp"%>
<%@ include file="quote.jsp"%>
<%@ include file="modal_delete.jsp"%>
<%@ include file="modal_profile.jsp"%>

<!-- <script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
</script>  -->

<!-- <script>
$(document).ready(function() {
function disableBack() { window.history.forward() }

window.onload = disableBack();
window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
});
</script> -->

<!-- <script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script> -->

<script>
	$(document).ready(function() {
		window.history.pushState(null, "", window.location.href);
		window.onpopstate = function() {
			window.history.pushState(null, "", window.location.href);
		};
		$("#cartNo").val($('.orderItems .order').length);
		$(".cartNotify").text($('.orderItems .order').length);
		updateTotal();
		hiddenUserCurrency();
		checkColor3();
		checkInfill();
		checkLayerThickness();
		checkFinishing3();
		checkOrderData();
	});
</script>

</html>