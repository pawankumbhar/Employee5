<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="emp.connector"%>
<html>
<head>

<a href="view.jsp">Back</a>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Record</title>
</head>
<body bgcolor="#E6E6FA">
<body>
<form action="update">

<%
connector con=new connector();


ResultSet rs=null;
Statement st=null;

%>
<% 
int id=Integer.parseInt(request.getParameter("id"));
System.out.println("ID req get:::::::"+id);
%>
<%
Connection conn=con.getCon();
try
{
	
	System.out.println("Connection Object:::::::"+conn);
	st=conn.createStatement();
	rs=st.executeQuery("select id,name,designation,mob_no from employee2 where id="+id);
	
%>
<h1 ALIGN="CENTER">Update Record</h1>
<TABLE cellpadding="15" border="1" style="background-color: #ccffff;" align="center">
<%
while(rs.next()){
	%>
	<tr>
	<td></td><td><input type="hidden" name="id1" value="<%=id %>"></td>
	</tr>
<tr>
<td>id</td><td><input type="text" name="id" value="<%=rs.getInt(1)%>"></td>
</tr>
<tr>
<td>name</t><td><input type="text" name="name" value="<%=rs.getString(2)%>"></td>
</tr>
<tr>
<td>designation</td><td><input type="text" name="designation" value="<%=rs.getString(3)%>"></td>
</tr>
<tr>
<td>mob_no</td><td><input type="text" name="mob_no" value="<%=rs.getString(4)%>"></td>
</tr>

<tr>
<td><input type="submit" value="Edit"></td>

<% id= rs.getInt(1);%>
<% }
}
catch(Exception e){
	e.printStackTrace();
}finally{
	con.closeRS(rs);
	con.closestmt(st);
	con.closeConnection(conn);
}
%>
</tr>
</table>
</form>
</body>
</html>