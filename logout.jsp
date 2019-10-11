<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%

session.setAttribute( "ID", null);
    session.setAttribute("CART",null);
session.setAttribute( "NICKNAME", null);

%>

<jsp:forward page="index.jsp"/>  