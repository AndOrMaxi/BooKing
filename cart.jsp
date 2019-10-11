<%@ page language="java" import="java.sql.*" import="javax.sql.*"  import = "javax.naming.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cart</title>

<link href="booking.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1025">
   <%
        String cust_id = (String) session.getAttribute("ID");
        String cart_id = (String) session.getAttribute("CART");


        if (cust_id==null){
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
    <table align="center"  border="0" cellspacing="0" cellpadding="0"><tr>
                <td style="padding-left:30" width="200" >



<%

//out.println(cust_id);
if(cust_id != null){
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
      out.println("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr class=\"bold2\"><td>No</td><td>ISBN</td><td>Title</td><td>Author</td><td>Publisher</td><td>Quantity</td><td>Price</td></tr>");
Connection conn = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn1 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn2 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Statement stmt = conn.createStatement();
Statement stmt1 = conn1.createStatement();
Statement stmt2 = conn1.createStatement();
CallableStatement cs = conn.prepareCall("{call TotCost(?)}");
ResultSet rs,rs1, rs2;

//goa dokimes
//String sql1 = "Select BOOK_ID, QUANTITY From [CONTAINS] Where CART_ID = '"+1+"'";
String sql1 = "Select BOOK_ID, QUANTITY From [CONTAINS] Where CART_ID = '"+cart_id+"'";
rs1 = stmt.executeQuery(sql1);
int counter=1;
while(rs1.next()){
    String bId = rs1.getString(1);
    String quan = rs1.getString(2);
     rs2 = stmt1.executeQuery("select distinct BOOK_ID,  PRICE,  PUBLISHER, TITLE,ISBN, AUTHOR from BOOK where BOOK_ID='"+ bId +"';");


       while(  rs2.next()){
         String BOOKID = rs2.getString("BOOK_ID");
    String PRICE = rs2.getString("PRICE");
      String PUBLISHER = rs2.getString("PUBLISHER");
      String TITLE= rs2.getString("TITLE");
        String ISBN = rs2.getString("ISBN");
       String AUTHOR = rs2.getString("AUTHOR");

     out.println("<tr class=\"text\"><td>"+counter+"</td><td>"+ISBN+"</td>  <td>"+TITLE+"</td>    <td>"+AUTHOR+"</td>    <td>"+PUBLISHER+"</td>    <td>"+quan+"</td> <td>"+PRICE+"</td> </tr>");
     counter++;}
}

conn2.close();
//gia dokimes
//cs.setString (1, "1"); opou ekei bale opoio noumero thes ths bashs"1"
cs.setString (1, cart_id);
rs = cs.executeQuery();

rs.next();
String tc = rs.getString(1);
if(tc == null) {tc = "0";}
//out.println("Total Cost "+tc);
//if(tc != null){out.println(tc);}else{out.println("The Cart is empty");}

  out.println("<tr style=\"border-top:2px solid #666;\">"+
    "<td style=\"border-top:2px solid #666;\">&nbsp;</td>"+
    "<td style=\"border-top:2px solid #666;\">&nbsp;</td>"+
    "<td style=\"border-top:2px solid #666;\">&nbsp;</td>"+
    "<td style=\"border-top:2px solid #666;\">&nbsp;</td>"+
    "<td style=\"border-top:2px solid #666;\">&nbsp;</td>"+
    "<td  style=\"border-top:2px solid #666;\" class=\"booktitle\">Total Cost</td>"+
    "<td style=\"border-top:2px solid #666;\">&#8364;"+tc+"</td>"+
 " </tr></table>");

if(!tc.equals("0")){
out.println("<br /><br /><center><a align=\"left\" style=\"font-size: 16px; font-weight: bold; \" class=\"buttonn\" href=\"order.jsp\">Check out</a></center>");
}
/*
rs = stmt.executeQuery("Select * From [CONTAINS] Where CART_ID = '" +cart_id+"'");
while(rs.next()){
    String book_id = rs.getString(1);
    out.println(book_id);
}

rs1 = stmt1.executeQuery("Exec TotalCost '"+cart_id+"'");
*/
/*
rs1 = stmt1.executeQuery("SELECT max(ORDER_ID) as id FROM ORDERS");
rs1.next();
order_id = rs1.getInt("id");
order_id++;

*/
//String sql1="INSERT INTO CART(CART_ID, CUSTOMER_ID, ORDER_ID,  COMPLETED) VALUES" + " (" + cart_id + ", '" + id + "', " + order_id + ", " + completed + ")";
//stmt.executeUpdate(sql1);


//out.println(cart_id+" "+order_id);

conn.close();
}
catch (Exception e)
{
out.println( "<h2>Exception: "+e.getMessage()+"</h2>" );
}
}
else {out.println("<form action=\"loginResult.jsp\" method=post><center>");
   out.println("<table align=\"center\" class=\"text3\" cellpadding=0 cellspacing=0 border=\"0\"  bgcolor=\"#f2ecf8\">");
  out.println("<th colspan=2 valign=\"top\"> <font size=3>Login</font></th><tr><td><td><p align = \"left\" ><font size=2 color = \"red\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You need to login to use the cart.</font></p></tr>");
   out.println("<tr><td valign=top><b>Username:</b>&nbsp;<td><input type=\"text\" name=\"nick\" value=\"\" size=40 maxlength=20><br>");
   out.println("</tr><tr><td><b>Password:</b>&nbsp; <td><input type=\"password\" name=\"password\"  value=\"\" size=41 maxlength=20><br>");
   out.println("</tr><tr ><td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   out.println("<input type=\"image\" src=\"images/logmein.gif\" value=\"Submit\" alt=\"Submit\"> </tr></table></center></form>");
}


/*
String id = "6";
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

Connection conn = DriverManager.getConnection ("jdbc:odbc:Test","","");
Statement stmt1 = conn.createStatement();
ResultSet rs1;
rs1 = stmt1.executeQuery("SELECT * FROM CART WHERE CUSTOMER_ID = '"+id+"' and COMPLETED = '0'");

if(rs1.next()){
String nam = rs1.getString("COMPLETED");
out.print(nam);
}
else{out.println("Fuck ");}

conn.close();
}
catch (Exception e)
{
out.println( "<h2>Exception: "+e.getMessage()+"</h2>" );
}
*/
%>



  </td>
  </tr>
</table>

</td>
  </tr>
</table>

</body>
</html>