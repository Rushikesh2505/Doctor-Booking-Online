
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modalSignUpForm1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"data-focus-on="input:first">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header card-header">
				<h3>Shipping Information</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div id="shippingForm" class="modal-body card-body"
				style="text-align: center; margin-right: 5%; margin-left: 5%;">

				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck" id="fullNameS"
						onkeyup="checkNotEmptyU(this.id)" name="sfullName" placeholder="Full Name">

				</div>
				<%-- <div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-user"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck" id="lastNameU"
						onkeyup="checkNotEmptyU(this.id)" name="lastName" placeholder="<fmt:message key="message.other.text2"/>" onkeyup="checkFields(this.id)">
				</div> --%>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-envelope"></i></span>
					</div>
					<input type="email" class="form-control signUpcheck" id="scontactEmailU" name="scontactEmailU"
						 name="scontactEmail" placeholder="<fmt:message key="message.other.text3"/>" onchange="checkshippingContactEmail(this.id)">

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-phone"></i></span>
					</div>
					<input type="number" class="form-control signUpcheck" id="scontactNumber"
						name="scontactNumber" placeholder="<fmt:message key="message.other.text4"/>" onkeyup="checkContactNumber(this.id)">

				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i
							class="fa fa-address-card-o"></i></span>
					</div>
					<textarea class="form-control signUpcheck" id="sAddressU" name="sAddressU" placeholder="Complete Address" onkeyup="checkNotEmptyU(this.id)"></textarea>
					<!-- <textarea type="text" class="form-control" id="CountryU" name="complete address" placeholder="Complete Address">
                    </textarea> -->
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;
						<i class="fa fa-address-card-o"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck" id="sCountryU" name="sCountryU"onkeyup="checkNotEmptyU(this.id)"
						placeholder="<fmt:message key="message.text32"/>">

				</div>
				
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;&nbsp;<i class="fa fa-address-card-o"></i></span>
					</div>
					<input type="text" class="form-control signUpcheck" id="szipCodeU" name="szipCodeU"onkeyup="checkNotEmptyU(this.id)"
						placeholder="Zip / Postal Code">
				</div>
				
				<div class="form-group">
					<button type="button" class="btn btn-danger addToCartButton"
						onclick="checkShippingField()" >
						<fmt:message key="label.cart.text9" />
					</button>
<!-- data-toggle="modal" data-target="#confirmOrder-modal" -->
				</div>
			</div>
			
		</div>
	</div>
</div>
