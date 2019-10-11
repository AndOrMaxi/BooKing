<%@ page language="java" import="java.sql.*" import="java.util.Calendar" import="check.Exceptions"%>
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





<%

int cart_id_int = Integer.parseInt(cart_id);
//out.println("Cart_id "+cart_id);

String country = request.getParameter("country");
String city = request.getParameter("city");
String street = request.getParameter("street");
String number = request.getParameter("number");
String post_code = request.getParameter("post_code");
String payWay = "";

Calendar cal = Calendar.getInstance();
int dayI = cal.get(Calendar.DAY_OF_MONTH);
int monthI = cal.get(Calendar.MONTH) + 1;
int yearI = cal.get(Calendar.YEAR);
String day = Integer.toString(dayI);
String month = Integer.toString(monthI);
String year = Integer.toString(yearI);
String date = year.concat("-").concat((String)month).concat("-").concat((String)day);

int numberInt = 0, completed = 0;
int post_code_int = 0;
boolean bool = true, con = true, cit = true, str=true, num=true, code=true;

if(request.getParameter("payWay") != null) {
    if(request.getParameter("payWay").equals("cash")) {
       payWay = "Cash";
    }
    else if (request.getParameter("payWay").equals("american_ex")){
       payWay = "American Express";
    }

    else if (request.getParameter("payWay").equals("maestro")){
       payWay = "Maestro";
    }
    else if (request.getParameter("payWay").equals("master_card")){
       payWay = "MasterCard";
    }
    else if (request.getParameter("payWay").equals("paypal")){
                    payWay = "Paypal";
    }
    else {
       payWay = "Visa";
    }
}

if(city == ""){
    cit=false;
    bool = false;
}
if(country == ""){
    con = false;
    bool = false;
}
if(street == ""){
    str = false;
    bool = false;
}
if(number == ""){
    num = false;
    bool = false;
}else{
  numberInt = Exceptions.checkNumber(number);
  if(numberInt == 0 ){
    num = false;
    bool = false;
  }
}
if(post_code == ""){
    code = false;
    bool = false;
}
else if(post_code.length()!=5){
    code= false;
    bool = false;
}
else{
  post_code_int = Exceptions.checkNumber(post_code);
  if(post_code_int == 0){
    code = false;
    bool = false;
  }
}
/*
out.println("Country " + con);
out.println("\nCity "+cit);
out.println("\nStreet "+str);
out.println("\nNumber "+num);
out.println("\nPost Code "+code);
out.println(bool);
 * */
if(bool){


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
Connection conn1 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn2 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn3 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Statement stmt = conn.createStatement();
Statement stmt1 = conn1.createStatement();
Statement stmt2 = conn2.createStatement();
Statement stmt3 = conn3.createStatement();
ResultSet rs,rs1;

rs1 = stmt1.executeQuery("SELECT max(ORDER_ID) as id FROM ORDERS");
rs1.next();
int order_id = rs1.getInt("id");
order_id++;


String sql1="INSERT INTO ORDERS  VALUES" + " (" + order_id + ", " + cart_id_int + ", '" + payWay + "', '" + date + "', '" + country + "', '" + city + "', '" + street + "',  " + numberInt + ", " + post_code_int + ")";
stmt.executeUpdate(sql1);
out.println("You've just completed your order (No. "+order_id+"). Thank you for choosing BooKing!");



String sql2 = "Update CART Set COMPLETED = '1' Where CART_ID = '"+cart_id_int+"'";
stmt2.executeUpdate(sql2);

cart_id_int++;
String i = Integer.toString(cart_id_int);
session.setAttribute("CART",i);
//out.println(i);

String sql3="INSERT INTO CART(CART_ID, CUSTOMER_ID,  COMPLETED) VALUES" + " (" + cart_id_int + ", '" + customer_id + "',  " + completed + ")";
stmt3.executeUpdate(sql3);

conn.close();
}
catch (Exception e)
{
out.println( "<h2>Exception: "+e.getMessage()+"</h2>" );
}
}else{
    out.println("<form action=\"orderResult.jsp\" method=post><center><table  class=\"title\" cellpadding=0 cellspacing=0 border=\"0\" bgcolor=\"#f2ecf8\">");
    out.println("<th  colspan=2 valign=\"top\"><font size=5>Book Order</font><br></th><tr>");
    out.println("<td valign=top><b>Country:</b>&nbsp;<td><input type=\"text\" name=\"country\" value=\"\" size=56 maxlength=15><br>");
    if(!con) {out.println("<font size=2 color=red valign=top>Please enter your country</font></tr>");}
    else out.println("</tr>");
    out.println("<tr><td><b>City:</b>&nbsp;<td><input type=\"text\" name=\"city\" value=\"\" size=56 maxlength=15><br>");
    if(!cit) {out.println("<font size=2 color=red valign=top>Please enter your city</font></tr>");}
    else out.println("</tr>");
    out.println("<tr><td><b>Street: </b>&nbsp;<td><input type=\"text\" name=\"street\" value=\"\" size=56 maxlength=30><br>");
    if(!str) {out.println("<font size=2 color=red valign=top>Please enter your street</font></tr>");}
    else out.println("</tr>");
    out.println("<tr><td><b>Street number:</b>&nbsp;<td><input type=\"text\" name=\"number\" value=\"\" size=56  maxlength=3><br>");
    if(!num) {out.println("<font size=2 color=red valign=top>Please enter until three digit Number</font></tr>");}
    else out.println("</tr>");
    out.println("<tr><td><b>Post code:</b>&nbsp;<td><input type=\"text\" name=\"post_code\" value=\"\" size=56  maxlength=5><br>");
    if(!code) {out.println("<font size=2 color=red valign=top>Please enter five digit Number</font></tr>");}
    else out.println("</tr>");
    out.println("<tr><td colspan =6 class=\"text3\"><hr/><center><b>PAYMENT WAY</b></center><br><input type=\"radio\" name=\"payWay\" value=\"cash\" checked><img src=\"images/Cash.jpg\"><input type=\"radio\" name=\"payWay\" value=\"american_ex\"><img src=\"images/AmExp.gif\"> ");
    out.println("<input type=\"radio\" name=\"payWay\" value=\"maestro\"><img src=\"images/Maestro.jpg\"> <input type=\"radio\" name=\"payWay\" value=\"master_card\"><img src=\"images/MasterCard.jpg\"> ");
    out.println("<input type=\"radio\" name=\"payWay\" value=\"paypal\"><img src=\"images/Paypall.jpg\"><input type=\"radio\" name=\"payWay\" value=\"visa\"><img src=\"images/V.jpg\"></tr>");
    out.println("<tr ><td  align=center colspan=2><input type=\"image\" src=\"images/submit.gif\" value=\"Submit\" alt=\"Submit\"> ");
    out.println("</tr></table></center></form>");
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