<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Página que no usa sesiones</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h2>Página que no usa sesiones</h2>
	<p>Si se desea hacer una página JSP que no hará uso de las sesiones, 
	es suficiente con indicarlo en la directiva <code>page</code> con el atributo
	<code>session</code> del siguiente modo:</p>
	<pre><code>&lt;%@ page session="false"%&gt;</code></pre>
	<p><em>Nota: la directiva <code>page</code> puede incluir más atributos.
	Si el valor del atributo <code>session</code> es <code>true</code> o se omite
	ese atributo, se utilizarán sesiones (valor por defecto).</em></p>
	<p>Con esto, no es posible utilizar el objeto implícito <code>session</code>
	dentro del código. Por ejemplo, si se utilizara en un scriptlet:</p>
	<pre><code>session.getId()</code></pre>
	<p>se generaría una excepción.</p>
	<%
	//Pruebe a descomentar esta línea, usando sesiones y sin usarlas.    
	//out.print(session.getId());  
	%>
</body>
</html>