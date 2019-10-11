

<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>About us</title>

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
    <table align="left"  border="0" cellspacing="0" cellpadding="50" colspan="3"><tr>

        <tr><br><br><br>
           <td style="padding-left:100">
              <a class="text" align="center"><font size="2">
              <p>ΤΟΥΜΑΝΙΔΟΥ ΑΝΔΡΟΜΑΧΗ<br><center> A.M. p3040185</center></font> </a>

           <td>

             <a class="text" align="center"><font size="2">
             <center><p>IVANOV EDISLAV <br>A.M. p3070170</center></font> </a>

           <td>
               <a class="text" align="center"> <a class="text" align="center">
               <p>ΤΣΑΜΗ ΧΡΙΣΤΙΝΑ <br> <center>A.M. p3060230</center></font> </a>

        </tr>
        <tr>
            <td>
            <td>
                <a class="text" align="center"><font size="2">
                <br><br><br>
                <p> All copyright reserved <br><center> © 2011 BooKing.com  </center> </font> </a>

            <td>
        </tr>

     </table>


</table></td>
  </tr>
</table>

</body>
</html>