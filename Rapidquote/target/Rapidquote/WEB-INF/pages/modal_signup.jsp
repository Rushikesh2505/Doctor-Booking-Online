
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modalSignUpForm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header card-header">
				<h3>Appointment Book</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div id="userForm" class="modal-body card-body"
				style="text-align: center; margin-right: 5%; margin-left: 5%;">

				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck" id="firstNameU"
						onkeyup="checkNotEmptyU(this.id)" name="firstName" placeholder="<fmt:message key="message.other.text1"/>" onkeyup="checkFields(this.id)">
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck" id="Age"
						onkeyup="checkNotEmptyU(this.id)" name="Age" placeholder="Age" onkeyup="checkFields(this.id)">
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-envelope"></i></span>
					</div>
					<input type="email" class="form-control signUpcheck" id="contactEmailU"
						 name="contactEmail" placeholder="<fmt:message key="message.other.text3"/>">

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-phone"></i></span>
					</div>
					<input type="text" class="form-control" id="contactNumberU"
						name="contactNumber" placeholder="<fmt:message key="message.other.text4"/>" onkeyup="checkContactNumber(this.id)">

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i
							class="fa fa-address-card-o"></i></span>
					</div>
					<input type="text" class="form-control" id="addressU" name="address"
						placeholder="Address">

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-calendar"></i></span>
					</div>
					<input type="date" class="form-control signUpcheck" id=booking>
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-calendar"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck"  placeholder="DOB" id="birthday">
				</div>
				
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-file"></i></span>
					</div>
					<input type="file" class="form-control signUpcheck" accept=".pdf"id="reprotfile">

				</div>
				
				<div class="form-group">
					<button onclick="createAppointment()" value="Sign Up"
						class="btn float-right signup_btn">Submit</button>
				</div>

			</div>
			
		</div>
	</div>
</div>
