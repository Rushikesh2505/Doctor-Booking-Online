<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/autotable.js"></script>
<style>

/* table, td {
  border-collapse: collapse;
  border: 1px solid #000;
}
 */
th, td {
	font-size: small;
	text-align: center;
	column-width: 100px !important; /* to enable "word-break: break-all" */
	/* padding: 5px; */
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
				<h2 style="color:white">Default Currency</h2>
				<lable style="color:white">Note: Add only one default currency</lable>
			</div>
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<button id="AddCurrency" onclick="openCurrencylModal()" class="modal-btn btn">Add Currency</button>
			</div>
		</div>
	</div>
	<table id="mytable" class="table2 view">
		<thead class="thead2" style="background-color: black; color: white;">
			<tr>
				<th class="td2">Country</th>
				<th class="td2">Currency</th>
				<th class="td2">Created Date</th>
				<th class="td2">Action</th>
			</tr>
		</thead>
		<tbody class="tbody2">
			<c:forEach items="${list}" var="list" varStatus="status">
				<td style="display: none">
					<div id="currency${count.index}">
						<c:choose>
							<c:when test="${list.status == false}">
								<c:set var="disabled" value="" />
								<c:set value="" var="currencyStatus"></c:set>
							</c:when>
							<c:when test="${list.status == true}">
								<c:set var="disabled" value="checked" />
								<c:set value="Checked" var="currencyStatus"></c:set>
							</c:when>

						</c:choose>


					</div>

				</td>
				  <tr>
					<td id="countryNameCell" class="td2">${list.countryName}</td>
					<td id="currencyName" class="td2">${list.currencyName}</td>
					<td class="td2">${list.createdDate}</td>

					<td class="td2"><%-- <input class="toggle-currency" ${disabled}
						cId="${list.currencyId}" data-on="Active" data-off="Inactive"
						data-onstyle="success" data-offstyle="danger" type="checkbox"
						data-toggle="toggle" data-size="small"> --%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label title="Edit"
						data-toggle="tooltip"
						style="padding-left: 6%; padding-top: 2%"
						id="${list.currencyId}" onclick="updateCurrency(this.id)">
							<i class="view-edit fa fa-edit"></i>
					</label></td>

				</tr>

			</c:forEach>
		</tbody>
	</table>
	<script>
		$(function() {
			$('.toggle-currency').bootstrapToggle();

			$('.toggle-currency').change(function() {
				console.log('Toggle: ' + $(this).prop('checked'));
				console.log('CurrencyId: ' + $(this).attr('cId'));

				var status = $(this).prop('checked');
				var currencyId = $(this).attr('cId');

				$.ajax({
					type : 'POST',
					url : '/Rapidquote/currency/updateStatus',
					data : {
						currencyId : currencyId,
						status : status
					},
					success : function(data) {
						console.log(data);
						$("#snackbar5").css("background-color", "#3d9c23c7");
						$("#snackbar5").text("Updated Successfully");
						snackBar5();
						viewCurrencies();
					},
					error : function(e) {
						$("#result").text(e.responseText);
						console.log("ERROR : ", e);

					}

				});
			});
		});
	</script>


</body>
