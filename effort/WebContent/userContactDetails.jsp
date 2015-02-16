<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.calsoft.user.model.*"%>

<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table id="dailyEntryTable" class="sortable" border="3" width="781px">
	<tr class="head" style="height: 36px; ">
		<th style="width: auto;">Name S</th>
		<th style="width: auto;">Email</th>
		<th style="width: auto;">Capella Email</th>
		<th style="width: auto;">Mobile Number</th>
		<th style="width: auto;">Skype</th>
		<th style="width: auto;">Location</th>
	</tr>
	<logic:present name="chennaiContacts" scope="request">
		<logic:notEmpty name="chennaiContacts" scope="request">
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td><b>Chennai</b></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<div id="myDiv"
				style="width: auto; height: auto; overflow: scroll; overflow: auto;">
			<logic:iterate id="chennai" name="chennaiContacts" scope="request"
				indexId="dConter">
				<tr>
					<td><bean:write name="chennai" property="userName" /></td>
					<td><bean:write name="chennai" property="email" /></td>
					<td><bean:write name="chennai" property="capellaEmail" /></td>
					<td><bean:write name="chennai" property="mobile" /></td>
					<td><bean:write name="chennai" property="skype" /></td>
					<td><bean:write name="chennai" property="location" /></td>
				</tr>
			</logic:iterate>
			</tr>
		</logic:notEmpty>
	</logic:present>
	<logic:present name="bangaloreContacts" scope="request">
		<logic:notEmpty name="bangaloreContacts" scope="request">
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td><b>Bangalore</b></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>

			<div id="myDiv"
				style="width: auto; height: auto; overflow: scroll; overflow: auto;">
			<logic:iterate id="bangalore" name="bangaloreContacts"
				scope="request" indexId="dConter">
				<tr>
					<td><bean:write name="bangalore" property="userName" /></td>
					<td><bean:write name="bangalore" property="email" /></td>
					<td><bean:write name="bangalore" property="capellaEmail" /></td>
					<td><bean:write name="bangalore" property="mobile" /></td>
					<td><bean:write name="bangalore" property="skype" /></td>
					<td><bean:write name="bangalore" property="location" /></td>
				</tr>
			</logic:iterate>
			</tr>
		</logic:notEmpty>
	</logic:present>
	<logic:present name="others" scope="request">
		<logic:notEmpty name="others" scope="request">
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td><b>Others</b></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>

			<div id="myDiv"
				style="width: auto; height: auto; overflow: scroll; overflow: auto;">
			<logic:iterate id="other" name="others" scope="request"
				indexId="dConter">
				<tr>
					<td><bean:write name="other" property="userName" /></td>
					<td><bean:write name="other" property="email" /></td>
					<td><bean:write name="other" property="capellaEmail" /></td>
					<td><bean:write name="other" property="mobile" /></td>
					<td><bean:write name="other" property="skype" /></td>
					<td><bean:write name="other" property="location" /></td>
				</tr>
			</logic:iterate>
			</tr>
		</logic:notEmpty>
	</logic:present>

</table>


</body>
</html>