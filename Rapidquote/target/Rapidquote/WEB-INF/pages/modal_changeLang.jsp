<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Modal -->
<div class="modal fade" id="lang-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3><fmt:message key="message.text11" /> :</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" style="">
				<li><a href="?lang"><fmt:message key="message.lang.en" /></a></li>
				<li><a href="?lang=cn"><fmt:message key="message.lang.cn" /></a></li>
				<li><a href="?lang=fr"><fmt:message key="message.lang.fr" /></a></li>
				<li><a href="?lang=de"><fmt:message key="message.lang.de" /></a></li>
				<li><a href="?lang=sp"><fmt:message key="message.lang.sp" /></a></li>
			</div>

		</div>

	</div>
</div>