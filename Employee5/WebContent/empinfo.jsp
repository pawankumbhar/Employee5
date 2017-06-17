<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Info</title>
</head>
<body>
<% if(session.getAttribute("lOGIN")!=null){%>
		Logged in User : <%=session.getAttribute("lOGIN")%> |<a href="invalidate">Logout</a>
<%}else{
	//	response.sendRedirect("log.jsp");
}%>




<form action="Insert_emp">
<h1 align="center">Add Record</h1>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;" align="center">
<tr>
<td align="center">Id</td><td><input type="text" name="id"></td>
</tr>
<tr>
<td align="center">Name</td><td><input type="text" name="name"></td>
</tr>
<tr>
<td align="center">Designation</td><td><input type="text" name="Designation"></td>
</tr>
<tr>
<td align="center">Mob_no</td><td><input type="text" name="Mob_no"></td>
</tr>
<tr>
<td><input type="submit" name="s" value="Add" onclick="Getdata()">
<input type="submit" name="s" value="View"></td>

</tr>


</table>
<h1 align="center">Serch Record</h1>
<TABLE cellpadding="12" border="1" style="background-color: #ffffcc;"align="center">
<tr>
<td>Id<input type="text" name="id3">
</td>
</tr>
<tr>
<td ><input type="submit" name="s" value="Serch"></td>
</tr>

</table>
</form>
</body>
</html>