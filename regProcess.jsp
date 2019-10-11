<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%!

%>
<jsp:useBean id="formHandler" class="test.FormBean" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<%
   if (formHandler.validate()) {
%>
    <jsp:forward page="regSuccess.jsp"/>
<%
   }  else {
%>
    <jsp:forward page="regRetry.jsp"/>
<%
   }
%>

