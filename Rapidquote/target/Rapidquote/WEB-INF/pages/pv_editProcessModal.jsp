<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-header card-header">
	<h3>
		<fmt:message key="label.text133" />
	</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>


<div id="editProcessForm" class="modal-body card-body">
	<div style="display: none">
		<c:choose>
			<c:when test="${process.infillFactor == false}">
				<c:set value="" var="infillFactorStatus"></c:set>
			</c:when>
			<c:when test="${process.infillFactor == true}">
				<c:set value="Checked" var="infillFactorStatus"></c:set>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${process.layerThicknessFactor == false}">
				<c:set value="" var="layerThicknessFactorStatus"></c:set>
			</c:when>
			<c:when test="${process.layerThicknessFactor == true}">
				<c:set value="Checked" var="layerThicknessFactorStatus"></c:set>
			</c:when>
		</c:choose>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<label style="margin-bottom: unset;"> <fmt:message
					key="label.text10" /> :
			</label>
			<div id="proDiv">
				<input disabled class="form-control" type="text"
					id="editProcessName" value="${process.processName}"
					name="editProcessName">
			</div>
		</div>
		<div class="col-lg-4">
			<label style="margin-bottom: unset;"> <fmt:message
					key="label.text130" /> :
			</label>
			<div>
				<input onkeyup="checkContactFPNumber(this.id)"
					class="form-control addcheck ReqCheck" type="text"
					value="${process.minimumCost}" id="editMinCost" name="editMinCost">
			</div>
		</div>
		<div class="col-lg-4">
			<label style="margin-bottom: unset;"><fmt:message
					key="label.text131" />(mm): </label>
			<div>
				<input onkeyup="checkContactFPNumber(this.id)" class="form-control"
					type="text" value="${process.minimumThickness}"
					id="editMinThickness" name="editMinThickness">
			</div>
		</div>
	</div>

	<label style="margin-top: 0.5em; margin-bottom: unset;"><fmt:message
			key="label.text132" /> : </label>
	<div>
		<div class="row" style="margin: 0.1%">
			<div class="col-lg-4">
				<label><fmt:message key="label.text134" />(mm): </label>
				<div style="margin-bottom: unset;">
					<input onkeyup="checkContactFPNumber(this.id)"
						value="${process.maxBuildX}" class="form-control" type="text"
						id="editMaxBuildX">
				</div>
			</div>
			<div class="col-lg-4">
				<label style="margin-bottom: unset;"> <fmt:message
						key="label.text135" />(mm):
				</label>
				<div>
					<input onkeyup="checkContactFPNumber(this.id)"
						value="${process.maxBuildY}" class="form-control" type="text"
						id="editMaxBuildY">
				</div>
			</div>
			<div class="col-lg-4">
				<label style="margin-bottom: unset;"><fmt:message
						key="label.text136" />(mm): </label>
				<div>
					<input onkeyup="checkContactFPNumber(this.id)"
						value="${process.maxBuildZ}" class="form-control" type="text"
						id="editMaxBuildZ">
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 0.5em;">
		<div class="row" style="margin: 0.1%">
			<div class="col-lg-4">
				<label><fmt:message key="label.text128" />:</label> <input
					type="checkbox" id="editInfillFactor" class="checkbox_check"
					${infillFactorStatus} onclick="addEditInfillBtn()" ${disabledI} />
			</div>
			<div class="col-lg-4">
				<label>layerThicknessFactor :</label> <input type="checkbox"
					id="editLayerThicknessFactor" ${layerThicknessFactorStatus}
					onclick="addEditLayerBtn()" ${disabledL} />
			</div>
			<div class="col-lg-4">
				<label style="margin-bottom: unset;">Print Rate (gm/hrs): </label> <input
					style="display: unset; width: 93px;"
					onkeyup="checkForInteger(this.id)"
					class="form-control ReqCheck addcheck" type="text"
					id="editManufacturingTime" value="${process.manufacturingTime}">
			</div>
		</div>

	</div>

	<div style="margin-top: 0.5em;">
		<label> <fmt:message key="label.text66" />:
		</label><label class="clearbtn" onclick="clearTextArea()"><i
			class="fa fa-times" aria-hidden="true"></i>Clear</label>

		<textarea style="height: 50px;" id="edit_formulaSpace"
			onkeyup="checkCharacter(event)" onkeydown="checkCharacter(event)"
			class="form-control formulaTextArea" rows="3"
			onclick="fx(document.getElementsByTagName('textarea')[1])"
			value="${process.formula}">${process.formula}</textarea>
	</div>

	<div style="margin-top: 0.5em;">
		<button onclick="edit_updateFormula(this.id)" id="btn_op_211"
			value="{SurfaceArea}" class="btn btn-color">Surface Area</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_212"
			value="{Volume}" class="btn btn-color">Volume</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_213"
			value="{Rate}" class="btn btn-color">Rate</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_214"
			value="{Density}" class="btn btn-color">Density</button>
		<button style="display: none;" onclick="edit_updateFormula(this.id)"
			id="btn_op_215" value="{Infill}" class="btn btn-color">Infill</button>
		<button style="display: none;" onclick="edit_updateFormula(this.id)"
			id="btn_op_216" value="{LayerThickness}" class="btn btn-color">Layer
			Thickness</button>
	</div>
	<div style="margin-top: 0.5em;">
		<button onclick="edit_updateFormula(this.id)" id="btn_op_221"
			value="+" class="btn btn-color">+</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_222"
			value="-" class="btn btn-color">-</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_223"
			value="*" class="btn btn-color">*</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_224"
			value="/" class="btn btn-color">/</button>
		<!-- <button onclick="edit_updateFormula(this.id)" id="btn_op_225"
			value="^" class="btn btn-color">^</button> -->
		<button onclick="edit_updateFormula(this.id)" id="btn_op_226"
			value="(" class="btn btn-color">(</button>
		<button onclick="edit_updateFormula(this.id)" id="btn_op_227"
			value=")" class="btn btn-color">)</button>
	</div>

	<div class="modal-footer card-footer">
		<input type="hidden" id="processId" value="${process.processId}" /> <input
			type="hidden" id="processCode" value="${process.processCode}" /> <input
			type="hidden" id="status" value="${process.status}" /> <input
			type="hidden" id="createdBy" value="${process.createdBy}" /> <input
			type="hidden" id="createdDate" value="${process.createdDate}" /> <input
			type="hidden" id="updatedBy" value="${process.updatedBy}" /> <input
			type="hidden" id="updatedDate" value="${process.updatedDate}" /> <input
			type="hidden" id="updatedMinCost" value="${process.minimumCost}" />
		<input type="hidden" id="updatedMinThickness"
			value="${process.minimumThickness}" /> <input type="hidden"
			id="updatedInfillFactor" value="${process.infillFactor}" /> <input
			type="hidden" id="updatedlayerThicknessFactor"
			value="${process.layerThicknessFactor}" /> <input type="hidden"
			id="updatedMaxBuildX" value="${process.maxBuildX}" /> <input
			type="hidden" id="updatedMaxBuildY" value="${process.maxBuildY}" />
		<input type="hidden" id="updatedMaxBuildZ"
			value="${process.maxBuildZ}" />
		<div class="callout1" style="margin-right: 47%;">
			<div class="callout-header1">
				<b>Note</b> : Surface Area in (mm)<sup>2</sup>, Volume in (mm)<sup>3</sup>,
				Density in (g/cm<sup>3</sup>).
			</div>
		</div>
		<div>
			<button class="btn btn-color" onclick="editProcess()">
				<fmt:message key="label.text6" />
			</button>
		</div>
	</div>
</div>