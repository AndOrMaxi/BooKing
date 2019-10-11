<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<html><head> </head><body>
<%

String quantity = request.getParameter("quantity");
// String  book = request.getParameter( "id" );
String  book = (String)session.getAttribute( "ADD" );
  String customer_id = (String) session.getAttribute("ID");
        String cart_id = (String) session.getAttribute("CART");
 out.println(book+" "+customer_id+" "+cart_id);


 try
{

Connection conn = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");

Statement stmt = conn.createStatement();



stmt.executeUpdate("INSERT INTO [CONTAINS] VALUES ('"+cart_id+"', '"+book+"','"+quantity+"')");




conn.close();
}
catch (Exception e)
{
out.println( "<h2>Exception: "+e.getMessage()+"</h2>" );
}
%>
<jsp:forward page="cart.jsp"/>



    </body>
</html>