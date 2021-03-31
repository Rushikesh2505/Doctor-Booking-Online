
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header card-header">
				<h3><fmt:message key="message.uploadFile.text8"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div id="loginForm" class="modal-body card-body"
				style="text-align: center;">
				<div class="input-group form-group" id="data-tip-username">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control" name="username"
						id="username" placeholder="<fmt:message key="message.other.text10"/>" onkeyup="checkFields(this.id)">
				</div>
				
				<div class="input-group form-group" id="data-tip-password">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-key"></i></span>
					</div>
					<input type="password" class="form-control" name="password"
						id="signInpassword" placeholder="<fmt:message key="message.other.text6"/>" onkeyup="checkFields(this.id)">
				</div>
				<!-- <div class="row align-items-center remember">
					<input type="checkbox">Remember Me
				</div> -->
				<div class="form-group">
					<button onclick="loginUser()" value="Login"
						class="btn float-right login_btn"><fmt:message key="message.modal.text5"/></button>
				</div>
			</div>
			<div class="modal-footer card-footer">
				<div class="d-flex justify-content-center links">
					<fmt:message key="message.modal.text2"/> Rapidquote <fmt:message key="message.modal.text3"/>?<a href="#" onclick="openSignUp()"><fmt:message key="message.text71"/></a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#" data-toggle="modal" data-target="#modal_forgot_password"
							data-dismiss="modal"><fmt:message key="message.modal.text4"/></a>
				</div>
			</div>
		</div>
	</div>
</div>
