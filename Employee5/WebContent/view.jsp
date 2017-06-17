<%@page import="emp.connector"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<a href="log.jsp">Back</a>
<a href="log.jsp">Log Out<align="right"></a>

<body bgcolor="#E6E6FA">
<body>
<% if(session.getAttribute("lOGIN")!=null){%>
	//	Logged in User : <%=session.getAttribute("lOGIN")%> | <a href="invalidate">Logout</a> |<a href="empinfo.jsp">back</a>
<%}else{
	//	response.sendRedirect("log.jsp");
}%>
<%
Connection conn=null;
ResultSet rs=null;
PreparedStatement ps=null;
connector con=new connector();
try
{
  /*	 String driver="com.mysql.jdbc.Driver";
		 String url="jdbc:mysql://localhost/emp_recd";
		 String user="root";
		 String password="redhat"; */
	
//	conn=DriverManager.getConnection(url,user,password);
	conn=con.getCon();
	System.out.println(conn);
	ps=conn.prepareStatement("select * from employee2");
	rs = ps.executeQuery();
%>
<form action="Insert_emp">
<h1> Emp_Details List</h1>
<TABLE cellpadding="12" border="1" style="background-color: #ccffff;">
<%
  String id=request.getParameter("id");
      System.out.println(id);
%>
<tr>
<td>ID</td>
<td>Name</td>
<td>Designation</td>
<td>Mob_no</td>
<td>Delete_Record</td>
<td>Update_Record</td>
</tr>


<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>


<% id= rs.getString(1);
   System.out.println(id);%>
   
   

<td><a href="Delete?id=<%=id%>">Delete</a></td>
<td><a href="Update.jsp?id=<%=id%>">Edit</a></td>

</tr>

<%} %>
</TABLE>







<%
//	out.println("database is not found");
}finally{
	con.closeRS(rs);
	con.closePstmt(ps);
	con.closeConnection(conn);
	
}
%>

<h1 align="right">Add Record</h1>
<TABLE cellpadding="15" border="1" style="background-color: #ccffff;" align="right">
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
<td><input type="submit" name="s" value="Add" onclick="view.jsp">
<input type="reset" name="s" value="RESET"></td>

</tr>


</table>
<h1 align="left">Search Record</h1>
<TABLE cellpadding="12" border="1" style="background-color: #ccffff;"align="left">
<tr>
<td>Id</td><td><input type="text" name="id3"></td>
</td>
</tr>
<tr>
<td ><input type="submit" name="s" value="Serch" ></td>

</tr>

</table>



</table>

</form>
</body>
</html>