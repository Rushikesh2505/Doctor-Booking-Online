
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal -->
<div class="modal fade" id="remove-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3><fmt:message key="message.modal.text9"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body" style="text-align: center;">
				<b><fmt:message key="message.modal.text10"/></b><br>
				<button class="modalbtn btn btn-primary" id="modal-btn-yes4"><fmt:message key="message.modal.text11"/></button>
				<button class="modalbtn btn btn-primary" id="modal-btn-no4"><fmt:message key="message.modal.text12"/></button>
			</div>

		</div>

	</div>
</div>