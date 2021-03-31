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
				<h2 style="color: white;"> <fmt:message key="label.text112" /></h2>
			</div>
			<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
				<button onclick="getMaxWeight()" class="modal-btn btn">
					
					<fmt:message key="label.text117" /> 
				</button>
			</div>
		</div>
	</div>

	<table class="table4 view">
		<thead class="thead4" style="background-color: black; color: white;">
			<tr>
				<!-- <th class="td4">Layer Thickness Id</th> -->
				<th class="td4"><fmt:message key="label.text114" /> </th>
				<th class="td4"><fmt:message key="label.text115" /> </th>
				<th class="td4"><fmt:message key="label.text116" /> </th>
				<th class="td4" colspan="1">Action</th>
			</tr>
		</thead>
		<tbody class="tbody4">
			<c:forEach items="${beans}" var="bean" varStatus="status">

				<tr>
					<td class="td4">${bean.minWeight}</td>
					<td class="td4">${bean.maxWeight}</td>
					<td class="td4">${bean.cost}</td>
					<td class="td4" id="${bean.shippingCostId}"
						onclick="updateShippingCost(this.id)" style="width: 50px">
					<i title="Edit" data-toggle="tooltip" 
						class="view-edit fa fa-edit"></i></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>

</body>
