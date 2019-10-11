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
            <td align="center" style="padding-left:30" width=\"200\" >


         <%

String username = request.getParameter("nick");
String pass = request.getParameter("password");
String id = "", n="";

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch (ClassNotFoundException e)
{
out.println("<h1>Driver not found:" + e + e.getMessage()+ "</h1>" );
}
try
{

Connection conn = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn2 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn3 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn4 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Statement stmt1 = conn.createStatement();
Statement stmt2 = conn2.createStatement();
Statement stmt3 = conn3.createStatement();
Statement stmt4 = conn4.createStatement();
ResultSet rs1,rs2,rs3;
int review = 0;
boolean nick = true, passwd = true;

rs1 = stmt1.executeQuery("SELECT NAME FROM CUSTOMER WHERE NICKNAME = '"+username+"'");
rs2 = stmt2.executeQuery("SELECT * FROM CUSTOMER WHERE NICKNAME = '"+username+"' and PASSWD = '"+pass+"'");



if(rs2.next()){
id = rs2.getString("CUSTOMER_ID");
n = rs2.getString("NICKNAME");

}
else{passwd = false;}


if(rs1.next()){
String nam = rs1.getString("NAME");
}
else{nick = false;}


if(!nick){
   out.println("<form action=\"loginResult.jsp\" method=post><center>");
   out.println("<table align=\"center\" class=\"text3\" cellpadding=0 cellspacing=0 border=\"0\"  bgcolor=\"#f2ecf8\">");
  out.println("<th colspan=2 valign=\"top\"> <font size=2 color = \"red\">Incorrect Username</font>");
   out.println("<br><br></th><tr><td valign=top><b>Username:</b>&nbsp;<td><input type=\"text\" name=\"nick\" value=\"\" size=40 maxlength=20><br>");
   out.println("</tr><tr><td><b>Password:</b>&nbsp; <td><input type=\"password\" name=\"password\"  value=\"\" size=41 maxlength=20><br>");
   out.println("</tr><tr ><td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   out.println("<input type=\"image\" src=\"images/logmein.gif\" value=\"Submit\" alt=\"Submit\"> </tr></table></center></form>");
}else if (!passwd){
   out.println("<form action=\"loginResult.jsp\" method=post><center>");
   out.println("<table align=\"center\" class=\"text3\" cellpadding=0 cellspacing=0 border=\"0\" bgcolor=\"#f2ecf8\">");
   out.println("<th colspan=2 valign=\"top\"> <font size=2 color = \"red\">Incorrect Password</font>");
   out.println("<br><br></th><tr><td valign=top><b>Username:</b>&nbsp;<td><input type=\"text\" name=\"nick\" value=\"\" size=40 maxlength=20><br>");
   out.println("</tr><tr><td><b>Password:</b>&nbsp; <td><input type=\"password\" name=\"password\"  value=\"\" size=41 maxlength=20><br>");
   out.println("</tr><tr ><td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   out.println("<input type=\"image\" src=\"images/logmein.gif\" value=\"Submit\" alt=\"Submit\"> </tr></table></center></form>");
}
if(passwd){
    rs3 = stmt3.executeQuery("SELECT max(CART_ID) as id FROM CART");
    rs3.next();
    int c_id = rs3.getInt("id");
    c_id++;
    String i = Integer.toString(c_id);

    int order_id = 0,completed = 0;
   String sql1="INSERT INTO CART(CART_ID, CUSTOMER_ID,  COMPLETED) VALUES" + " (" + c_id + ", '" + id + "', " + completed + ")";
   stmt4.executeUpdate(sql1);

    session.setAttribute( "ID", id);
    session.setAttribute("CART",i);
session.setAttribute( "NICKNAME", n);

    %>
   <jsp:forward page="index.jsp"/>
   <%
}

conn.close();
}
catch (Exception e)
{
out.println( "<h2>Exception: "+e.getMessage()+"</h2>" );
}

%>


            </td>
</table></td>
  </tr>
</table>

</td>
  </tr>
</table>

</body>
</html>