<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="links.jsp" />
<body
	style="background-image: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.5)),url('${pageContext.request.contextPath}/resources/images/maxresdefault.jpg');">
	<div class="section4" style="position: unset;">
		<jsp:include page="header3.jsp" />
	</div>
	<div class="section4">
		<section
			style="margin-left: 2%; margin-right: 2%; font-size: smaller; border: 1px solid light-grey">
			<div style="color: white !important; text-align: center;">
				<h2 class="roi-heading"><fmt:message key="message.text75"/></h2>
				<label class="typography-lead"><fmt:message key="message.text76"/></label>
			</div>
			<div class="row" style="margin-right: unset; margin-left: unset;">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
					<table class="table table-bordered" style="font-size: unset;">
						<thead>
							<tr style="color: black; font-size: unset;">
								<th colspan="2"
									style="text-align: center; background-color: #d8dee4;">
									<fmt:message key="message.text77"/></th>
							</tr>
						</thead>
						<tbody style="color:white!important;">
							<tr>
								<td class="tdf"><fmt:message key="message.text78"/></td>
								<td class="tdf"><fmt:message key="message.text79"/></td>
							</tr>
							<tr>
								<td class="tdf">$150</td>
								<td class="tdf">$1500</td>
							</tr>
						</tbody>
					</table>
					<label style="margin-left: 20%; font-weight: 600;color:white;"><fmt:message key="message.text80"/></label>
					<ul style="margin-left: 15%;color:white;">
						<li>STL, OBJ</li>
						<li>Bounding box</li>
						<li>Wireframe view</li>
						<li>Transparancy</li>
						<li>Smooth</li>
						<li>Colour</li>
						<li>Spin</li>
						<li>Orthogographic views</li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
					<table class="table table-bordered" style="font-size: unset;">
						<thead>
							<tr style="color: black; font-size: unset;">
								<th colspan="2"
									style="text-align: center; background-color: #d8dee4;">
									<fmt:message key="message.text81"/></th>
							</tr>
						</thead>
						<tbody style="color:white!important;">
							<tr>
								<td class="tdf"><fmt:message key="message.text78"/></td>
								<td class="tdf"><fmt:message key="message.text79"/></td>
							</tr>
							<tr>
								<td class="tdf">$200</td>
								<td class="tdf">$2000</td>
							</tr>
						</tbody>
					</table>
					<label style="margin-left: 20%; font-weight: 600;color:white;"><fmt:message key="message.text82"/></label>
					<ul style="margin-left: 15%;color:white;">
						<li>STL, OBJ, STEP, IGS</li>
						<li>Bounding box</li>
						<li>Wireframe view</li>
						<li>Transparancy</li>
						<li>Smooth</li>
						<li>Colour</li>
						<li>Spin</li>
						<li>Orthogographic views</li>
						<li>Cross Section</li>
						<li>Rotate</li>
						<li>Export to STL</li>
					</ul>
				</div>
				<div style="color: black;"
					class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<div class="row" style="">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="row"
								style="background-color: #d8dee4; border: 1px solid #dee2e6;">
								<div style="text-align: center;"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<div style="padding-top: 10px;">
										<label class="iconValue" id="CPQuote">$25</label><br> <span
											class="small1"><fmt:message key="message.text83"/></span>
									</div>
								</div>
								<div style="text-align: center;"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

									<div class="slidecontainer">
										<label class="iconValue" id="avgTimePerCost"></label><br>
										<input type="range" min="30" max="210" step="30" value="50"
											class="sliderP" id="avgTime" onchange="costPerQuote()">
										<label class="typography-medium"><fmt:message key="message.text84"/></label>
									</div>
								</div>
							</div>

							<div class="row"
								style="margin-bottom: 3%; margin-top: 3%; background-color: #d8dee4;">
								<div style="text-align: center;"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<div class="slidecontainer">
										<label class="iconValue" id="demo"></label><br> <input
											type="range" min="10" max="100" step="5" value="15"
											class="sliderP" id="myRange" onchange="costPerQuote()">
										<span class="typography-medium"><fmt:message key="message.text85"/><i
											class="	fa fa-usd" style='font-size: 20px;'></i></span>
									</div>
								</div>
								<div style="text-align: center;"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<div class="slidecontainer">
										<label class="iconValue" id="noOfQuote"></label><br> <input
											type="range" min="50" max="300" step="50" value="80"
											class="sliderP rangeP" id="noOfQuoteRange"
											onchange="costPerQuote()"> <label
											class="typography-medium"><fmt:message key="message.text86"/></label>
									</div>
								</div>
							</div>
						<div class="row"
								style="margin-bottom: 3%; margin-top: 3%; background-color: #d8dee4;">
								<div style="text-align: center; padding-top: 10px"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6 subscriptionValue">
									<div class="slidecontainer">
										<label>$150</label><br> <label class="typography-medium"><fmt:message key="message.text87"/></label>
									</div>
								</div>
								<div style="text-align: center; padding-top: 10px"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6 subscriptionValue">
									<div class="slidecontainer">
										<label id="basicMonthlySaving">$3600</label><br> <label
											class="typography-medium"><fmt:message key="message.text88"/></label>
									</div>
								</div>
							</div>
							<div class="row" style="background-color: #d8dee4;">
								<div style="text-align: center; padding-top: 10px"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6 subscriptionValue">
									<div class="slidecontainer">
										<label>$1500</label><br> <label class="typography-medium"><fmt:message key="message.text89"/></label>
									</div>
								</div>
								<div style="text-align: center; padding-top: 10px"
									class="col-lg-6 col-md-6 col-sm-6 col-xs-6 subscriptionValue">
									<div class="slidecontainer">
										<label id="annualSaving">$43500</label><br> <label
											class="typography-medium"><fmt:message key="message.text90"/></label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
	</div>
	<div class="section4" style="background-color: #d8dee3 !important;">
		<footer
			style="height: 2%; text-align: right; background-color: #d8dee3 !important;">
			<p style="font-size: 90%; margin-left: 1%; float: left;">
				<i class="fa fa-lock" aria-hidden="true"></i> Rapidquote
				<fmt:message key="message.uploadFile.text17" />
			</p>
			<p style="display: inline-block;">Copyright© 2019 TechniSURE</p>&nbsp&nbsp <a href="#">
				<p class="copyright" style="display: inline-block;">
					<fmt:message key="message.other.text8" />
				</p>
			</a>&nbsp&nbsp <a href="#"><p class="copyright"
					style="display: inline-block;">
					<fmt:message key="message.other.text9" />
				</p>
				</a>&nbsp&nbsp
		</footer>
	</div>

