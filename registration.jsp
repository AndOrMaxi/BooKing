<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration</title>

<link href="booking.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1025">
    <jsp:include page="top.jsp"/>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15%"  valign="top" style="padding-left:10px;">

    <jsp:include page="left.jsp"  />
    </td>
    <td width="100%" align="center" valign="top" style="padding-top:10px;">
        <br /><br />
    <table  border="0" align="center" cellspacing="0" cellpadding="0"><tr>
            <td style="padding-left:30" width="500" >

                <form action="regProcess.jsp" method=post>
<center>
<table width="500" class="text3" border="0"  cellpadding=0 cellspacing=0 bgcolor="#f2ecf8">
<th colspan=2 valign="top">
<font size=3>User Registration</font>
<br>
<font size=2 color="red"><sup>*</sup> Required Fields</font><br><br>
</th>
<tr>
<td width="200" valign=top>
<b>&nbsp;First name<sup>*</sup></b>&nbsp;
<td width="300"><input type="text" name="firstName" value="" size=40 maxlength=20><br><br>
</tr>

<tr><td valign="top">
<b>&nbsp;Last name <sup>*</sup></b>&nbsp;
<td><input type="text" name="lastName" value="" size=40 maxlength=20><br><br>
</tr>

<tr><td valign="top">
<b>&nbsp;Nick name <sup>*</sup></b>&nbsp;
<td><input type="text" name="nickName" value="" size=40 maxlength=20><br><br>
</tr>

<tr><td valign="top">
<b>&nbsp;E-Mail<sup>*</sup></b>&nbsp;
<td><input type="text" name="email" value="" size=40  maxlength=40><br><br>
  </tr>
 <tr><td valign="top">
<b>&nbsp;Telephone number<sup>*</sup></b>&nbsp;
<td><input type="text" name="telephone" value="" size=40  maxlength=40><br><br>
</tr>
<tr><td valign="top">
<b>&nbsp;Password<sup>*</sup></b>&nbsp;
<td><input type="password" name="password1" size=41 value="" maxlength=20><br><br>
  </tr>

<tr><td valign="top">
<b>&nbsp;Confirm password<sup>*</sup></b>&nbsp;
<td><input type="password" name="password2" size=41 value="" maxlength=20><br><br>
  </tr>


<tr><td valign="top">
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
<tr>
<td  align=center colspan=2>
    <br>
<input type="image" src="images/submit.gif" value="Submit" alt="Submit"></tr>
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