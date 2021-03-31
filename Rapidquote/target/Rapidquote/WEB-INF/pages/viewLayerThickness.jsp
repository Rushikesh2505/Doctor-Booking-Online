<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
th, td {
/* 	font-size: smaller; */
	text-align: center;
	width: 10%;
	padding: 5px;
	word-break: break-all; /* 4. */
}

tr {
	display: table;
	width: 100%;
	box-sizing: border-box;
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
				<h2 style="color: white;">
					<fmt:message key="label.text119" />
				</h2>
			</div>
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<button onclick="openLayerThicknessModal()" class="modal-btn btn">
					<fmt:message key="label.text122" />
				</button>
			</div>
		</div>
	</div>

	<table class="table4 view">
		<thead class="thead4" style="background-color: black; color: white;">
			<tr>

				<th class="td4"><fmt:message key="label.text120" /></th>
				<th class="td4"><fmt:message key="label.text119" /></th>
				<th class="td4"><fmt:message key="label.text121" /></th>
				<th class="td4">Default</th>
				<th class="td4">Status</th>
				<th class="td4"><fmt:message key="label.orders.text7" /></th>
			</tr>
		</thead>
		<tbody class="tbody4">
			<c:forEach items="${beans}" var="bean" varStatus="status">
				<c:choose>
					<c:when test="${bean.status == false}">
						<c:set var="disabled" value="" />
						<c:set var="statusText" value="Inactive" />
					</c:when>

					<c:otherwise>
						<c:set var="disabled" value="checked" />
						<c:set var="statusText" value="Active" />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${bean.defaultStatus == true}">

						<c:set var="defaultStatus" value='<i class="fa fa-check"></i>' />
					</c:when>

					<c:otherwise>

						<c:set var="defaultStatus" value="-" />
					</c:otherwise>
				</c:choose>
				<tr>

					<td class="td4">${bean.layerType}</td>
					<td class="td4">${bean.layerThickness}</td>
					<td class="td4">${bean.layerFactor}</td>
					<td class="td4">${defaultStatus}</td>

					<td class="td4"><input class="toggle-layer" ${disabled}
						id="${bean.layerThicknessId}" data-on="Active" data-off="Inactive"
						data-onstyle="success" data-offstyle="danger" type="checkbox"
						data-toggle="toggle" data-size="small"></td>
					<td><label
						style="padding-right: 5%; padding-left: 5%; padding-top: 2%"
						id="${bean.layerThicknessId}"
						onclick="updateLayerThickness(this.id)"><i title="Edit" data-toggle="tooltip" 
							class="view-edit fa fa-edit"></i></label> <label
						id="${bean.layerThicknessId}" data-toggle="modal"
						data-target="#delete-modal-7"
						data-whatever="${bean.layerThicknessId}"> <i title="Delete" data-toggle="tooltip" 
							class="view-edit fa fa-trash pointer" aria-hidden="true"></i>
					</label></td>

				</tr>

			</c:forEach>
		</tbody>
	</table>

	<script>
		$(function() {
			$('.toggle-layer').bootstrapToggle();

			$('.toggle-layer').change(function() {
				console.log('Toggle: ' + $(this).prop('checked'));
				console.log('LayerId: ' + $(this).attr('id'));
				
				var status = $(this).prop('checked');
				var layerThicknessId = $(this).attr('id');
				
				$.ajax({
					type : 'POST',
					url : '/Rapidquote/layerThickness/updateStatus',
					data : {
						layerThicknessId : layerThicknessId,
						status : status
					},
					success : function(data) {
						console.log(data);
						$("#snackbar5").css("background-color", "#3d9c23c7");
						$("#snackbar5").text("Updated Successfully");
						snackBar5();
						viewLayerThickness();
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
