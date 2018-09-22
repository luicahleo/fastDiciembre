<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Contador de visitas</title>
</head>
<body>

<%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* Primera visita */
       out.println("¡Bienvenido a mi website!");
       hitsCount = 1;
    }else{
       /* Siguientes visitas */
       out.println("¡Bienvenido de nuevo a mi website!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>
<p>Numero total de visitas: <%= hitsCount%></p>
</body>
</html>
