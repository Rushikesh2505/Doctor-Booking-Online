
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal_forgot_password" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header card-header">
				<h3><fmt:message key="message.text68"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal content-->
			<div id="" class="modal-body card-body"
				style="text-align: center;">
				<div class="input-group form-group" id="data-tip-username">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control" name="username"
						id="forgotpass_email" placeholder="<fmt:message key="message.other.text10"/>" onkeyup="checkFields(this.id)">
				</div>
				<!-- <div class="row align-items-center remember">
					<input type="checkbox">Remember Me
				</div> -->
				<div class="form-group">
					<button onclick="forgotPassword()"
						class="btn float-right login_btn"><fmt:message key="message.text69"/></button>
				</div>
			</div>
		</div>
	</div>
</div>
