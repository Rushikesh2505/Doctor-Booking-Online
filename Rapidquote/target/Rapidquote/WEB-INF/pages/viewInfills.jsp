<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

/* table, td {
  border-collapse: collapse;
  border: 1px solid #000;
}
 */
th, td {
	/* font-size: smaller; */
	text-align: center;
	width: 10%; /* to enable "word-break: break-all" */
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
				<h2 style="color: white;">
					<fmt:message key="label.text124" />
				</h2>
			</div>
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<button onclick="openInfillModal()" class="modal-btn btn">
					<fmt:message key="label.text125" />
				</button>
			</div>
		</div>
	</div>

	<table class="table4 view">
		<thead class="thead4" style="background-color: black; color: white;">
			<tr>
				<!-- 	<th class="td4">Infill Id</th> -->
				<th class="td4"><fmt:message key="label.text126" /></th>
				<th class="td4"><fmt:message key="label.text127" /></th>
				<th class="td4"><fmt:message key="label.text128" /></th>
				<th class="td4">Default</th>
				<th class="td4">Status</th>
				<th class="td4">Action</th>
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
					<%-- <td class="td4" id="crow${status.count}" cId="${bean.infillId}">${ bean.infillId}</td> --%>


					<td class="td4">${bean.infillType}</td>
					<td class="td4">${bean.infillPercentage}</td>
					<td class="td4">${bean.infillFactor}</td>
					<td class="td4">${defaultStatus}</td>


					<td class="td4"><input class="toggle-infill" ${disabled}
						id="${bean.infillId}" data-on="Active" data-off="Inactive"
						data-onstyle="success" data-offstyle="danger" type="checkbox"
						data-toggle="toggle" data-size="small"></td>
					<td><label
						style="padding-right: 5%; padding-left: 5%; padding-top: 2%"
						id="${bean.infillId}" onclick="updateInfill(this.id)"><i title="Edit" data-toggle="tooltip" 
							class="view-edit fa fa-edit"></i></label> <label id="${bean.infillId}"
						data-toggle="modal" data-target="#delete-modal-6"
						data-whatever="${bean.infillId}"> <i title="Delete" data-toggle="tooltip" 
							class="view-edit fa fa-trash pointer" aria-hidden="true"></i>
					</label></td>



				</tr>

			</c:forEach>
		</tbody>
	</table>

	<script>
		$(function() {
			$('.toggle-infill').bootstrapToggle();

			$('.toggle-infill').change(function() {
				console.log('Toggle: ' + $(this).prop('checked'));
				console.log('InfillId: ' + $(this).attr('id'));
				
				var status = $(this).prop('checked');
				var infillId = $(this).attr('id');
				
				$.ajax({
					type : 'POST',
					url : '/Rapidquote/infill/updateStatus',
					data : {
						infillId : infillId,
						status : status
					},
					success : function(data) {
						console.log(data);
						$("#snackbar5").css("background-color", "#3d9c23c7");
						$("#snackbar5").text("Updated Successfully");
						snackBar5();

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
