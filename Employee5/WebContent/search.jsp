<%@page import="emp.connector"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<a href="view.jsp">Back</a>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body bgcolor="#E6E6FA">
<body>
<% if(session.getAttribute("lOGIN")!=null){%>
		Logged in User : <%=session.getAttribute("lOGIN")%> |<a href="invalidate">Logout</a>|<a href="empinfo.jsp">back</a>

<%}else{
	//	response.sendRedirect("log.jsp");
}%>
<%

  String id2=request.getParameter("id3");
//  System.out.println(id2);
%>

<%
Connection conn=null;
ResultSet rs=null;
PreparedStatement ps=null;
connector con=new connector();
try
{
	/*  String driver="com.mysql.jdbc.Driver";
		 String url="jdbc:mysql://localhost/emp_recd";
		 String user="root";
		 String password="redhat"; */
		 
    conn=con.getCon();	
	ps=conn.prepareStatement("select id,name,designation,mob_no from employee2 where id="+id2);
    rs = ps.executeQuery();
%>



<h1> Selected Record</h1>

<TABLE cellpadding="12" border="1" style="background-color: #ccffff;">

       
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



<% id2= rs.getString(1);
   System.out.println(id2);%>
   
   

<td><a href="Delete?id=<%=id2%>">Delete</a></td>
<td><a href="Update.jsp?id=<%=id2%>">Edit</a></td>



</tr>

<%} %>
<%
} catch (Exception ex) {
	ex.printStackTrace();
}finally{
	con.closeRS(rs);
	con.closePstmt(ps);
	con.closeConnection(conn);
}
%>
</table>

</body>
</html>