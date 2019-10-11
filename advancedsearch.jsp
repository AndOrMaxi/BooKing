<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Advanced Search</title>

<link href="booking.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1025">
   <%
        String customer_id = (String) session.getAttribute("ID");
        String cart_id = (String) session.getAttribute("CART");


        if (customer_id==null){
        %>
    <jsp:include page="top.jsp"/>
    <%
       }else{
    %>
     <jsp:include page="top2.jsp"/><%}%>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15%"  valign="top" style="padding-left:10px;">

    <jsp:include page="left.jsp"  />
    </td>
    <td width="100%" align="center" valign="top" style="padding-top:10px;">
    <table width="300"  border="0" align="center" cellpadding="0" cellspacing="0"><tr>
            <td align="center" style="padding-left:30" width="300" >
                <br><br>
          <form action="advSearchResult.jsp" method=post>
<table class="text3" cellpadding=0 cellspacing=0 border="0"  align ="center" bgcolor="#f2ecf8">
<th  colspan=2 valign="top" align ="center">
<font size=3>Advanced Search</font><br>
<br>
</th>
<tr>
<td width="100">
&nbsp;<b>Book Title:</b>&nbsp;
<td><input type="text" name="title" value="" size=40 maxlength=20><br>
</tr>

<tr><td>
&nbsp;&nbsp;<b>Author:</b>&nbsp;
<td><input type="text" name="author" value="" size=40 maxlength=20><br>
</tr>

<tr><td>
&nbsp;&nbsp;<b>Publisher:</b>&nbsp;
<td><input type="text" name="publisher" value="" size=40 maxlength=20><br>
</tr>

<tr><td>
&nbsp;&nbsp;<b>ISBN 10:</b>&nbsp;
<td><input type="text" name="isbn" size=40 value="" maxlength=20><br><br>
</tr>

<tr >
<td colspan="2">
<center><input type="image" src="images/search.gif" alt="Submit" value="Submit"></center>
</tr></table>
</form>




</td>
  </tr>
</table>

</td>
  </tr>
</table>

</body>
</html>