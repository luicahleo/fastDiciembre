<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Formulario JSP</title>
</head>
<body>
  <p>Valor de parametro1: <%= request.getParameter("parametro1") %> </p><br/> 
  <p>Valor de parametro2: <%= request.getParameter("parametro2") %> </p><br/> 
  <p>Valor de parametro clave:  <%= request.getParameter("clave") %> </p><br/> 
  <% 
   String[] seleccion= request.getParameterValues("selectMultiple"); 
   if (seleccion!=null)
   	for (int i=0;i<seleccion.length;i++) 
   	{ 
   	%> 
   	<%= seleccion[i] %>
   	<br/> 
   	<% 
   	} 
  	%> 
</body>
</html>

