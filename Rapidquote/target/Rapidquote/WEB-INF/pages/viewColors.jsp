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
	width: 25%; /* to enable "word-break: break-all" */
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
					<fmt:message key="label.message.text6" />
				</h2>
			</div>
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<button onclick="openColorModal()" class="modal-btn btn">
					<fmt:message key="label.text4" />
				</button>
			</div>
		</div>
	</div>

	<table class="table4 view">
		<thead class="thead4" style="background-color: black; color: white;">
			<tr>
				<th class="td4"><fmt:message key="label.text25" /></th>
				<th class="td4"><fmt:message key="label.text5" /></th>
				<th class="td4"><fmt:message key="label.text26" /></th>
				<th class="td4" colspan="2"><fmt:message key="label.text27" /></th>
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
				<tr>
					<td class="td4" id="crow${status.count}" cId="${bean.colorId}">${ status.count }</td>
					<td class="td4">${bean.colorName}&nbsp;&nbsp;&nbsp;&nbsp;<div
							class="showColor" style="background-color :${bean.colorHexCode}"></div></td>


					<td class="td4"><input class="toggle-color" ${disabled}
						cId="${bean.colorId}" data-on="Active" data-off="Inactive"
						data-onstyle="success" data-offstyle="danger" type="checkbox"
						data-toggle="toggle" data-size="small"></td>

					<td>
						<%-- <label
						style="padding-right: 5%; padding-left: 5%; padding-top: 2%"
						id="statusC${status.count}" cId="${bean.colorId}"
						onclick="updateColor(this.id)"><i
							class="view-edit fa fa-edit"></i></label> --%> 
						<label
						id="statusCD${status.count}" cId="${bean.colorId}"
						data-toggle="modal" data-target="#delete-modal-9"
						data-whatever="${bean.colorId}">
							<i title="Delete" data-toggle="tooltip"  class="view-edit fa fa-trash pointer" aria-hidden="true"></i>
					</label>
					</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<script>
		$(function() {
			$('.toggle-color').bootstrapToggle();

			$('.toggle-color').change(function() {
				console.log('Toggle: ' + $(this).prop('checked'));
				console.log('ColorId: ' + $(this).attr('cId'));

				var status = $(this).prop('checked');
				var colorId = $(this).attr('cId');
				$.ajax({
					type : 'POST',
					url : '/Rapidquote/color/updateStatus',
					data : {
						colorId : colorId,
						status : status
					},
					success : function(data) {
						console.log(data);
						$("#snackbar5").css("background-color", "#3d9c23c7");
						$("#snackbar5").text("Updated Successfully");
						snackBar5();
						viewColors();
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
