<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add to cart</title>

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
        <%
        String  book = request.getParameter( "id" );
        session.setAttribute("ADD", book);
        %>
        <%--
 //String  book = request.getParameter( "id" );
 //out.println(book);
 //out.println("<input type=\"hidden\" value=\"=book\" name="book" />");

out.println("<form action=\"addResult.jsp?id=book\" method=post>");
out.println( "Insert quantity:<input type=\"text\" name=\"quantity\" value=\"\" size=3 maxlength=4></form> ");

out.println("<input type=\"submit\" value=\"Submit\">");
--%>
<br><br>
<form action="addResult.jsp" method=post>
Insert quantity:<input type="text" name="quantity" value="" size=3 maxlength=4>
<br>
    <input type="image" src="images/submit.gif" value="Submit" alt="Submit"></form>


</td>


</table></td>
  </tr>
</table>

</td>
  </tr>
</table>

</body>
</html>