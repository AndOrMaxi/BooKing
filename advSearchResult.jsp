<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Advanced search results</title>

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

<table  border="0" align="center" cellspacing="0" cellpadding="0"><tr>
            <td style="padding-left:30" width=\"200\" >



<%

String title = request.getParameter("title");
String author = request.getParameter("author");
String publisher = request.getParameter("publisher");
String isbn = request.getParameter("isbn");

String ISBN =                   "select * from BOOK where ISBN like '"+isbn+"'";
String PUBLISHER =              "select * from BOOK where PUBLISHER like '%"+publisher+"%'";
String AUTHOR =                 "select * from BOOK where AUTHOR like '%"+author+"%'";
String TITLE =                  "select * from BOOK where  TITLE like '%"+title+"%'";
String AUTHOR_PUBLISHER =       "select * from BOOK where AUTHOR like '%"+author+"%' and PUBLISHER like '%"+publisher+"%'" ;
String TITLE_PUBLISHER =        "select * from BOOK where TITLE like '%"+title+"%' and PUBLISHER like '%"+publisher+"%'" ;
String TITLE_AUTHOR =           "select * from BOOK where TITLE like '%"+title+"%' and AUTHOR like '%"+author+"%'" ;
String TITLE_AUTHOR_PUBLISHER = "select * from BOOK where TITLE like '%"+title+"%' and AUTHOR like '%"+author+"%' and PUBLISHER like '%"+publisher+"%'" ;

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
Connection conn5 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn6 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn7 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn8 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn9 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn10 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn11 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn12 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn13 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn14 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn15 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Connection conn16 = DriverManager.getConnection ("jdbc:odbc:Test","p3070170","Eddy01411");
Statement stmt1 = conn.createStatement();
Statement stmt2 = conn2.createStatement();
Statement stmt3 = conn3.createStatement();
Statement stmt4 = conn4.createStatement();
Statement stmt5 = conn5.createStatement();
Statement stmt6 = conn6.createStatement();
Statement stmt7 = conn7.createStatement();
Statement stmt8 = conn8.createStatement();
Statement stmt9 = conn9.createStatement();
Statement stmt10 = conn10.createStatement();
Statement stmt11 = conn11.createStatement();
Statement stmt12 = conn12.createStatement();
Statement stmt13 = conn13.createStatement();
Statement stmt14 = conn14.createStatement();
Statement stmt15 = conn15.createStatement();
Statement stmt16 = conn16.createStatement();
ResultSet rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs9,rs10,rs11,rs12,rs13,rs14,rs15,rs16;
boolean bool = false;


