<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String titulo = "JavaBeans: inicialización de propiedades con parámetros de la petición (2)"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<p>Si los nombres de los parámetros de la petición HTTP coinciden con 
los nombres de las propiedades de un Bean, es posible inicializar simultáneamente 
todas estas propiedades con los valores de los parámetros de la petición con la siguiente
línea:</p>
<pre><code>&lt;jsp:setProperty property="*" name="personaActual"/&gt;</code></pre>

<jsp:useBean id="personaActual" class="fast.Persona" />
<%-- Establecemos todas las propiedades del bean cuyo nombre coincidan con los 
	nombres de los parámetros de la petición HTTP: property="*" --%>
<jsp:setProperty property="*" name="personaActual"/>
<p>Valores de las propiedades del bean:</p>
<ul>
<li><strong>nombre: </strong><jsp:getProperty property="nombre" name="personaActual"/></li>
<li><strong>apellidos: </strong><jsp:getProperty property="apellidos" name="personaActual"/></li>
<li><strong>edad: </strong><jsp:getProperty property="edad" name="personaActual"/></li>
<li><strong>nombreCompleto: </strong><jsp:getProperty property="nombreCompleto" name="personaActual"/></li>
</ul>
<hr />
<p>
<a href="../index.jsp">Volver al índice</a>
</p>
</body>
</html>