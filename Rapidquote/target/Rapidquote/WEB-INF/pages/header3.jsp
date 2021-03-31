
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="ts3d-new-container">

	<div class="ts3d-top">
		<div class="ts3d-bar ts3d-card ts3d-white" id="myNavbar">
			<a
				class="ts3d-bar-item ts3d-button ts3d-hover-black ts3d-hide-medium ts3d-hide-large ts3d-right"
				href="javascript:void(0);" id="qwerty"
				onclick="toggleFunction(this.id)" title="Toggle Navigation Menu">
				<i class="fa fa-bars"></i>
			</a>
			<a href="${pageContext.request.contextPath}/"
				class="pointer ts3d-bar-item ts3d-button"> <img class="img-ts3d1"
				src="${pageContext.request.contextPath}/resources/images/logo.png" />
			</a> 
		
			<a href="${pageContext.request.contextPath}/3dPrinting"
				class="ts3d-bar-item ts3d-button ts3d-hide-small new-bar"><fmt:message
					key="message.uploadFile.text5" /></a>
			<a href="${pageContext.request.contextPath}/howitworks" target="_blank"
				class="ts3d-bar-item ts3d-button ts3d-hide-small new-bar"><fmt:message
					key="message.uploadFile.text6" /></a>
								<a href="${pageContext.request.contextPath}/info"class="ts3d-bar-item ts3d-button ts3d-hide-small new-bar">Why Rapidquote ?</a>
					<%-- 	<a href="${pageContext.request.contextPath}/pricing"
				class="ts3d-bar-item ts3d-button ts3d-hide-small new-bar"><fmt:message
					key="message.text65" /></a> --%>
			<a href="#" style="display: none;"
				id="signOut" onclick="logout()"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"><fmt:message
					key="message.uploadFile.text10" /></a>
			<a onclick="getCart()" id="cart"
				style="display: none;"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right ts3d-hover-black new-bar">
				<input id="cartItemNo" type="hidden" value="${user.cartNo}" />
			<div class="cartNotify" style="display: none;">0</div> <i
				class="fa fa-shopping-cart" style="font-size: x-large;"></i>
			</a>
			<a href="#" style="display: none;" id="myOrders"
				onclick="getOrders()"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"><fmt:message
					key="message.uploadFile.text9" /></a>
			<a id="signIn" href="#"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"
				data-toggle="modal" data-target="#modalLoginForm"><fmt:message
					key="message.uploadFile.text8" /></a>
			<a id="signUp" href="#"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar"
				data-toggle="modal" data-target="#modalSignUpForm"><fmt:message
					key="message.uploadFile.text7" /></a>
			<a id="userfullname"  href="#" onclick="openProfile()"
				class="ts3d-bar-item ts3d-button ts3d-hide-small ts3d-right new-bar">${user.firstName}
				${user.lastName}</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="ts3d-bar-block ts3d-white ts3d-hide ts3d-hide-large ts3d-hide-medium">
			<a class="ts3d-bar-item ts3d-button" onclick="toggleFunction()"><fmt:message
					key="message.uploadFile.text5" /></a>
			<a href="${pageContext.request.contextPath}/upload/howitworks"
				class="ts3d-bar-item ts3d-button" onclick="toggleFunction()"><fmt:message
					key="message.uploadFile.text6" /></a>
			<a href="#" style="display: none;"
				id="signOut1" onclick="logout1()" class="ts3d-bar-item ts3d-button"><fmt:message
					key="message.uploadFile.text10" /></a>
			<a href="#" style="display: none;" id="myOrders1" onclick="getOrders()"
				class="ts3d-bar-item ts3d-button"><fmt:message key="message.uploadFile.text9" /></a>
			<a id="signIn1" href="#" class="ts3d-bar-item ts3d-button" data-toggle="modal"
				data-target="#modalLoginForm"><fmt:message key="message.uploadFile.text8" /></a>
			<a id="signUp1" href="#" class="ts3d-bar-item ts3d-button" data-toggle="modal"
				data-target="#modalSignUpForm"><fmt:message key="message.uploadFile.text7" /></a>
			<a id="userfullname1" href="#" onclick="openProfile()" class="ts3d-bar-item ts3d-button">${user.firstName}
				${user.lastName}</a>
			<a id="cart1" style="display: none;"
				onclick="getCart()" class="ts3d-bar-item ts3d-button">
			<input id="cartItemNo" type="hidden" value="${user.cartNo}" /> Cart
			</a>
		</div>
	</div>
</div>