if(title == ""){
    if(author == ""){
        if(publisher == ""){
            if(isbn == ""){
                out.println("<table align=\"center\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>"+
                "<td style=\"padding-left:30\"><br><br>");


              out.println("<form action=\"advSearchResult.jsp\" method=post>");
              out.println("<table class=\"text3\"  cellpadding=0 cellspacing=0 border=\"0\"  align =\"center\" bgcolor=\"#f2ecf8\">");
              out.println("<th colspan=2 valign=\"top\" align =\"center\"> ");
              out.println("<font size=3>Advanced Search</font><br><font size=2 color = \"red\">Fill at least one field.</font></th><tr><td  width=\"100\">");
              out.println("<b>Book Title:</b>&nbsp;<td width=\"100\"><input type=\"text\" name=\"title\" value=\"\" size=40 maxlength=20><br></tr><tr><td>");
              out.println("<b>Author:</b>&nbsp;<td><input type=\"text\" name=\"author\" value=\"\" size=40 maxlength=20><br></tr>");
              out.println("<tr><td><b>Publisher:</b>&nbsp;<td><input type=\"text\" name=\"publisher\" value=\"\" size=40 maxlength=20><br></tr> ");
              out.println("<tr><td><b>ISBN 10:</b>&nbsp; <td><input type=\"text\" name=\"isbn\" size=40 value=\"\" maxlength=20><br></tr>");
              out.println("<tr><td  align=center colspan=2><input type=\"image\" src=\"images/search.gif\" alt=\"Submit\" value=\"Submit\"> </tr> </form> ");
              bool = true;
            }else{
              rs1 = stmt1.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs1.next()){
              String ID = rs1.getString("BOOK_ID");
   String PRICE = rs1.getString("PRICE");
  String PUBLISHE = rs1.getString("PUBLISHER");
   String YEAR = rs1.getString("PUBLICATION_YEAR");
       String CATEGORY = rs1.getString("CATEGORY");
      String AUTHO = rs1.getString("AUTHOR");
      String TITL= rs1.getString("TITLE");
     String COVER = rs1.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
        }else{
            if(isbn == ""){
              rs2 = stmt2.executeQuery(PUBLISHER);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");

              while(rs2.next()){
                String ID = rs2.getString("BOOK_ID");
   String PRICE = rs2.getString("PRICE");
  String PUBLISHE = rs2.getString("PUBLISHER");
   String YEAR = rs2.getString("PUBLICATION_YEAR");
       String CATEGORY = rs2.getString("CATEGORY");
      String AUTHO = rs2.getString("AUTHOR");
      String TITL= rs2.getString("TITLE");
     String COVER = rs2.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");
bool = true;
              }
            }else{
              rs3 = stmt3.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs3.next()){

              String ID = rs3.getString("BOOK_ID");
   String PRICE = rs3.getString("PRICE");
  String PUBLISHE = rs3.getString("PUBLISHER");
   String YEAR = rs3.getString("PUBLICATION_YEAR");
       String CATEGORY = rs3.getString("CATEGORY");
      String AUTHO = rs3.getString("AUTHOR");
      String TITL= rs3.getString("TITLE");
     String COVER = rs3.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
        }
    }else{
        if(publisher == ""){
            if(isbn == ""){
              rs4 = stmt4.executeQuery(AUTHOR);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              while(rs4.next()){

              String ID = rs4.getString("BOOK_ID");
   String PRICE = rs4.getString("PRICE");
  String PUBLISHE = rs4.getString("PUBLISHER");
   String YEAR = rs4.getString("PUBLICATION_YEAR");
       String CATEGORY = rs4.getString("CATEGORY");
      String AUTHO = rs4.getString("AUTHOR");
      String TITL= rs4.getString("TITLE");
     String COVER = rs4.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");
bool = true;
              }
            }else{
              rs5 = stmt5.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs5.next()){
              String ID = rs5.getString("BOOK_ID");
   String PRICE = rs5.getString("PRICE");
  String PUBLISHE = rs5.getString("PUBLISHER");
   String YEAR = rs5.getString("PUBLICATION_YEAR");
       String CATEGORY = rs5.getString("CATEGORY");
      String AUTHO = rs5.getString("AUTHOR");
      String TITL= rs5.getString("TITLE");
     String COVER = rs5.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
        }else{
            if(isbn == ""){
              rs6 = stmt6.executeQuery(AUTHOR_PUBLISHER);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              while(rs6.next()){
              String ID = rs6.getString("BOOK_ID");
   String PRICE = rs6.getString("PRICE");
  String PUBLISHE = rs6.getString("PUBLISHER");
   String YEAR = rs6.getString("PUBLICATION_YEAR");
       String CATEGORY = rs6.getString("CATEGORY");
      String AUTHO = rs6.getString("AUTHOR");
      String TITL= rs6.getString("TITLE");
     String COVER = rs6.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");
bool = true;
              }
            }else{
              rs7 = stmt7.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs7.next()){
              String ID = rs7.getString("BOOK_ID");
   String PRICE = rs7.getString("PRICE");
  String PUBLISHE = rs7.getString("PUBLISHER");
   String YEAR = rs7.getString("PUBLICATION_YEAR");
       String CATEGORY = rs7.getString("CATEGORY");
      String AUTHO = rs7.getString("AUTHOR");
      String TITL= rs7.getString("TITLE");
     String COVER = rs7.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
        }
    }
}else {
    if(author == ""){
        if(publisher == ""){
            if(isbn == ""){

              rs8 = stmt8.executeQuery(TITLE);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              while(rs8.next()){

              String ID = rs8.getString("BOOK_ID");
   String PRICE = rs8.getString("PRICE");
  String PUBLISHE = rs8.getString("PUBLISHER");
   String YEAR = rs8.getString("PUBLICATION_YEAR");
       String CATEGORY = rs8.getString("CATEGORY");
      String AUTHO = rs8.getString("AUTHOR");
      String TITL= rs8.getString("TITLE");
     String COVER = rs8.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");
bool = true;}
            }
            else{
              rs9 = stmt9.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs9.next()){
              String ID = rs9.getString("BOOK_ID");
   String PRICE = rs9.getString("PRICE");
  String PUBLISHE = rs9.getString("PUBLISHER");
   String YEAR = rs9.getString("PUBLICATION_YEAR");
       String CATEGORY = rs9.getString("CATEGORY");
      String AUTHO = rs9.getString("AUTHOR");
      String TITL= rs9.getString("TITLE");
     String COVER = rs9.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
        }
        else{
            if(isbn == ""){
              rs10 = stmt10.executeQuery(TITLE_PUBLISHER);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              while(rs10.next()){
              String ID = rs10.getString("BOOK_ID");
   String PRICE = rs10.getString("PRICE");
  String PUBLISHE = rs10.getString("PUBLISHER");
   String YEAR = rs10.getString("PUBLICATION_YEAR");
       String CATEGORY = rs10.getString("CATEGORY");
      String AUTHO = rs10.getString("AUTHOR");
      String TITL= rs10.getString("TITLE");
     String COVER = rs10.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");
bool = true;
              }
            }
            else{
              rs11 = stmt11.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs11.next()){
              String ID = rs11.getString("BOOK_ID");
   String PRICE = rs11.getString("PRICE");
  String PUBLISHE = rs11.getString("PUBLISHER");
   String YEAR = rs11.getString("PUBLICATION_YEAR");
       String CATEGORY = rs11.getString("CATEGORY");
      String AUTHO = rs11.getString("AUTHOR");
      String TITL= rs11.getString("TITLE");
     String COVER = rs11.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }

        }
    }else{
        if(publisher == ""){
            if(isbn == ""){
              rs12 = stmt12.executeQuery(TITLE_AUTHOR);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs12.next()){
              String ID = rs12.getString("BOOK_ID");
   String PRICE = rs12.getString("PRICE");
  String PUBLISHE = rs12.getString("PUBLISHER");
   String YEAR = rs12.getString("PUBLICATION_YEAR");
       String CATEGORY = rs12.getString("CATEGORY");
      String AUTHO = rs12.getString("AUTHOR");
      String TITL= rs12.getString("TITLE");
     String COVER = rs12.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
            else{
              rs13 = stmt13.executeQuery(ISBN);
              if(rs13.next()){

              String ID = rs13.getString("BOOK_ID");
   String PRICE = rs13.getString("PRICE");
  String PUBLISHE = rs13.getString("PUBLISHER");
   String YEAR = rs13.getString("PUBLICATION_YEAR");
       String CATEGORY = rs13.getString("CATEGORY");
      String AUTHO = rs13.getString("AUTHOR");
      String TITL= rs13.getString("TITLE");
     String COVER = rs13.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
bool = true;
              }
            }
        }
        else{
            if(isbn == ""){
              rs14 = stmt14.executeQuery(TITLE_AUTHOR_PUBLISHER);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              while(rs14.next()){
              String ID = rs14.getString("BOOK_ID");
   String PRICE = rs14.getString("PRICE");
  String PUBLISHE = rs14.getString("PUBLISHER");
   String YEAR = rs14.getString("PUBLICATION_YEAR");
       String CATEGORY = rs14.getString("CATEGORY");
      String AUTHO = rs14.getString("AUTHOR");
      String TITL= rs14.getString("TITLE");
     String COVER = rs14.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");
out.println("<tr>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+"<td><hr></td>"+" </tr>");
                bool = true;
              }
            }
            else{
              rs15 = stmt15.executeQuery(ISBN);
              out.println("<table align=\"left\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
              out.println("<tr class=\"bold2\"><td></td><td>Title</td><td>Author</td><td>Publisher</td><td>Year</td><td>Category</td><td>Price</td></tr>");
              if(rs15.next()){
              String ID = rs15.getString("BOOK_ID");
   String PRICE = rs15.getString("PRICE");
  String PUBLISHE = rs15.getString("PUBLISHER");
   String YEAR = rs15.getString("PUBLICATION_YEAR");
       String CATEGORY = rs15.getString("CATEGORY");
      String AUTHO = rs15.getString("AUTHOR");
      String TITL= rs15.getString("TITLE");
     String COVER = rs15.getString("COVER");
      COVER= COVER.substring(1,COVER.length());
out.println("<tr class=\"bold\"><td width=\"50\" align=\"left\"><a  href=\"book.jsp?id="+ID+"\" ><img src=\""+COVER+"\" width=\"30\" height=\"40\" alt=\"cov\"></a></td><td width=\"200\" align=\"left\"><a class=\"buttonn\" href=\"book.jsp?id="+ID+"\" >"+TITL+"</a></td>  <td width=\"150\" align=\"left\">"+AUTHO+"</td>    <td width=\"150\" align=\"left\">"+PUBLISHE+"</td>    <td width=\"50\" align=\"left\">"+YEAR+"</td>    <td width=\"100\" align=\"left\">"+CATEGORY+"</td> <td width=\"50\" align=\"left\">"+PRICE+"</td> </tr>");

              bool = true;
              }
            }
        }
    }
}

if(!bool){
    out.println("Your search did not match any products.");
}



/*

rs2 = stmt2.executeQuery("SELECT * FROM CUSTOMER WHERE NICKNAME = '"+username+"' and PASSWD = '"+pass+"'");



if(rs2.next()){
id = rs2.getString("CUSTOMER_ID");

}
else{passwd = false;}


if(rs1.next()){
String nam = rs1.getString("NAME");
}
else{nick = false;}


if(!nick){
   out.println("<form action=\"loginResault.jsp\" method=post><center>");
   out.println("<table  cellpadding=5 cellspacing=0 border=\"1\"  bgcolor=\"white\">");
   out.println("<th bgcolor=\"lightblue\" colspan=2 valign=\"top\"> <font size=3 color = \"red\">Uncorrect Username</font>");
   out.println("<br></th><tr><td valign=top><b>Username:</b>&nbsp;<td><input type=\"text\" name=\"nick\" value=\"\" size=40 maxlength=20><br>");
   out.println("</tr><tr><td><b>Password:</b>&nbsp; <td><input type=\"password\" name=\"password\"  value=\"\" size=42 maxlength=20><br>");
   out.println("</tr><tr bgcolor=\"lightblue\"><td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   out.println("<input type=\"submit\" value=\"Submit\"> </tr></table></center></form>");
}else if (!passwd){
   out.println("<form action=\"loginResault.jsp\" method=post><center>");
   out.println("<table  cellpadding=5 cellspacing=0 border=\"1\"  bgcolor=\"white\">");
   out.println("<th bgcolor=\"lightblue\" colspan=2 valign=\"top\"> <font size=3 color = \"red\">Uncorrect Password</font>");
   out.println("<br></th><tr><td valign=top><b>Username:</b>&nbsp;<td><input type=\"text\" name=\"nick\" value=\"\" size=40 maxlength=20><br>");
   out.println("</tr><tr><td><b>Password:</b>&nbsp; <td><input type=\"password\" name=\"password\"  value=\"\" size=42 maxlength=20><br>");
   out.println("</tr><tr bgcolor=\"lightblue\"><td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   out.println("<input type=\"submit\" value=\"Submit\"> </tr></table></center></form>");
}
* */


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

</body>
</html>