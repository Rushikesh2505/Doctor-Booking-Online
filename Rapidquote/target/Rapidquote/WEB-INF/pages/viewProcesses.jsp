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
thead {
	display: table; /* to take the same width as tr */
	width: calc(100% - 17px); /* - 17px because of the scrollbar width */
}

tbody {
	display: block; /* to enable vertical scrolling */
	max-height: 480px; /* e.g. */
	overflow-y: scroll;
	/* keeps the scrollbar even if it doesn't need it; display purpose */
}

th, td {
	text-align: center;
	width: 9%; /* to enable "word-break: break-all" */
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
					Manufacturing Process
				</h2>
			</div>
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<button onclick="openProcessModal()" class="modal-btn btn">
					Add Process
				</button>
			</div>
		</div>
	</div>
	<table class="table4 view">
		<thead class="thead4" style="background-color: black; color: white;">
			<tr>
				<th class="td4">Process No</th>
				<th class="td4">Process</th>
				<th class="td4">Min Cost</th>
				<th class="td4">Min Thickness</th>
				<th class="td4">Max Build Size</th>
				<th class="td4">Manufacturing Time</th>
				<th class="td4">Infill Factor</th>
				<th class="td4">Layer Thickness</th>
				<th class="td4">Formula</th>
				<th class="td4">Status</th>
				<th class="td4" colspan="2">Action</th>
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
					<td class="td4" id="mfgprow${status.count}"
						mfgPId="${bean.processId}">${bean.processCode}</td>
					<td class="td4">${bean.processName}</td>
					<td class="td4">${bean.minimumCost}</td>
					<td class="td4">${bean.minimumThickness}</td>
					<td class="td4">${bean.maxBuildX}*${bean.maxBuildY}*
						${bean.maxBuildZ}</td>
					<td class="td4">${bean.manufacturingTime}</td>
					<td class="td4">${bean.infillFactor}</td>
					<td class="td4">${bean.layerThicknessFactor}</td>

					<td class="td4" data-toggle="tooltip" title="${bean.formula}">${bean.formula}</td>

					<td class="td4" id="statusP${status.count}"><input
						class="toggle-process" ${disabled} mfgPId="${bean.processId}"
						data-on="Active" data-off="Inactive" data-onstyle="success"
						data-offstyle="danger" type="checkbox" data-toggle="toggle"
						data-size="small"></td>
					<td class="td4" id="statusPE${status.count}"
						pId="${bean.processId}" onclick="updateProcess(this.id)"
						style="width: 50px"><i title="Edit" data-toggle="tooltip"
						class="view-edit fa fa-edit"></i></td>
					<td class="td4" id="statusPED${status.count}"
						pId="${bean.processId}" data-toggle="modal"
						data-target="#delete-modal-5" data-whatever="${bean.processId}"
						style="width: 50px"><i title="Delete" data-toggle="tooltip"
						class="view-edit fa fa-trash pointer" aria-hidden="true"></i></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
		$(function() {
			$('.toggle-process').bootstrapToggle();

			$('.toggle-process').change(function() {
				console.log('Toggle: ' + $(this).prop('checked'));
				console.log('ProcessId: ' + $(this).attr('mfgPId'));
				
				var status = $(this).prop('checked');
				console.log(status);
				var processId = $(this).attr('mfgPId');
				console.log(processId);
				
				$.ajax({
					type : 'POST',
					url : '/Rapidquote/process/updateStatus',
					data : {
						processId : processId,
						status : status
					},
					//console.log(data);
					success : function(data) {
						console.log(data);
						$("#snackbar5").css("background-color", "#3d9c23c7");
						$("#snackbar5").text("Updated Successfully");
						snackBar5();
						viewProcesses();
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
