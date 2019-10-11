<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Search Results</title>

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
    <table  border="0" align="left" cellspacing="0" cellpadding="0"><tr>
            <td style="padding-left:30" width=\"200\" >

           <%

String search = request.getParameter("search");



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
Statement stmt1 = conn.createStatement();
Statement stmt2 = conn2.createStatement();

ResultSet rs1, rs2;

rs1 = stmt1.executeQuery("SELECT * FROM BOOK WHERE AUTHOR like '%"+search+"%' or TITLE like '%"+search+"%'");
rs2= stmt2.executeQuery("SELECT * FROM BOOK WHERE AUTHOR like '%"+search+"%' or TITLE like '%"+search+"%'");;
int counter=0;
while(rs2.next()){
counter++;

}
if(counter!=0)
    out.println(counter+" results match your search.<br><br>");
conn2.close();
boolean bool  = false;

out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" colspan=7><tr>");
 out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");

while(rs1.next()){
    String ID = rs1.getString("BOOK_ID");
   String PRICE = rs1.getString("PRICE");
  String PUBLISHER = rs1.getString("PUBLISHER");
   String YEAR = rs1.getString("PUBLICATION_YEAR");
       String CATEGORY = rs1.getString("CATEGORY");
      String AUTHOR = rs1.getString("AUTHOR");
      String TITLE= rs1.getString("TITLE");
     String COVER = rs1.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\" ><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITLE+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHOR+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHER+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");

bool = true;
}
if(!bool){out.println("Your search "+search+" did not match any products.");}

out.println("</table>");




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