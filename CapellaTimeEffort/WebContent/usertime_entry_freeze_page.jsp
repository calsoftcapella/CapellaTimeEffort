<%@page import="java.util.Collections"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.calsoft.task.form.TaskForm"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font: normal 14px Calibri, Calibri, Calibri;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CalsoftLabs/Timesheet/Time Entry Page</title>
<link rel="stylesheet" type="text/css" href="css/time_entry_page_style.css">
     
     
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<script type="text/javascript" src="js/time_entry_script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function onGet(url) {
		var submitForm = document.forms[0];
		submitForm.action = url;
		submitForm.submit();
	}
	function pickSelectedResourceFromDropDown() {
		var selectedUserId = document.getElementById('selectedResourceUserId').value;
		var selectOption = document.getElementById('userId');
		for ( var i = 0; i < selectOption.length; i++) {
			if (selectOption.options[i].value == selectedUserId) {
				selectOption.options[i].selected = "true";
			}
		}
	}
	
	//configure interval btw flash (1000=1 second)
		var speed=500;
		function flashit(){
			var crosstable=document.getElementById? document.getElementById("myMissingDates") : document.all? document.all.myMissingDates : "";
			if (crosstable){
				if (crosstable.style.borderColor.indexOf("green")!=-1)
				  crosstable.style.borderColor="red";
			    else
				  crosstable.style.borderColor="green";
			}
	    }
	   setInterval("flashit()", speed);
</script>
<script type="text/javascript">
 function displayMessageBox(){
	 $('#ajax_res').show();
	 var month = $('#selectedMonthId option:selected').text().trim();
	 $('#ajax_res').html("<div style=\"color: red;text-align: center;font-family: verdana, arial, sans-serif;font-size: 11px;font-weight:bolder;\">"
				+"Check with Hem/Raghavi to make any modification for "+month+" entry.</div>"); 
	 $('#ajax_res').delay(2000).fadeOut();
 }
 function scriptForUnfreezingTimesheet(){
	 var task_month = $("#selectedMonthId").val();
	 var resource_id = $("#userId").val();
	 if((task_month != '' && task_month != null) && (resource_id != '' && resource_id != null)){
		 var formSubmit = document.forms[0];
		 formSubmit.action = "taskAction1.do?method=unfreezeTimesheet&task_month="+task_month+"&resource_id="+resource_id;
		 formSubmit.submit();
	 }
 }
