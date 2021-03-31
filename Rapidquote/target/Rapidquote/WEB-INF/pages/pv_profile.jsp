<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.profile{
    font-size: 110%;
    color: black;
    margin-left: 12%;
    margin-top: 2%;
}
</style>


<div class="modal-header card-header">
	<h3>Profile</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

	<%-- <img src="${pageContext.request.contextPath}/resources/images/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar"> --%>
	<%-- 	<div class="">
		<img src="${pageContext.request.contextPath}/resources/images/avatar_2x.png" style=" margin-left: 42%;
    width: 20%;
    margin-top:2%;"class="avatar img-circle img-thumbnail" alt="avatar">
   <div style="margin-left: 35%;color:black; font-size: 150%;">${bean.firstName} ${bean.lastName}</div>
		 <div class="profile">Email: ${bean.contactEmail}</div>
		  <div class="profile">Contact No. : ${bean.contactNumber}</div>
		   <div class="profile">Address: ${bean.address}</div>
		   	
			</div> --%>
<!-- Modal content-->

		 <div id="profileForm" class="modal-body card-body"
				style="text-align: center; margin-right: 5%; margin-left: 5%;">

				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input class="form-control" id="firstNamep" value="${bean.firstName}"
						 name="firstNamep" disabled />
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control" id="lastNamep" value="${bean.lastName}"
						name="lastNamep" disabled />
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-envelope"></i></span>
					</div> 
					<input type="email" class="form-control" id="contactEmailp" value="${bean.contactEmail}"
						 name="contactEmailp" disabled/>

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-phone"></i></span>
					</div>
					<input type="text" class="form-control" id="contactNumberp" value="${bean.contactNumber}"
						name="contactNumberp" disabled/>

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i
							class="fa fa-address-card-o"></i></span>
					</div>
					<input type="text" class="form-control" id="addressp" name="addressp" value="${bean.address}" disabled/>

				</div>
			</div>
			<div class="modal-footer card-footer">
			<a href="#" id="myOrders" onclick="getOrders()"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"><fmt:message key="message.uploadFile.text9" /></a>
				<div class="d-flex justify-content-center links">
				<a href="#" data-toggle="modal" data-target="#modal_forgot_password"
							data-dismiss="modal"><fmt:message key="message.modal.text4"/></a>
					<%-- <a href="" class="btn btn-default" data-toggle="modal"
						data-target="#modalwhy"><fmt:message key="message.modal.text1" /></a> --%>
				</div>
			</div>
	