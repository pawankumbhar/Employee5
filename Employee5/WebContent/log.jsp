<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body bgcolor="#E6E6FA">
<a href="AboutUs.jsp"  align=left>AboutUs</a>

<title>Insert title here</title>
</head>
<body>
<script>
function Validate(){
	var user=document.frm.user;
	var pass=document.frm.password;
log
	if (user.value==""){
alert("Please Enter user");
user.focus();
return false;
}
	if (pass.value==""){
alert("Please Enter password");
pass.focus();
return false;
}
	if(user.value!==user && pass.value!==password)
		{
			alert("enter the valid user & password");
		} 
	alert("welcome user");
	return true;


}
</script>
<form name="frm" action="Login_emp" onSubmit="return Validate()" >
<%-- <h1 >EMPLOYEE LOGIN</h1>
<img src="Logo.jpg" alt="EMPLOYEE LOGIN" style="width:128px;height:128px;">--%>

<TABLE cellpadding="15" border="1" style="background-color: #CCEEFF ;" align="center">
<tr>
<td><img src="Logo.jpg" alt="EMPLOYEE LOGIN" style="width:128px;height:128px; border:1;">
</td>
<td><h1 >EMPLOYEE LOGIN</h1></td>
</tr>

<tr>
<td align="center"><font face="Times New Roman, Times, serif">user</font></td><td><input type="text" name="user"></td>
</tr>
<tr>
<td align="center">Password</td><td><input type="password" name="password"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="lOGIN" >
<input type="reset" value="Reset"></td>
</tr>


</table>
</form>

</body>
</html>