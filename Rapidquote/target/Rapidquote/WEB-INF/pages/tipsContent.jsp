<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body>
	<div class="section3">
		<jsp:include page="header3.jsp" />
	
	</div>
	<div class="section3">
		<div class="col-md-12">
			<video width="100%-100px" height="540px" controls autoplay>
				<source src="${pageContext.request.contextPath}/resources/video/Rapidquote_video.mp4" type="video/mp4">
				<source src="${pageContext.request.contextPath}/resources/video/Rapidquote_video.ogg" type="video/ogg">
			</video>
		</div>
	</div>
	<%-- 	<div class="section3">
		<div class="col-md-12">
			<div class="row">
				<img class="howitworksimage"
					src="${pageContext.request.contextPath}/resources/images/demo/Capture1.PNG">
				<img class="howitworksimage"
					src="${pageContext.request.contextPath}/resources/images/demo/Capture2.PNG">
				<img class="howitworksimage"
					src="${pageContext.request.contextPath}/resources/images/demo/Capture3.PNG">
				<img class="howitworksimage"
					src="${pageContext.request.contextPath}/resources/images/demo/Capture4.PNG">
			</div>
		</div>
	</div> --%>
	<div class="section3">
		<footer
			style="height: 2%; text-align: right; background-color: #d8dee3;">
			<p style="font-size: 90%; margin-left: 1%; float: left;">
				<i class="fa fa-lock" aria-hidden="true"></i> Rapidquote
				<fmt:message key="message.uploadFile.text17" />
			</p>
			<p style="display: inline-block;">Copyright© 2019 TechniSURE</p>&nbsp&nbsp <a href="#">
			<p class="copyright" style="display: inline-block;">
					<fmt:message key="message.other.text8" />
				</p></a>&nbsp&nbsp <a href="#"><p class="copyright"
					style="display: inline-block;">
					<fmt:message key="message.other.text9" />
				</p></a>&nbsp&nbsp
		</footer>
	</div>
	<%@ include file="modal_langAlert.jsp"%>
	<%@ include file="modal_changeLang.jsp"%>
	<%@ include file="modal_callout.jsp"%>
	<%@ include file="modal_signin.jsp"%>
	<%@ include file="modal_signup.jsp"%>
	<%@ include file="modal_why.jsp"%>
	<%@ include file="modal_delete.jsp"%>
	<%@ include file="hidden_customer.jsp"%>
</body>