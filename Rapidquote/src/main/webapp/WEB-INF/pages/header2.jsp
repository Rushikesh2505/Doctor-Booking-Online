<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="ts3d-new-container">
	<div class="ts3d-top">
		<div class="ts3d-bar ts3d-card ts3d-white" id="myNavbar">
			<a class="ts3d-bar-item ts3d-button ts3d-hover-black ts3d-hide-medium ts3d-hide-large ts3d-right"
				href="javascript:void(0);" id="qwerty" onclick="toggleFunction(this.id)"
				title="Toggle Navigation Menu"> <i class="fa fa-bars"></i>
			</a>
			<a href="${pageContext.request.contextPath}/admin/" class="pointer ts3d-bar-item ts3d-button">
			<img class="img-ts3d1"
				src="${pageContext.request.contextPath}/resources/images/logodoctor.png" />
			</a>
		
		<div>
		
		<h1>Doctor Pannel</h1>
		</div>
			<div
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar">
				<ul class="pointer" onclick="changeLang2()" id="currentLang2"
					style="width: 77.8594px; margin: 0 ! important; padding: 0 ! important; list-style: none !important;"> English
					<i class="fa fa-caret-down"></i>
				</ul>
				<ul id="listLang"
					style="width: 77.8594px; list-style: none !important; display: none; margin: 0 ! important; padding: 0 ! important; background-color: #d8dee3;">
					<li><a onclick="updateLang2()" href="?lang=fr"><fmt:message
								key="message.lang.fr" /></a></li>
					<li><a href="?lang=cn"><fmt:message key="message.lang.cn" /></a></li>
					<li><a href="?lang=de"><fmt:message key="message.lang.de" /></a></li>
					<li><a href="?lang=en"><fmt:message key="message.lang.en" /></a></li>
					<li><a href="?lang=sp"><fmt:message key="message.lang.sp" /></a></li>
					<li><a href="?lang=vi"><fmt:message key="message.lang.vi" /></a></li>
				</ul>

			</div>
			
			<a href="#" style="display: none;" id="signOutAdmin" onclick="logoutAdmin()"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar">
				<fmt:message key="message.uploadFile.text10" /></a>
				<%-- <a href="${pageContext.request.contextPath}/upload/cart" id ="cart" style="display: none;" class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right ts3d-hover-black new-bar">
				<input id="cartItemNo" type="hidden" value="${user.cartNo}"/><div class="cartNotify" style="display:none;">0</div>
				<i class="fa fa-shopping-cart" style="font-size:x-large;"></i>
			</a> --%>
			<%-- <a href="#"
				style="display: none;" id="myOrdersAdmin" onclick="getOrders()"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"><fmt:message
					key="message.uploadFile.text9" /></a> --%>
			<a id="signInAdmin" href="#"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"
				data-toggle="modal" data-target="#modalLoginFormAdmin"><fmt:message
					key="message.uploadFile.text8" /></a>
			<%-- <a id="signUpAdmin" href="#"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"
				data-toggle="modal" data-target="#modalSignUpForm"><fmt:message
					key="message.uploadFile.text7" /></a> --%>
			<a id="adminName"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar">${admin.firstName} ${admin.lastName}</a>

		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="ts3d-bar-block ts3d-white ts3d-hide ts3d-hide-large ts3d-hide-medium">
			<a class="ts3d-bar-item ts3d-button" onclick="toggleFunction()"><fmt:message
					key="message.uploadFile.text5" /></a>
			<a
				href="${pageContext.request.contextPath}/upload/howitworks"
				class="ts3d-bar-item ts3d-button" onclick="toggleFunction()"><fmt:message
					key="message.uploadFile.text6" /></a>
			<a href="#" style="display: none;"
				id="signOut1" onclick="logout1()" class="ts3d-bar-item ts3d-button"><fmt:message
					key="message.uploadFile.text10" /></a>
		
			<a id="signIn1" href="#"
				class="ts3d-bar-item ts3d-button" data-toggle="modal"
				data-target="#modalLoginForm"><fmt:message
					key="message.uploadFile.text8" /></a>
			<a id="signUp1" href="#"
				class="ts3d-bar-item ts3d-button" data-toggle="modal"
				data-target="#modalSignUpForm"><fmt:message
					key="message.uploadFile.text7" /></a>
			<a id="adminName"
				class="ts3d-bar-item ts3d-button">${adminId}</a>
			<div class="ts3d-bar-item ts3d-button">
				<ul
					style="margin: 0 ! important; padding: 0 ! important; list-style: none !important;">
					English
					<i class="fa fa-caret-down"></i>
				</ul>
				<ul
					style="width: 77.8594px; list-style: none !important; display: none; margin: 0 ! important; padding: 0 ! important; background-color: #d8dee3;">
					<li><a href="?lang=fr"><fmt:message key="message.lang.fr" /></a></li>
					<li><a href="?lang=cn"><fmt:message key="message.lang.cn" /></a></li>
					<li><a href="?lang=de"><fmt:message key="message.lang.de" /></a></li>
					<li><a href="?lang=en"><fmt:message key="message.lang.en" /></a></li>
					<li><a href="?lang=sp"><fmt:message key="message.lang.sp" /></a></li>
					<li><a href="?lang=vi"><fmt:message key="message.lang.vi" /></a></li>
				</ul>

			</div>

		</div>
	</div>
</div>