</script>
</head>
<body style="margin: 17%; margin-top: 0%; outline-color: blue;">
	<div style="margin-left: 40px;">
		<logic:present name="selectResourceBasedOnUserId" scope="request">
			<input type="hidden" id="selectedResourceUserId"
				value="<bean:write name="selectResourceBasedOnUserId" scope="request"/>"
				style="width: 0px; height: 0px;">
		</logic:present>
		<html:form action="taskAction1" method="POST">
			<!-- Below script for adding Select Month -->
			<%
					Calendar cal = Calendar.getInstance();
					List<String> list = new ArrayList<String>();
					List<String> list1 = new ArrayList<String>();
					DateFormat df = new SimpleDateFormat("MMM-yyyy");
					DateFormat df1 = new SimpleDateFormat("yyyy-MM");
					list.add(df.format(cal.getTime()));
					list1.add(df1.format(cal.getTime()));
					for (int i = 1; i <= 11; ++i) {
						cal.add(Calendar.MONTH, i);
						list.add(df.format(cal.getTime()));
						list1.add(df1.format(cal.getTime()));
						cal.add(Calendar.MONTH, -i);
					}
			%>
			<logic:notPresent name="month" scope="request">
				<table class="sortable1" width="800px;">
					<tr>
						<td style="width: 180px;vertical-align: top;">Select Month:<html:select property="month" styleId="selectedMonthId"
								onchange="onGet('taskAction1.do?method=getDetails')"
								style="font-family: verdana, arial, sans-serif;font-size: 11px;">
								<%
											Iterator<String> itrat1 = list.iterator(); // List containing date format like Jan-2013
											Iterator<String> itrat2 = list1.iterator(); //  List containing date fomate like 2013-01
											while (itrat1.hasNext() && itrat2.hasNext()) {
												String firstDate = itrat1.next();
												String secondDate = itrat2.next();
							%>
								<option value="<%=secondDate%>">
									<%=firstDate%>
								</option>
								<%
								}
							%>
							</html:select></td>
							
							<!-- Resource based Timesheet deatils for Raghavi.  -->
							<logic:present name="userListSelection" scope="request">
							<td style="padding-left: 20px;width: 295px;vertical-align: top;position: absolute;">Select Resource:<html:select property="userId" styleId="userId" onchange="onGet('taskAction1.do?method=getDetailsBasedOnResourceName')" style="width: 180px;font-family: verdana, arial, sans-serif;font-size: 11px;">	
							      <logic:notEmpty name="userListSelection" scope="request">						      
							         <logic:iterate name="userListSelection" id="listForUser" scope="request">						
										<option value="<bean:write name="listForUser" property="userId" />">
											<bean:write name="listForUser" property="userName" />
										</option>
						            </logic:iterate>
						          </logic:notEmpty>							      							      
							</html:select>	
							<script type="text/javascript">
							      pickSelectedResourceFromDropDown();
							</script>				
							</td>						
							<td style="width: 280px;vertical-align: top;">						    						    
						    			<!-- Updates for Missing Entry Table  -->		
						      <logic:present name="allmissingDateList" scope="request">
						       <logic:notEmpty name="allmissingDateList" scope="request">
							    <div style="text-align: right;padding-left: 10px;">
								  <table border="0" width="280" id="myMissingDates" 
				       				style="border:2px dotted green;border-top-left-radius: 0.5em;border-bottom-right-radius: 0.5em;font-family: verdana, arial, sans-serif;font-size: 11px;color: #333333;">
   									<thead>
   										<tr>
   											<th style="text-align: left;background-color: #A5A1A0;">Missing/Shortfall Entries
   											</th>
   										</tr> 
   									</thead>
   									<tbody> 
										<tr>
   											<td style="text-align: left;" id="missingDateTdId">
   												<logic:iterate id="missingDateId" name="allmissingDateList" scope="request" indexId="dConter">
   						    						<a href="##." id="<%=dConter++ %>" style="font-weight: bold;cursor: pointer;" onclick="displayMessageBox()"><bean:write name="missingDateId"/></a>
   						 						</logic:iterate> 	
   						 							<a href="##." style="cursor: pointer;" onclick="displayMessageBox()"><br><br>Fill All</a>					     							
											</td>
										</tr>
									</tbody>
							    </table>
		   				      </div>	
		    		          </logic:notEmpty>
		    		         </logic:present>	    							
										<!-- Updates for Missing Entry Table  -->											    
						    </td>						  														
							</logic:present> 
							 <!-- Resource based Timesheet deatils for Raghavi.  --> 
						   <logic:notPresent name="userListSelection" scope="request">						    						    
						    <!-- Updates for Missing Entry Table  -->		
						      <logic:present name="allmissingDateList" scope="request">
						       <logic:notEmpty name="allmissingDateList" scope="request">
						       <td style="padding-left: 320px;width: 280px;">
							   <div style="text-align: right;padding-left: 10px;">
								  <table border="0" width="280" id="myMissingDates" 
				       				style="border:2px dotted green;border-top-left-radius: 0.5em;border-bottom-right-radius: 0.5em;font-family: verdana, arial, sans-serif;font-size: 11px;color: #333333;">
   									<thead>
   										<tr>
   											<th style="text-align: left;background-color: #A5A1A0;">Missing/Shortfall Entries
   											</th>
   										</tr> 
   									</thead>
   									<tbody> 
										<tr>
   											<td style="text-align: left;" id="missingDateTdId">
   												<logic:iterate id="missingDateId" name="allmissingDateList" scope="request" indexId="dConter">
   						    						<a href="##." id="<%=dConter++ %>" style="font-weight: bold;cursor: pointer;" onclick="displayMessageBox()"><bean:write name="missingDateId"/></a>
   						 						</logic:iterate> 	
   						 							<a href="##." style="cursor: pointer;" onclick="displayMessageBox()"><br><br>Fill All</a>					     							
											</td>
										</tr>
									</tbody>
							    </table>
		   				      </div>	
		   				       </td>	
		    		          </logic:notEmpty>
		    		         </logic:present>	    							
										<!-- Updates for Missing Entry Table  -->											    
						 </logic:notPresent>					  
					</tr>
				</table>
			</logic:notPresent>
			<logic:present name="month" scope="request">
				<table class="sortable1" width="800px;">
					<tr>
						<td style="width: 180px;vertical-align: top;">Select Month:<html:select property="month" styleId="selectedMonthId"
								onchange="onGet('taskAction1.do?method=getDetails')"
								style='font-family: verdana, arial, sans-serif;font-size: 11px;'>
								<%											
											String s1 = (String) request.getAttribute("month");
											DateFormat dform1 = new SimpleDateFormat("yyyy-MM");
											DateFormat dform2 = new SimpleDateFormat("MMM-yyyy");
											Date dateOption = dform1.parse(s1);
											String dtOption = dform2.format(dateOption);
											list1.remove(s1); //  List containing date fomate like 2013-01
											list.remove(dtOption); //  List containing date fomate like Jan-2013
											list1.add(0, s1);
											list.add(0, dtOption);
											Iterator<String> itrat11 = list.iterator(); // List containing date format like Jan-2013
											Iterator<String> itrat22 = list1.iterator(); //  List containing date fomate like 2013-01
											while (itrat11.hasNext() && itrat22.hasNext()) {
												String optionDate = itrat11.next();
												String optionValue = itrat22.next();
							%>
								<option value="<%=optionValue%>"><%=optionDate%>
								</option>
								<%
								}
							%>
							</html:select></td>							
							<!-- Resource based Timesheet deatils for Raghavi.  -->
							<logic:present name="userListSelection" scope="request">
							<td style="padding-left: 20px;width: 295px;vertical-align: top;position: absolute;">Select Resource:<html:select property="userId" styleId="userId" onchange="onGet('taskAction1.do?method=getDetailsBasedOnResourceName')" style="width: 180px;font-family: verdana, arial, sans-serif;font-size: 11px;">	
							      <logic:notEmpty name="userListSelection" scope="request">						      
							         <logic:iterate name="userListSelection" id="listForUser" scope="request">						
										<option value="<bean:write name="listForUser" property="userId" />">
											<bean:write name="listForUser" property="userName" />
										</option>
						            </logic:iterate>
						          </logic:notEmpty>							      							      
							</html:select>
							<script type="text/javascript">
							      pickSelectedResourceFromDropDown();
							</script>								
							</td>																		    						    
						    			<!-- Updates for Missing Entry Table  -->		
						      <logic:present name="allmissingDateList" scope="request">
						       <logic:notEmpty name="allmissingDateList" scope="request">
						       <td style="width: 280px;vertical-align: top;">	
							    <div style="text-align: right;padding-left: 10px;">
								  <table border="0" width="280" id="myMissingDates" 
				       				style="border:2px dotted green;border-top-left-radius: 0.5em;border-bottom-right-radius: 0.5em;font-family: verdana, arial, sans-serif;font-size: 11px;color: #333333;">
   									<thead>
   										<tr>
   											<th style="text-align: left;background-color: #A5A1A0;">Missing/Shortfall Entries
   											</th>
   										</tr> 
   									</thead>
   									<tbody> 
										<tr>
   											<td style="text-align: left;" id="missingDateTdId">
   												<logic:iterate id="missingDateId" name="allmissingDateList" scope="request" indexId="dConter">
   						    						<a href="##." id="<%=dConter++ %>" style="font-weight: bold;cursor: pointer;" onclick="displayMessageBox()"><bean:write name="missingDateId"/></a>
   						 						</logic:iterate> 	
   						 							<a href="##." style="cursor: pointer;" onclick="displayMessageBox()"><br><br>Fill All</a>					     							
											</td>
										</tr>
									</tbody>
							    </table>
		   				      </div>	
		   				      </td>	
		    		          </logic:notEmpty>
		    		         </logic:present>	    							
										<!-- Updates for Missing Entry Table  -->											    
						
							</logic:present>  
						    <!-- Resource based Timesheet deatils for Raghavi.  -->
						    <logic:notPresent name="userListSelection" scope="request">
						    		<!-- Updates for Missing Entry Table  -->		
						      <logic:present name="allmissingDateList" scope="request">
						       <logic:notEmpty name="allmissingDateList" scope="request">
						       <td style="padding-left: 320px;width: 280px;">
							    <div style="text-align: right;padding-left: 10px;">
								  <table border="0" width="280" id="myMissingDates" 
				       				style="border:2px dotted green;border-top-left-radius: 0.5em;border-bottom-right-radius: 0.5em;font-family: verdana, arial, sans-serif;font-size: 11px;color: #333333;">
   									<thead>
   										<tr>
   											<th style="text-align: left;background-color: #A5A1A0;">Missing/Shortfall Entries
   											</th>
   										</tr> 
   									</thead>
   									<tbody> 
										<tr>
   											<td style="text-align: left;" id="missingDateTdId">
   												<logic:iterate id="missingDateId" name="allmissingDateList" scope="request" indexId="dConter">
   						    						<a href="##." id="<%=dConter++ %>" style="font-weight: bold;cursor: pointer;" onclick="displayMessageBox()"><bean:write name="missingDateId"/></a>
   						 						</logic:iterate> 	
   						 							<a href="##." style="cursor: pointer;" onclick="displayMessageBox()"><br><br>Fill All</a>					     							
											</td>
										</tr>
									</tbody>
							    </table>
		   				      </div>
		   				      </td>	
		    		          </logic:notEmpty>
		    		         </logic:present>	 
		    		         </logic:notPresent>   							
										<!-- Updates for Missing Entry Table  -->									
					</tr>
				</table>
			</logic:present>
			<div id="ajax_res"></div>
			<logic:present name="resourceLocation" scope="request">
				<input type="hidden" id="resourceLocationId"
					value="<bean:write name="resourceLocation"/>"
					style="width: 0px; height: 0px;">
			</logic:present>
			<table style="padding-top: 10px;">
				<tr>
					<td>
						<input type="button" id="new_entry_buttonId" value="New Entry" title="Add time entry." disabled="disabled" 
						style="font-family: verdana, arial, sans-serif; font-size: 11px; text-align: left; cursor: not-allowed;" />
					</td>
					<td><input type="button" id="save_id_buttonId" value="Save All" title="Click to save all new entries." disabled="disabled"
						style="font-family: verdana, arial, sans-serif; font-size: 11px; text-align: left; cursor: not-allowed;" />
					</td>
					<logic:present name="userListSelection" scope="request">
						<td style="text-align: left;"><input type="button"
							id="freeze_entry_id" value="Unfreeze Entry" onclick="scriptForUnfreezingTimesheet();" class="changeButtonUI"
							title="Click to unfreeze timesheet entry for current and all next months."
							style="font-family: verdana, arial, sans-serif; font-size: 11px; text-align: left; cursor: pointer;" />
						</td>
					</logic:present>
				</tr>
			</table>
			<logic:present name="tList" scope="request">
				<logic:empty name="tList" scope="request">
					<div id="tListEmptyId" style="color: red; text-align: center; text-shadow: green; font-family: verdana, arial, sans-serif; font-size: 11px;">
						*No records found for this month.</div>
				</logic:empty>
				<logic:notEmpty name="tList" scope="request">
					<div id="myDiv"
						style="width: 800px; height: 800px; overflow: scroll; overflow: auto;">
						<table id="dailyEntryTable" class="sortable" border="3"
							width="781px">
							<tr class="head">
								<th>Date</th>
								<th>Category</th>
								<th style="width: 5pc">CRM ID</th>
								<th style="width: 0pc">V1 story id</th>
								<th style="width: 13pc">Description</th>
								<th>Efforts From</th>
								<th style="width: 7pc">Time in Hrs</th>
								<th>Edit<br>/Save</th>
								<th>Delete</th>
							</tr>
							<logic:iterate id="tList" name="tList" scope="request"
								type="com.calsoft.task.form.TaskForm" indexId="counterForEdit">
								<tr id="<bean:write name="tList" property="id" />">
									<logic:equal name="tList" property="status" value="Comp off">
										<td style="color: #008000;"><bean:write name="tList"
												property="task_date" /></td>
										<td style="color: #008000;"><bean:write name="tList"
												property="status" /></td>
										<td style="color: #008000;"><bean:write name="tList"
												property="backlog_id" /></td>
										<td style="color: #008000;"><bean:write name="tList"
												property="task_id" /></td>
										<td style="color: #008000;"><bean:write name="tList"
												property="task_description" /></td>
										<td style="color: #008000;"><logic:equal name="tList"
												property="work_status" value="home">Home</logic:equal> <logic:notEqual
												name="tList" property="work_status" value="home">
												<logic:equal name="tList" property="work_status"
													value="office">Office</logic:equal>
												<logic:notEqual name="tList" property="work_status"
													value="office"></logic:notEqual>
											</logic:notEqual></td>
										<td style="color: #008000;"><bean:write name="tList"
												property="time" /></td>
									</logic:equal>
									<logic:notEqual name="tList" property="status" value="Comp off">
										<td><bean:write name="tList" property="task_date" /></td>
										<td><bean:write name="tList" property="status" /></td>
										<td><bean:write name="tList" property="backlog_id" /></td>
										<td style="width: 3pc"><bean:write name="tList"
												property="task_id" /></td>
										<td style="width: 13pc"><bean:write name="tList"
												property="task_description" /></td>
										<td><logic:equal name="tList" property="work_status"
												value="home">Home</logic:equal> <logic:notEqual name="tList"
												property="work_status" value="home">
												<logic:equal name="tList" property="work_status"
													value="office">Office</logic:equal>
												<logic:notEqual name="tList" property="work_status"
													value="office"></logic:notEqual>
											</logic:notEqual></td>
										<logic:equal name="tList" property="status" value="Half Day">
											<td style="width: 7pc; color: #FF0000;"><bean:write
													name="tList" property="time" /></td>
										</logic:equal>
										<logic:notEqual name="tList" property="status"
											value="Half Day">
											<logic:equal name="tList" property="status" value="Leave">
												<td style="width: 7pc; color: #FF0000;"><bean:write
														name="tList" property="time" /></td>
											</logic:equal>
											<logic:notEqual name="tList" property="status" value="Leave">
												<logic:equal name="tList" property="status"
													value="Public holiday">
													<td style="width: 7pc; color: #0000CD;"><bean:write
															name="tList" property="time" /></td>
												</logic:equal>
												<logic:notEqual name="tList" property="status"
													value="Public holiday">
													<td><bean:write name="tList" property="time" /></td>
												</logic:notEqual>
											</logic:notEqual>
										</logic:notEqual>
									</logic:notEqual>
									<td><img src="img/edit.png" id="edit<%=counterForEdit++ %>" style="cursor: pointer;" title="Click to edit entry." onclick="displayMessageBox();"/></td>
									<td><img src="img/delete1.png" style="cursor: pointer;"
										title="Click to delete entry." onclick="displayMessageBox()"/></td>
								</tr>
							</logic:iterate>
						</table>
					</div>
				</logic:notEmpty>
			</logic:present>
		</html:form>
	</div>
</body>
  <script type="text/javascript">
		hideEnteredMissingdate();
 </script>
</html>