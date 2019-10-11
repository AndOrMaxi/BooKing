<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Make review</title>

<link href="booking.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1025">
     <%
        String customer_id = (String) session.getAttribute("ID");
        String cart_id = (String) session.getAttribute("CART");

String  book = request.getParameter( "id" );
session.setAttribute( "book", book);
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
        <br /><br />
    <table  border="0" align="center" cellspacing="0" cellpadding="0"><tr>
            <td style="padding-left:30" width="500" >

                <form action="makereviewresult.jsp" method=post>
<center>
<table width="350" class="text3" border="0"  cellpadding=0 cellspacing=0 bgcolor="#f2ecf8">
<th colspan=2 valign="top">
<font size=3>Make your review</font>
<br>
<br>
</th>
<tr>
<td width="150" valign=top>
<b>&nbsp;Rate</b>&nbsp;
<td width="200">
    <select name="rate">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>

</select>
<br><br>
</tr>

<tr><td valign="top">
<b>&nbsp;Comments </b>&nbsp;
<td><textarea rows="5" cols="30" name="comments">
I have read this book.
</textarea>
</tr>


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