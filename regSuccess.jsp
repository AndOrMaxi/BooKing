<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<jsp:useBean id="formHandler" class="test.FormBean" scope="request"/>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration Succesfull</title>

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

    <table align="left"  border="0" cellspacing="0" cellpadding="0"><tr>
            <td style="padding-left:30" width=\"200\" >

    <%

String name = request.getParameter("firstName");
String lastname = request.getParameter("lastName");
String nick = request.getParameter("nickName");
String email = request.getParameter("email");
String pass = request.getParameter("password1");
String r_pass = request.getParameter("password2");
String tel_number= request.getParameter("telephone");
String day = request.getParameter("birthday");
String month = request.getParameter("birthmonth");
String year = request.getParameter("birthyear");
String birthday = year.concat("-").concat(month).concat("-").concat(day);

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
Statement stmt = conn.createStatement();

ResultSet rs;
int review = 0, id;


rs = stmt.executeQuery("SELECT max(CUSTOMER_ID) as id FROM CUSTOMER");
rs.next();
id= rs.getInt("id");
id++;

String sql1="INSERT INTO CUSTOMER(CUSTOMER_ID, NAME, SURNAME, NICKNAME, PASSWD, EMAIL, REVIEWS_NUMBER, TELEPHONE_NUMBER, BIRTHDAY_DATE) VALUES" + " (" + id + ", '" + name + "', '" + lastname + "', '" + nick + "', '" + pass + "', '" + email + "',  " + review + ", '" + tel_number + "', '" + birthday +"')";
stmt.executeUpdate(sql1);

conn.close();
}
catch (Exception e)
{
out.println( "<h2>Exception: "+e.getMessage()+"</h2>" );
}

%>

   <center>
<table cellpadding=0 cellspacing=10 border="0" align="center" bgcolor="#f2ecf8">
<th  colspan=2><center>
<font size=4>Registration Successfull</font></center><br>
</th>
<tr>
<td valign=top>
<b>First Name</b>
<br>
<jsp:getProperty name="formHandler" property="firstName"/>
</td>
<td valign=top>
<b>Last Name</b>
<br>
<jsp:getProperty name="formHandler" property="lastName"/>
</td>
</tr>
<tr>
<td valign=top>
<b>E-Mail</b>
<br>
<jsp:getProperty name="formHandler" property="email"/>
<br></td>
<td valign=top>
<b>Telephone number</b>
<br>
<jsp:getProperty name="formHandler" property="telephone"/>
</td>
</tr>
<tr>
<td valign=top colspan=2>
<b>Nick name</b>
<br>
<jsp:getProperty name="formHandler" property="nickName"/>
</td>
</tr>
<tr>
<td valign=top>
<b>Date</b>
<% String day1 = request.getParameter("birthday");
String month1 = request.getParameter("birthmonth");
String year1 = request.getParameter("birthyear");
out.println("<td>"+day1+"-"+month1+"-"+year1+"</td>");
%>
</tr>
</table>
</center>
</tr>
</table>
 </tr>
</table>
</body>
</html>