</body>
<script>
	var coll = document.getElementsByClassName("collapsible");
	var i;

	for (i = 0; i < coll.length; i++) {
		coll[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var content = this.nextElementSibling;
			if (content.style.display === "block") {
				content.style.display = "none";
			} else {
				content.style.display = "block";
			}
		});
	}

	function costPerQuote() {

		var AvgTimeQuote = $('#avgTimePerCost').text();
		var laborRate = $('#demo').text();
		var noOfQuote = $('#noOfQuote').text();

		/* var AvgTimeQuote = 30; */
		var temp1 = AvgTimeQuote / 60;
		var costPerQuote = temp1 * laborRate;
		$("#CPQuote").html("$" + costPerQuote); //costPerQuote

		//Basic Monthly saving
		var noOfQuote;
		var BasicRapidquoteSub = 150;
		var AdvRapidquoteSub = 150;
		var temp = (costPerQuote * noOfQuote);
		var basicMonthlySaving = temp - BasicRapidquoteSub;
		$("#basicMonthlySaving").html("$" + basicMonthlySaving);

		/* var AdvMonthlySaving = temp - AdvRapidquoteSub;
		$("#AdvMonthlySaving").html("$" + AdvMonthlySaving); */

		var annualSavingTemp = costPerQuote * noOfQuote;
		var annualSavingTemp2 = annualSavingTemp * 12;
		var annualSaving = annualSavingTemp2 - 1500;

		$("#annualSaving").html("$" + annualSaving);

	}

	$(document).ready(function() {

		$('.panel-collapse').on('show.bs.collapse', function() {
			$(this).siblings('.panel-heading').addClass('active');
		});

		$('.panel-collapse').on('hide.bs.collapse', function() {
			$(this).siblings('.panel-heading').removeClass('active');
		});

		$('.border').click(function() {

			if ($(this).hasClass('borderClass')) {
				$("#blocks").find("div").removeClass("borderClass");
			} else {
				$("#blocks").find("div").removeClass("borderClass");
				$(this).addClass('borderClass');
			}
		});

	});
</script>
<script>
	var sliderP = document.getElementById("myRange");
	var output = document.getElementById("demo");
	output.innerHTML = sliderP.value;

	sliderP.oninput = function() {
		output.innerHTML = this.value;
	}

	var sliderP2 = document.getElementById("avgTime");
	var output2 = document.getElementById("avgTimePerCost");
	output2.innerHTML = sliderP2.value;

	sliderP2.oninput = function() {
		output2.innerHTML = this.value;
	}

	var sliderP1 = document.getElementById("noOfQuoteRange");
	var output1 = document.getElementById("noOfQuote");
	output1.innerHTML = sliderP1.value;

	sliderP1.oninput = function() {
		output1.innerHTML = this.value;
	}
</script>
</html>