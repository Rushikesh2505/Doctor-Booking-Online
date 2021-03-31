<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
table {
font-size:smaller;
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
  overflow-y: scroll; /* keeps the scrollbar even if it doesn't need it; display purpose */
}

th, td {
 text-align: center;
  width: 11.11%; /* to enable "word-break: break-all" */
  padding: 5px;
  word-break: break-all; /* 4. */
}

tr {
  display: table; /* display purpose; th's border */
  width: 100%;
  box-sizing: border-box; /* because of the border (Chrome needs this line, but not FF) */
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
					<h2 style="color:white;"><fmt:message key="label.quoteDetails.text6" /></h2>
				</div>
				<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
					<button onclick="openMaterialModal()"
						 class="modal-btn btn"><fmt:message key="label.text12" /></button>
				</div>
			</div>
		</div>
		<table class="table3 view">
			<thead class="thead3" style="background-color: black; color: white;">
				<tr>
					<th class="td3"><fmt:message key="label.text33" /></th>
					<th class="td3"><fmt:message key="label.text13" /></th>
					<th class="td3"><fmt:message key="label.text17" /> (per gram)</th>
					<th class="td3"><fmt:message key="label.text16" /></th>
					<th class="td3"><fmt:message key="label.text14" /></th>
					<th class="td3"><fmt:message key="label.text19" /></th>
					<th class="td3"><fmt:message key="label.text18" /></th>
					<th class="td3"><fmt:message key="label.text26" /></th>
					<th class="td3" colspan="2"><fmt:message key="label.text27" /></th>
				</tr>
			</thead>
			<tbody class="tbody3">
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
						<td  class="td3" id="matrow${status.count}">${status.count}</td>
						<td class="td3" style="max-width: 120px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" data-toggle="tooltip" title="${bean.materialName}">${bean.materialName}</td>
						<td class="td3"> ${bean.rate}</td>
						<td  class="td3">${bean.density}</td>
						<td 
							class="td3" data-toggle="tooltip" title="${bean.description}" style="max-width: 120px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${bean.description}</td>
						<td class="td3" cid="${bean.categoryId}">${bean.categoryName}</td>
						<td class="td3"  mpid="${bean.materialProcessId}"
							pid="${bean.mfgProcessId}">${bean.mfgProcessName}</td>
						
						<td  class="" style="width:60px" id="statusM${status.count}" >
							<input class="toggle-material" ${disabled}
						mId="${bean.materialId}" data-on="Active"  data-off="Inactive" data-onstyle="success" data-offstyle="danger" type="checkbox" data-toggle="toggle" data-size="small"></td>
						<td id="statusME${status.count}" mId="${bean.materialId}" onclick="updateMaterial(this.id)"  style="width:60px" >
						<i title="Edit" data-toggle="tooltip"  class="view-edit fa fa-edit"></i></td>
						<td id="statusMED${status.count}" data-toggle="modal"
						data-target="#delete-modal-14" data-whatever="${bean.materialId}"  style="width:60px" >
						<i title="Delete" data-toggle="tooltip" class="view-edit fa fa-trash pointer" aria-hidden="true"></i></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		

		<%-- <table class="view">
			<thead style="background-color: black; color: white;">
				<tr>
					<th width="11.11%">Material No</th>
					<th width="11.11%">Name</th>
					<th width="11.11%">Rate</th>
					<th width="11.11%">Density</th>
					<th width="11.11%">Description</th>
					<th width="11.11%">Category</th>
					<th width="11.11%">Process</th>
					<th width="11.11%">Status</th>
					<th colspan="2" width="10%">Action</th>
				</tr>
			</thead>
			<tbody class="tbody">
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
						<td width="11.11%" id="matrow${status.count}">MAT${status.count}</td>
						<td width="11.11%">${bean.materialName}</td>
						<td width="11.11%">${bean.rate}</td>
						<td width="11.11%">${bean.density}</td>
						<td width="11.11%"
							data-toggle="tooltip" title="${bean.description}" style="max-width: 79px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${bean.description}</td>
						<td width="11.11%" cid="${bean.categoryId}">${bean.categoryName}</td>
						<td width="11.11%" mpid="${bean.materialProcessId}"
							pid="${bean.mfgProcessId}">${bean.mfgProcessName}</td>
						<td >${statusText}</td>	
						<td id="statusM${status.count}" mId="${bean.materialId}" onclick="updateMaterialStatus(this.id)" width="5.5%">
							<label class="switch"> <input type="checkbox" ${disabled}>
									<span class="slider round"></span>
							</label></td>
						<td id="statusME${status.count}" mId="${bean.materialId}" onclick="updateMaterial(this.id)" width="5.5%"><i class="view-edit fa fa-edit"></i></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
 --%>
 	<script>
		$(function() {
			$('.toggle-material').bootstrapToggle();

			$('.toggle-material').change(function() {
				console.log('Toggle: ' + $(this).prop('checked'));
				console.log('MaterialId: ' + $(this).attr('mfgPId'));
				
				var status = $(this).prop('checked');
				var materialId = $(this).attr('mId');
				
				$.ajax({
					type : 'POST',
					url : '/Rapidquote/material/updateStatus',
					data : {
						materialId : materialId,
						status : status
					},
					success : function(data) {
						console.log(data);
						$("#snackbar5").css("background-color", "#3d9c23c7");
						$("#snackbar5").text("Updated Successfully");
						snackBar5();
						viewMaterials();
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
