<%@ page language="java" import="java.sql.*"  import="check.Exceptions"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Review</title>

<link href="booking.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1025">
   <%
        String customer_id = (String) session.getAttribute("ID");
        int customer_int = Integer.parseInt(customer_id);
        String book = (String) session.getAttribute("book");
int book_int = Integer.parseInt(book);

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




String rate = request.getParameter("rate");
int rate_int = Integer.parseInt(rate);
String comments = request.getParameter("comments");



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

rs1 = stmt1.executeQuery("SELECT max(REVIEW_ID) as id FROM REVIEW");
rs1.next();
int review_id = rs1.getInt("id");
review_id++;


String sql1="INSERT INTO REVIEW  VALUES" + " (" + review_id + ", " + rate + ", '" + comments + "', " + customer_id + ", " + book + ")";
stmt.executeUpdate(sql1);
out.println("Thank you for your opinion!");




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