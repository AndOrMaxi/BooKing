<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<jsp:useBean id="formHandler" class="test.FormBean" scope="request"/>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration</title>

<link href="booking.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="1025"><jsp:include page="top.jsp"/>
      <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
    <td width="15%"  valign="top" style="padding-left:10px;">

    <jsp:include page="left.jsp"  />
    </td>
    <td width="100%" align="center" valign="top" style="padding-top:10px;">
        <br /><br />
    <table align="center"  border="0" cellspacing="0" cellpadding="0"><tr>
            <td style="padding-left:30" width="500" >


                <form action="regProcess.jsp" method=post>
<center>
<table width="500" border="0" class="text3" align="center"  cellpadding=0 cellspacing=0 bgcolor="#f2ecf8">
<th colspan=2 valign="top">
<font size=3>User Registration</font>
<br>
<font size=2 color="red"><sup>*</sup> Required Fields </font><br><br>
</th>
<tr><td width="200" valign=top>
<B>&nbsp;First Name<sup>*</sup></B></td><td width="300">
<input type="text" name="firstName"
value='<%=formHandler.getFirstName()%>' size=40 maxlength=20><br>
<font size=2 color=red valign=top><%=formHandler.getErrorMsg("firstName")%></font>
</tr>
<tr>
<td valign=top>
<B>&nbsp;Last Name<sup>*</sup></B></td><td>
<input type="text" name="lastName"
value='<%=formHandler.getLastName()%>' size=40 maxlength=20><br>
<font size=2 color=red valign=top><%=formHandler.getErrorMsg("lastName")%></font>
</td>
</tr>
<tr><td valign=top>
<B>&nbsp;Nick name<sup>*</sup></B>
<td><input type="text" name="nickName" size=40 maxlength=20
value='<%=formHandler.getNickName()%>'><br>
<font size=2 color=red valign=top><%=formHandler.getErrorMsg("nickName")%></font>
</tr>
<tr>
<td valign=top>
<B>&nbsp;E-Mail<sup>*</sup></B></td><td>
<input type="text" name="email" value='<%=formHandler.getEmail()%>'
size=40  maxlength=20><br><font size=2 color=red valign=top><%=formHandler.getErrorMsg("email")%></font>
</td></tr>
<tr>
<td valign=top>
    <B>&nbsp;Telephone number<sup>*</sup></B></td><td>
<input type="text" name="telephone"  size=40 maxlength=40
value='<%=formHandler.getTelephone()%>'><br><font size=2 color=red valign=top><%=formHandler.getErrorMsg("telephone")%></font>
</tr>

<tr>
<td valign=top>
<B>&nbsp;Password<sup>*</sup></B></td>
<td>
<input type="password" name="password1" size=40  maxlength=40
value='<%=formHandler.getPassword1()%>'><br><font size=2 color=red valign=top><%=formHandler.getErrorMsg("password1")%></font>
</td></tr>
<tr>
<td valign=top>
<B>&nbsp;Confirm Password<sup>*</sup></B></td>
<td>
<input type="password" name="password2" size=40  maxlength=40
value='<%=formHandler.getPassword2()%>'><br><font size=2 color=red valign=top><%=formHandler.getErrorMsg("password2")%></font><br>
</td>

</tr>
<tr><td>
<b>&nbsp;Date of birth<sup>*</sup></b>&nbsp;
<td>
<script type="text/javascript">
// Set/Change the Year in the dropdown
var startyear = "1950"; // Change the Starting year in your dropdown
var endyear = "2011";  // Change th ending year in the dropdown
function getdate() {
var mon = document.nday.birthmonth.options[document.nday.birthmonth.selectedIndex].value;
var day = document.nday.birthday.options[document.nday.birthday.selectedIndex].value;
var year = document.nday.birthyear.options[document.nday.birthyear.selectedIndex].value;
var string = year+"-"+mon+"-"+day
return string;
}
</script>

<select name="birthday" size="1">
  <script type="text/javascript">
	for(var j=1;j<32;j++)
	document.write("<option value="+j+">"+j+"</option>");
  </script>
</select>

<select name="birthmonth" size="1">
  <script type="text/javascript">
	for(var i=1;i<13;i++)
	document.write("<option value="+i+">"+i+"</option>");
  </script>
        </select>

	<select name="birthyear" size="1">
	<script type="text/javascript">
		for(var k=endyear;k>startyear;k--)
		document.write("<option value="+k+">"+k+"</option>");
        </script>
        </select>
</tr>
<tr>
<td colspan=2 align=center><br>
<input type="image" src="images/submit.gif" value="Submit" alt="Submit">
</td>
</tr>
</table>
</center>
</form>

            </td>
                </table></td>
  </tr>
</table>

</td>
  </tr>
</table>

</body>
</html>