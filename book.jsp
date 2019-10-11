

<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Details</title>

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
    <td width="100%" align="center" valign="top" style="padding-top:30px; padding-left:50px;" >

    <table align="left"  border="0" cellspacing="0" cellpadding="0"><tr>
                <td class="bold" width="200" height="341"  align="left" valign="top">
       <%

try {
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
} catch (ClassNotFoundException e) {
out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
}
try {


   String  book = request.getParameter( "id" );

   //out.println(book);

   Connection conn1 = DriverManager.getConnection("jdbc:odbc:Test","p3070170","Eddy01411");
 Connection conn2 = DriverManager.getConnection("jdbc:odbc:Test","p3070170","Eddy01411");
    Statement stmt1 = conn1.createStatement();
    Statement stmt2 = conn2.createStatement();
    ResultSet rs;
    ResultSet rs2;
    int counter=0;
    rs = stmt1.executeQuery("select distinct ID, COVER, ISBN, PRICE, PUBLICATION_YEAR, CATEGORY, PUBLISHER, TITLE, RANKING, HARD_COVER, AVAILABILITY, DESCRIPTION_FIELD, AUTHOR, PAGES from BOOKINFO where ID="+book +";");
    rs2 = stmt2.executeQuery("select RATE,COMMENTS,NICKNAME from BOOKINFO where ID="+book +";");
     if(rs.next())
    {
       String BOOKID = rs.getString("ID");
       String COVER = rs.getString("COVER");
       String ISBN = rs.getString("ISBN");
       String PRICE = rs.getString("PRICE");
       String PUBLICATION_YEAR= rs.getString("PUBLICATION_YEAR");
       String CATEGORY = rs.getString("CATEGORY");
       String PUBLISHER = rs.getString("PUBLISHER");
       String TITLE= rs.getString("TITLE");
       String RANKING= rs.getString("RANKING");
       String HARD_COVER= rs.getString("HARD_COVER");
       String AVAILABILITY= rs.getString("AVAILABILITY");
       String DESCRIPTION_FIELD= rs.getString("DESCRIPTION_FIELD");
       String AUTHOR = rs.getString("AUTHOR");
       String PAGES = rs.getString("PAGES");
    int stars=Integer.parseInt(RANKING);
      COVER= COVER.substring(1,COVER.length());
      String mes,mes2;
      if (Integer.parseInt(AVAILABILITY)>0)
              mes="Available(1-3 days)";
      else
          mes="Not available.Please contact us.";

      if (Integer.parseInt(HARD_COVER)==0)
          mes2="No";
        else
            mes2="Yes";




out.println("  <img src=\""+COVER+"\" width=\"200\" height=\"267\" alt=\"cov\"><br /><br /><a class=\"buttonn\" href=\"add.jsp?id="+BOOKID+"\" ><center>Add to cart<img src=\"images\\cart1.gif\" width=\"20\" height=\"16\" alt=\"cart\"></center></a><br><br>");

if(customer_id != null)
out.println("<center><a class=\"buttonn\" href=\"makereview.jsp?id="+BOOKID+"\" >Make review</a></center></td>");


out.println("<td  width=\"600\" align=\"left\" valign=\"top\" style=\"padding-top:5px;padding-left:30px;\">"+
      "<table  align=\"left\" width=\"300\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
        "<tr>          <td  align=\"left\" colspan=\"2\" class=\"booktitle\">"+TITLE+"</td>          </tr>        <tr>          <td align=\"left\" colspan=\"2\" class=\"author\">"+AUTHOR+"</td> </tr>"+
       " <tr><td width=\"50\" class=\"bold\" style=\"padding-top:20px;\">Price:</td>"+
          "<td width=\"50\" align=\"left\" class=\"text3\" style=\"padding-top:20px;\">&#8364;"+PRICE+"</td>"+
        "</tr> <tr> <td class=\"bold\">Availabilty:</td> <td  align=\"left\"class=\"text3\">"+mes+"</td></tr>"+
        "<tr><td class=\"bold2\" style=\"padding-top:30px; padding-bottom:10px;\">Description</td>"+
          "<td>&nbsp;</td>"
        +"</tr><tr class=\"text3\" ><td  align=\"left\"class=\"text3\" colspan=\"2\">"+DESCRIPTION_FIELD+"</td></tr><tr>"+
          "<td class=\"bold2\" style=\"padding-top:50px; padding-bottom:10px;\">Details</td>"+
          "<td>&nbsp;</td></tr> <tr><td class=\"bold\">Category:</td>"+
          "<td align=\"left\" class=\"text3\">"+CATEGORY+"</td></tr><tr><td class=\"bold\">Pages:</td>"+
          "<td align=\"left\" class=\"text3\">"+PAGES+"</td>"+
        "</tr><tr>          <td class=\"bold\">Hard Cover:</td><td class=\"text3\">"+mes2+"</td>"
        +"</tr> <tr><td class=\"bold\">Publisher:</td> <td align=\"left\" class=\"text3\">"+PUBLISHER+"</td></tr><tr>"
          +"<td class=\"bold\">Publication Year:</td><td align=\"left\" class=\"text3\">"+PUBLICATION_YEAR+"</td>"+
        "</tr><tr><td class=\"bold\">ISBN:</td><td align=\"left\" class=\"text3\">"+ISBN+"</td> </tr>  <tr>"+
          "<td class=\"text\">");
int i;
        for( i=0; i<stars;i++)
            out.println("<img src=\"images/star.gif\" width=\"20\" height=\"21\" alt=\"s\">");
        for(int j=0; j<5-i;j++)
            out.println("<img src=\"images/starempty.gif\" width=\"20\" height=\"21\" alt=\"s\">");
        out.println("</td>"+
          "<td class=\"text3\">&nbsp;</td>"+
        "</tr><tr><td class=\"bold2\" style=\"padding-top:30px;padding-bottom:10px;\">Reviews</td>"+
          "<td>&nbsp;</td></tr> <tr><td colspan=\"2\" class=\"text3\" >");
    }

          while(rs2.next())
    {
       String RATE = rs2.getString("RATE");
       String COMMENTS = rs2.getString("COMMENTS");
       String NAME= rs2.getString("NICKNAME");
       int starss=Integer.parseInt(RATE);
       out.println("<a class=\"bold\" >"+NAME+"</a><br>"+COMMENTS+"<br>");
       int i;
        for( i=0; i<starss;i++)
            out.println("<img src=\"images/star.gif\" width=\"20\" height=\"21\" alt=\"s\">");
        for(int j=0; j<5-i;j++)
            out.println("<img src=\"images/starempty.gif\" width=\"20\" height=\"21\" alt=\"s\">");
       out.println("<hr>");
       }
        out.println("</td></tr></table><p>&nbsp;</p></td>");

       conn1.close();
      conn2.close();

}catch (Exception e) {
out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
}%>
</table></td>
  </tr>
</table>

</td>
  </tr>
</table>

</body>
</html>