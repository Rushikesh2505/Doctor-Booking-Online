<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header card-header">
	<h3>Edit Finishing</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>


<div id="editFinishingForm" class="modal-body card-body">


	<label><fmt:message key="label.text126" /> </label>
	<div class="check">
		<input disabled class="form-control addcheck" type="text"
			id="editFinishingName" name="editFinishingName"
			value="${bean.finishingName}">
	</div>

	<div style="margin-top: 1em;" id="editFinishingFormulaDiv">
		<label> <fmt:message key="label.text66" />:
		</label><label class="clearbtn" onclick="clearTextArea()"><i
			class="fa fa-times" aria-hidden="true"></i>Clear</label>

		<textarea id="edit_finishingFormulaSpace"
			onkeyup="checkEditFinishingCharacter(event)"
			onkeydown="checkEditFinishingCharacter(event)"
			class="form-control formulaTextArea" rows="3"
			onclick="fx(document.getElementsByTagName('textarea')[1])"
			value="${bean.formula}">${bean.formula}</textarea>
	</div>

	<div style="margin-top: 1em;">
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_211"
			value="{SurfaceArea}" class="btn btn-color">Surface Area</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_212"
			value="{Volume}" class="btn btn-color">Volume</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_213"
			value="{Rate}" class="btn btn-color">Rate</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_214"
			value="{Density}" class="btn btn-color">Density</button>
		<button style="display: none;"
			onclick="edit_updateFinishingFormula(this.id)" id="btn_op_215"
			value="{Infill}" class="btn btn-color">Infill</button>
		<button style="display: none;"
			onclick="edit_updateFinishingFormula(this.id)" id="btn_op_216"
			value="{LayerThickness}" class="btn btn-color">Layer
			Thickness</button>

		<button onclick="edit_updateFinishingFormula(this.id)" value="{BBoxX}"
			id="btn_op_217" class="btn btn-color">BBoxX</button>
		<button onclick="edit_updateFinishingFormula(this.id)" value="{BBoxY}"
			id="btn_op_218" class="btn btn-color">BBoxY</button>
		<button onclick="edit_updateFinishingFormula(this.id)" value="{BBoxZ}"
			id="btn_op_219" class="btn btn-color">BBoxZ</button>
	</div>
	<div style="margin-top: 1em;">
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_221"
			value="+" class="btn btn-color">+</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_222"
			value="-" class="btn btn-color">-</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_223"
			value="*" class="btn btn-color">*</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_224"
			value="/" class="btn btn-color">/</button>
		<!-- <button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_225"
			value="^" class="btn btn-color">^</button> -->
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_226"
			value="(" class="btn btn-color">(</button>
		<button onclick="edit_updateFinishingFormula(this.id)" id="btn_op_227"
			value=")" class="btn btn-color">)</button>
	</div>


	<input type="hidden" id="finishingId" value="${bean.finishingId}" /> <input
		type="hidden" id="finishingName" value="${bean.finishingName}" /> <input
		type="hidden" id="editFinishingCode" value="${bean.finishingCode}" />
	<input type="hidden" id="status" value="${bean.status}" /> <input
		type="hidden" id="createdBy" value="${bean.createdBy}" /> <input
		type="hidden" id="createdDate" value="${bean.createdDate}" /> <input
		type="hidden" id="updatedBy" value="${bean.updatedBy}" /> <input
		type="hidden" id="updatedDate" value="${bean.updatedDate}" />
</div>


<div class="modal-footer card-footer">
	<div class="callout1" style="margin-right: 17%;">
		<div class="callout-header1"><b>Note</b> : Surface Area in (mm)<sup>2</sup>, Volume in (mm)<sup>3</sup>. &nbsp; Bx, By, Bz represents Bounding Box X, Y & Z.</div>

		<!-- <div class="callout-container1">
			<p>
				Surface Area in mm<sup>2</sup>, Volume in mm<sup>3</sup>. &nbsp; Bx,
				By, Bz represents Bonding Box X, Y & Z.
			</p>
		</div> -->
	</div>
	<div>
		<button class="btn btn-color" onclick="editFinishing()">
			<fmt:message key="label.text6" />
		</button>
	</div>

</div>