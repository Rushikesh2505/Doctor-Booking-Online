
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modalLoginFormAdmin" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header card-header">
				<h3><fmt:message key="message.admin.text1"/></h3>
			</div>
			<!-- Modal content-->

			<div id="loginFormAdmin" class="modal-body card-body"
				style="text-align: center;">
				<div class="input-group form-group" id="data-tip-username">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control" name="username"
						id="usernameAdmin" placeholder="<fmt:message key="message.other.text10"/>" onkeyup="checkFields(this.id)">
				</div>
				<div class="input-group form-group" id="data-tip-password">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-key"></i></span>
					</div>
					<input type="password" class="form-control" name="password"
						id="signInpasswordAdmin" placeholder="<fmt:message key="message.other.text6"/>" onkeyup="checkFields(this.id)">
				</div>
				<div class="form-group">
					<button onclick="loginAdmin()" value="Login"
						class="btn float-right login_btnAdmin"><fmt:message key="message.modal.text5"/></button>
				</div>
			</div>
			<div class="modal-footer card-footer">
				<%-- <div class="d-flex justify-content-center">
					<a><fmt:message key="message.modal.text4"/></a>
				</div> --%>
			</div>
		</div>
	</div>
</div>
