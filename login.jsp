<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to BooKing</title>

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
            <td style="padding-left:30" width="200" >

                <form action="loginResult.jsp" method=post>
<center>
<table  align="center" class="text3" cellpadding=0 cellspacing=0 border="0" bgcolor="#f2ecf8">
<th  colspan=2 valign="top">
<font size=3>Login</font>
<br><br>
</th>
<tr>
<td valign=top>
<b>Username:</b>&nbsp;

<td><input type="text" name="nick" value="" size=40 maxlength=20><br>
</tr>
<tr><td>
<b>Password:</b>&nbsp;
<td><input type="password" name="password"  value="" size=42 maxlength=20><br>
</tr>
<tr><td border ="0" celpadding = 0><p>  </p>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="image" src="images/logmein.gif" alt="Submit" value="Submit"> </tr>
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