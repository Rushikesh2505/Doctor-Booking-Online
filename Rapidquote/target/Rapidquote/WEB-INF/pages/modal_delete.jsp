
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Modal -->
<div class="modal fade" id="delete-modal-0" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3><fmt:message key="message.modal.text14"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" style="text-align: center;">
				<b><fmt:message key="message.modal.text15"/></b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes0"><fmt:message key="message.modal.text11"/></button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no0"><fmt:message key="message.modal.text12"/></button>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="delete-modal-1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3><fmt:message key="message.modal.text16"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b><fmt:message key="message.modal.text17"/></b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes1"><fmt:message key="message.modal.text11"/></button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no1"><fmt:message key="message.modal.text12"/></button>
			</div>

		</div>

	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="delete-modal-3" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3><fmt:message key="message.modal.text18"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b><fmt:message key="message.modal.text19"/></b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes3"><fmt:message key="message.modal.text11"/></button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no3"><fmt:message key="message.modal.text12"/></button>
			</div>

		</div>

	</div>
</div>


<!-- Modal Process-->
<div class="modal fade" id="delete-modal-5" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Delete Manufacturing Process</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to delete this manufacturing process?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes5">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no5">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Infill-->
<div class="modal fade" id="delete-modal-6" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Delete Infill Factor</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to delete this infill?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes6">
			Yes
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no6">
			No
				</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal Layer Thickness-->
<div class="modal fade" id="delete-modal-7" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Delete Layer Thickness</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to delete this layer thickness?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes7">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no7">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal  -->
<div class="modal fade" id="delete-modal-12" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: unset;">
				<%-- 	<h3><fmt:message key="label.modal.text18"/></h3> --%>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b>Are you sure want to set as Default</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes12">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no12">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>

		</div>

	</div>
</div>


<!-- Modal Color-->
<div class="modal fade" id="delete-modal-9" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Delete Color</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to delete this color?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes9">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no9">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="delete-modal-10" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: unset;">
				<%-- 	<h3><fmt:message key="label.modal.text18"/></h3> --%>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure want to set as Default</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes10">
				Yes
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no10">
				No
				</button>
			</div>
		</div>
	</div>
</div>


<!--Layer Thikness Status Modal  -->
<div class="modal fade" id="delete-modal-11" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: unset;">
				<%-- 	<h3><fmt:message key="label.modal.text18"/></h3> --%>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b>Are you sure want to set as Default</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes11">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no11">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>

		</div>

	</div>
</div>

<!-- Modal For Infill Status -->
<div class="modal fade" id="delete-modal-12" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: unset;">
				<%-- 	<h3><fmt:message key="label.modal.text18"/></h3> --%>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b>Are you sure want to set as Default</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes12">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no12">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>

		</div>

	</div>
</div>


<<!--  -->

<div class="modal fade" id="delete-modal-13" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: unset;">
			
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure want to set as Default</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes13">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no13">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Material-->
<div class="modal fade" id="delete-modal-14" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Delete Material</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to delete this material?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes14">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no14">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Finishing-->
<div class="modal fade" id="delete-modal-8" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Delete Finishing</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->
			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to delete this finishing?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes8">
					<fmt:message key="label.modal.text11" />
				</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no8">
					<fmt:message key="label.modal.text12" />
				</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="confirmOrder-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" tabindex="-1" data-focus-on="input:first" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3>Confirm Order</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b>Are you sure you want to place the order?</b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes16">Yes</button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no16">No</button>
			</div>

		</div>

	</div>
</div>



