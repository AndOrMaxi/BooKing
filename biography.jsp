<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Biography</title>

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
    <table align="left"  border="0" cellspacing="0" cellpadding="0"><tr>
                <td style="padding-left:30" width=\"200\" >
  <%

try {
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
} catch (ClassNotFoundException e) {
out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
}
try {


    Connection conn = DriverManager.getConnection("jdbc:odbc:Test","p3070170","Eddy01411");

    Statement stmt1 = conn.createStatement();
    ResultSet rs;
    int counter=0;
    rs = stmt1.executeQuery("select top 8  COVER, PRICE, TITLE, AUTHOR,  DESCRIPTION_FIELD,  RANKING, BOOK_ID from BOOK where CATEGORY='Biography' and AVAILABILITY>0 order by PUBLICATION_YEAR desc;");
    while ( rs.next() )
    {

       String COVER = rs.getString("COVER");
       String PRICE = rs.getString("PRICE");
       String TITLE = rs.getString("TITLE");
       String AUTHOR = rs.getString("AUTHOR");
       String DESCRIPTIONFIELD = rs.getString("DESCRIPTION_FIELD");
	   String RANKING = rs.getString("RANKING");
            String BOOKID = rs.getString("BOOK_ID");

           int stars=Integer.parseInt(RANKING);
           String desc=DESCRIPTIONFIELD.substring(0, 59)+"...";

          if (counter%4==0)

               out.println("</tr><tr><td style=\"padding-left:30\" width=\"200\" >");

           else
              out.println("<td width=\"200\" >");


        out.println("<table width=\"200\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" style=\"padding-top:10px;\"><img src=\"images/cover.gif\" width=\"120\" height=\"160\" alt=\"cov\"></td>"+"</tr><tr>"+"<td align=\"center\" class=\"title\"><a class=\"buttonn\" href=\"book.jsp?id="+BOOKID+"\" >'"+TITLE+"'</a></td>"+"</tr>"+"<tr>"+"<td align=\"center\" class=\"author\">"+AUTHOR+"</td></tr><tr><td align=\"center\" class=\"text\">&#8364;"+PRICE+"</td></tr><tr><td align=\"center\" class=\"text2\" style=\"font-weight:normal;padding-left:10px;padding-right:10px;\">"+desc+"</td></tr><tr valign=\"top\"><td height=\"21\" align=\"center\">");

        int i;
        for( i=0; i<stars;i++)
            out.println("<img src=\"images/star.gif\" width=\"20\" height=\"21\" alt=\"s\">");
        for(int j=0; j<5-i;j++)
            out.println("<img src=\"images/starempty.gif\" width=\"20\" height=\"21\" alt=\"s\">");

                        out.println("</td></tr></table></td>");

    counter++;
    }
                conn.close();
} catch (Exception e) {
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