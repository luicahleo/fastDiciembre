<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   // Crear cookies para nombre y apellidos.
   Cookie firstName = new Cookie("first_name", request.getParameter("first_name"));
   Cookie lastName = new Cookie("last_name", request.getParameter("last_name"));

   // Ajustasmo el tiempo de expiracion a 24h para ambas cookies:
   firstName.setMaxAge(60*60*24); 
   lastName.setMaxAge(60*60*24); 

   // Las anyadimos a la respuesta
   response.addCookie( firstName );
   response.addCookie( lastName );
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Creacion de Cookies</title>
</head>

<body>
<h1>Creacion de Cookies</h1>
<ul>
<li><p><b>Nombre:</b>
   <%= request.getParameter("first_name") %>
</p></li>
<li><p><b>Apellidos:</b>
   <%= request.getParameter("last_name") %>
</p></li>
</ul>
</body>
</html>
