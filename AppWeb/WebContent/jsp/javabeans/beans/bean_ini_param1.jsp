<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String titulo = "JavaBeans: inicialización de propiedades con parámetros de la petición (1)"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<p>Para inicializar una propiedad de un bean con el valor de un parámetro 
de la petición HTTP se utiliza una línea de este tipo:</p>
<pre><code>&lt;jsp:setProperty property="nombrePropiedad" name="nombreBean" param="nombreParámetro"/&gt;</code></pre>
<p>En vez de usar el atributo <code>value</code> se usa el atributo <code>param</code>.</p>
<jsp:useBean id="personaActual" class="fast.Persona" />
<jsp:setProperty property="nombre" name="personaActual" param="campoNombre"/>
<jsp:setProperty property="apellidos" name="personaActual" param="campoApellidos"/>
<jsp:setProperty property="edad" name="personaActual" param="campoEdad"/>
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