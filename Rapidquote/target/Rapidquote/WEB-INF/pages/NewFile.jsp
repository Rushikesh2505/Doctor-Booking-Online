<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="filePanelList col-sm-12 col-md-12 col-xs-12"
		mainfile="'+ fileName+ '" id="filePanelList'+ newname+ '">

		<div class="row">
			<div class="col-md-4 col-xs-4 col-sm-4 col-4  processIcon'+newname+'"
				style="display: block; padding-top: 10px; padding-left: 25px; padding-right: 0px">
				<i id="processIcon" class="fa fa-cog fa-spin"
					style="font-size: 24px;"></i>
			</div>
			<div
				class="col-md-4 col-xs-4 col-sm-4 col-4  selectionIcon'+newname+'"
				style="display: none; padding-top: 10px; padding-right: 1px; padding-bottom: 10px; padding-left: 20px;">
				'+ '<input class="delete_check" type="checkbox" name="delete_check"
					id="delete_check'+ newname+ '" style="margin: 3%;"
					listid="filePanelList'+ newname+ '"
					onchange="checkboxAddFiles(this.id)"> <i
					class="fa fa-trash pointer" objectid="filePanelList'+ newname+ '"
					style="font-size: 20px; color: red; margin: 4%;"
					data-toggle="modal" data-target="#delete-modal-3"
					data-whatever="filePanelList'+ newname+ '" aria-hidden="true"
					id="singledel'+ newname+ '"'+ '></i>
			</div>
			<div class="col-md-8 col-xs-8 col-sm-8 col-8  listFileName"
				id="'+ newname + '" onclick="getHtml(this.id)"
				filename="'+ fileName+ '"
				" style="padding-top: 3%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
				<label style="width: 60%;" class="pointer" data-toggle="tooltip"
					title="'+ fileName + '"> <b style="width: 100px;">' +
						fileName + '</b>
				</label>
			</div>
		</div>
	</div>
	';
</body>
</html>