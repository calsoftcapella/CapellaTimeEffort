function submitForm(url){
	var userId = $("#user_id option:selected").val();
	if(userId != ''){
		var formSubmit=document.forms[0];
		formSubmit.action = url+"&selectedUserId="+userId;
		formSubmit.submit();	
	}
}
function submitReport(url){
	var formSubmit=document.forms[0];
	formSubmit.action=url;
	formSubmit.submit();	
}
$(document).ready(function(){
	if(typeof $("#hidden_userId").val() != "undefined") {
		var selectedUserId = $("#hidden_userId").val();
	    var selectOption = document.getElementById("user_id");
	    for (var i=0; i<selectOption.length; i++){
	      if(selectOption.options[i].value == selectedUserId){
	 	    selectOption.options[i].selected="true";
	      }
	    }
	}
	if(typeof $("#hidden_role_id").val() != "undefined") {
		var selectedUserRoleId = $("#hidden_role_id").val();
	    var selectOptionRole = document.getElementById("role_id");
	    for (var i=0; i<selectOptionRole.length; i++){
	      if(selectOptionRole.options[i].value == selectedUserRoleId){
	    	  selectOptionRole.options[i].selected="true";
	      }
	    }
	}
	if(typeof $("#hidden_project_id").val() != "undefined") {
		var selectedUserRoleId = $("#hidden_project_id").val();
		var selectOptionRole = document.getElementById("project_id_field");
		for (var i=0; i<selectOptionRole.length; i++){
			if(selectOptionRole.options[i].value == selectedUserRoleId){
				selectOptionRole.options[i].selected="true";
			}
		}
	}
	if(typeof $('#updateMessageId').delay() != "undefined"){
		$('#updateMessageId').delay(2000).fadeOut();
	}	
});
function doFieldValidationAndSubmit(url){
	$("#username_error").text("");
	$("#apolloid_error").text("");
	$("#password_error").text("");
	$("#status_error").text("");
	$("#role_error").text("");
	$("#defpass_error").text("");
	$("#contact1_error").text("");
	$("#project_error").text("");
	$("#skypeId_error").text("");
	$("#location_error").text("");
	var username = $("#userNameId").val();
	var apolloMail = $("#apolloId").val();
	var nameRegex = /^[A-z]([A-Za-z0-9_. ]){2,40}$/;
	var password = $("#passWordId").val();
	var status =$("#status_id option:selected").val();
	var role_id =$("#role_id option:selected").val();
	var defpassword = $("#defpassId").val();
	var project_id_val = $("#project_id_field").val();
	var contact1 = $("#contactId1").val();
	var skypeId = $("#skype_id").val();
	var location_id = $("#location_id").val();
	var reg = /^[A-z]([A-Za-z0-9_\-\.])+\@[Capella\phoenix]+\.(edu)$/;
	var reg_contact = /^[0-9-\+\ ]{10,14}$/;
	if(!nameRegex.test(username)){
		$("#userNameId").focus();
		$("#username_error").html("Invalid Username.");
	} 
	else if(apolloMail =="") {
		$("#apolloId").focus();
		$("#apolloid_error").html("Capella id is mandatory")
	}
	else if(apolloMail !="" && !reg.test(apolloMail)){
		$("#apolloId").focus();
		$("#apolloid_error").html("Invalid Capella mail id.");
	}
	else if(!(password.length >4 && password.length < 13)){
		$("#passWordId").focus();
		$("#password_error").html("Password should 5 to 12 characters long.");
	}	
	else if(status == ""){
		$("#status_id").focus();
		$("#status_error").html("Select status.");
	}	
	else if(role_id == ""){
		$("#role_id").focus();
		$("#role_error").html("Pick one Role.");
	}	
	else if(!(defpassword.length >4 && defpassword.length < 13)){
		$("#defpassId").focus();
		$("#defpass_error").html("Password should 5 to 12 characters long.");
	}
	else if(project_id_val == '0' || project_id_val == ''){
		$("#project_id_field").focus();
		$("#project_error").html("Please add project information.");
	}
	else if(contact1 == ""){
		$("#contactId1").focus();
		$("#contact1_error").html("Primay mobile number is mandatory");
	}
	else if(skypeId == "") {
		$("#skype_id").focus();
		$("#skypeId_error").html("Skype id is mandatory");
	}
	else if(location_id == "") {
		$("#location_id").focus();
		$("#location_error").html("Location is mandatory");
	}
	else if(contact1 != ""){
		if(!reg_contact.test(contact1)){
			$("#contactId1").focus();
			$("#contact1_error").html("Please enter valid mobile no.");
		}
		else {
			var formSubmit = document.forms[0];
			formSubmit.action = url;
			formSubmit.submit();
		}
	}
	else {
		var formSubmit = document.forms[0];
		formSubmit.action = url;
		formSubmit.submit();
	}
}