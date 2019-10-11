<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Order</title>

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
    <table align="center"  border="0" cellspacing="0" cellpadding="0"><tr>
                <td style="padding-left:30" width=\"200\" >








                    <br><br>
<form action="orderResult.jsp" method=post >
<center>
  <table class="title" cellpadding=0 cellspacing=0 border="0" bgcolor="#f2ecf8">
  <tr >
    <td  align=center colspan=2><table class="title" cellpadding=0 cellspacing=0 border="0" >
  <th  colspan=2 valign="top"> <font size=5>Book Order</font> <br>
  </th>
  <tr>
    <td valign=top><b>Country:</b>&nbsp;
    <td><input type="text" name="country" value="" size=56 maxlength=15>
      <br>
    </tr>
  <tr>
    <td><b>City:</b>&nbsp;
    <td><input type="text" name="city" value="" size=56 maxlength=15>
      <br>
    </tr>
  <tr>
    <td><b>Street: </b>&nbsp;
    <td><input type="text" name="street" value="" size=56 maxlength=30>
      <br>
    </tr>
  <tr>
    <td><b>Street number:</b>&nbsp;
    <td><input type="text" name="number" value="" size=56  maxlength=3>
      <br>
    </tr>
  <tr>
    <td><b>Post code:</b>&nbsp;
    <td><input type="text" name="post_code" value="" size=56  maxlength=5>
      <br>
    </tr>
  <tr>
    <td colspan =6 class="text3"><hr/>
      <center>
        <b>PAYMENT WAY</b>
      </center>
      <br>
      <input type="radio" name="payWay" value="cash" checked>
      <img src="images/Cash.jpg">
      <input type="radio" name="payWay" value="american_ex">
      <img src="images/AmExp.gif">
      <input type="radio" name="payWay" value="maestro">
      <img src="images/Maestro.jpg">
      <input type="radio" name="payWay" value="master_card">
      <img src="images/MasterCard.jpg">
      <input type="radio" name="payWay" value="paypal">
      <img src="images/Paypall.jpg">
      <input type="radio" name="payWay" value="visa">
      <img src="images/V.jpg">

    </tr>
  <tr >
    <td  align=center colspan=2><input type="image" src="images/submit.gif" value="Submit" alt="Submit">
    </tr>
    </table>    </tr>
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