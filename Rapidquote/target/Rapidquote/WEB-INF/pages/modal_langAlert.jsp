
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modalLangAlert" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header card-header">
				<h3><fmt:message key="message.modal.text22"/></h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal content-->

			<div class="modal-body card-body" style="text-align: center;">
				<p><fmt:message key="message.modal.text23"/></p>
				<p><fmt:message key="message.modal.text24"/></p>
				<button class="modalbtn btn btn-primary" id="modal-btn-lang-yes0" onclick="changeLang()"><fmt:message key="message.modal.text11"/></button>
				<button class="modalbtn btn btn-primary" id="modal-btn-lang-no0" data-dismiss="modal"><fmt:message key="message.modal.text12"/></button>
			</div>
		</div>

	</div>
</div>