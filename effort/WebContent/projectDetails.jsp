<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
@import "flora.datepick.css";
</style>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
<script type="text/javascript">
	$( function() {
		$('#popupStartDatepicker').datepick();
		$('#popupEndDatepicker').datepick();
	});

	function addRow(tableName) {
		console.log("Jai", tableName);

		var button = document.getElementById('new_entry_buttonId');
		var taskEntry = document.getElementById('taskEntryTable');

		if (button.value == "New Entry") {
			taskEntry.style.display = "block";
			button.value = "Hide";
		} else if (button.value == "Hide") {
			taskEntry.style.display = "none";
			button.value = "New Entry";
		}

	}

	function clearItems() {
		debugger;
		$('#crmID').val("");
		$('#v1StoryId').val("");
		$('#taskDesc').val("");
		$('#popupStartDatepicker').val("");
		$('#popupEndDatepicker').val("");
		$('#complexity').val("");
		$('#priority').val("");
	}

	function saveTask() {
		var crmValue = $('#crmID').val();
		var v1StoryValue = $('#v1StoryId').val();
		var taskDescValue = $('#taskDesc').val();
		var popupStartDatepickerVal = $('#popupStartDatepicker').val();
		var popupEndDatepickerVal = $('#popupEndDatepicker').val();
		var complexityVal = $('#complexity').val();
		var priorityVal = $('#priority').val();
		
		var data = new Array();
		data.push({ "crmID": crmValue, "v1StoryId": v1StoryValue, "taskDesc": taskDescValue,
			"popupStartDatepicker":popupStartDatepickerVal,"popupEndDatepicker" : popupEndDatepickerVal,
			"complexity":complexityVal, "priority":priorityVal});	
		console.log(data);
	}
</script>
</head>
<body>
<table style="padding-top: 10px;">
	<tr>
		<td style='font-family: verdana, arial, sans-serif; font-size: 11px;'>
		<input type="button" onclick="addRow('taskEntryTable')"
			class="changeButtonUI" id="new_entry_buttonId" value="New Entry"
			title="Add new task details"
			style="font-family: verdana, arial, sans-serif; font-size: 11px; text-align: left; cursor: pointer;" />
		</td>
	</tr>
</table>

<div id="taskEntryTable" style="display: none;">
<table border="1">
	<tr>
		<td>CRM ID :</td>
		<td><input type="text" name="crmID" id="crmID"></td>
	</tr>
	<tr>
		<td>V1 Story ID :</td>
		<td><input type="text" name="v1StoryId" id="v1StoryId"></td>
	</tr>
	<tr>
		<td>Task Description :</td>
		<td><textarea rows="2" cols="2" name="taskDesc" id="taskDesc"
			STYLE="width: 145px; height: 100px; border: 1 solid; margin: 0; font-family: verdana, arial, sans-serif; font-size: 11px;" ></textarea></td>
	</tr>
	<tr>
		<td>Start Date :</td>
		<td>
			<input type="text" name="startDate" id="popupStartDatepicker"
			readonly="true" SIZE="5" MAXLENGTH="10" STYLE="height:4;width: 65px;border: 1 solid;margin:0;font-family: verdana, arial, sans-serif;font-size: 11px;" /></td>
	</tr>

	<tr>
		<td>End Date : </td>
		<td>
			<input type="text" name="endDate" id="popupEndDatepicker"
			readonly="true" SIZE="5" MAXLENGTH="10" STYLE="height:4;width: 65px;border: 1 solid;margin:0;font-family: verdana, arial, sans-serif;font-size: 11px;" /></td>
	</tr>
	<tr>
		<td>Complexity</td>
		<td>
			<select name="complexity" id="complexity" >
				<option value="0">--Select--</option>
				<option value="1">Very High</option>
				<option value="2">High</option>
				<option value="3">Medium</option>
				<option value="4">Low</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Priority</td>
		<td>
			<select name="priority" id="priority" >
				<option value="0">--Select--</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" id="save" value="Save" onclick="saveTask();"/>
		</td>
		<td>
			<input type="button" id="clear" value="Clear" onclick="clearItems();"/>
		</td>
	</tr>

</table>
</div>

</br>
<table id="dsf" class="sortable" border="3" width="auto"
	style="display: none;">
	<tr class="head" style="height: 36px;">
		<th style="width: auto;">CRM ID</th>
		<th style="width: auto;">V1 Story ID</th>
		<th style="width: auto;">Complexity</th>
		<th style="width: auto;">Priority</th>
		<th style="width: auto;">Task Details</th>
		<th style="width: auto;">Planned Start Date</th>
		<th style="width: auto;">Planned End Date</th>
		<th style="width: auto;">Planned No. Of Days</th>
	</tr>
</table>
</br>
<table id="taskDisplayTable" class="sortable" border="3" width="781px">
	<tr class="head" style="height: 36px;">
		<th style="width: auto;">CRM ID</th>
		<th style="width: auto;">V1 Story ID</th>
		<th style="width: auto;">Complexity</th>
		<th style="width: auto;">Priority</th>
		<th style="width: auto;">Task Details</th>
		<th style="width: auto;">Planned Start Date</th>
		<th style="width: auto;">Planned End Date</th>
		<th style="width: auto;">Planned No. Of Days</th>
	</tr>
	<tr>
		<td>1010</td>
		<td>2020</td>
		<td>Very High</td>
		<td>3</td>
		<td>Task....</td>
		<td>11/02/2015</td>
		<td>20/02/2015</td>
		<td>4</td>
	</tr>
	<tr style="display: none;">
		<td colspan="8" align="center">There is no new task</td>
	</tr>
</table>
</body>
</html>