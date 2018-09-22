<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.BeanMinimo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String titulo = "JavaBeans: uso de un bean con etiquetas JSP"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<p>Para crear un bean:</p>
<pre><code>&lt;jsp:useBean id="nombre" class="clase" type="tipo" scope="ámbito" /&gt;</code></pre>
<p><code>type</code> solo se usa si se quiere que el bean sea tratado como otra clase o interfaz de la que deriva el bean.<br />
<code>scope</code> es opcional y puede ser <code>page</code> (por defecto), <code>request</code>,
	<code>session</code> y <code>application</code>. <br />
</p>
<p>
Para establecer una propiedad con un valor:</p>
<pre><code>&lt;jsp:setProperty name="nombreBean" property="propiedad" value="valorNuevo"/&gt;</code></pre>
<p>
Para establecer una propiedad con un parámetro de la petición HTTP:</p>
<pre><code>&lt;jsp:setProperty name="nombreBean" property="propiedad" param="nombreParam"/&gt;</code></pre>
<p>
Para recuperar el valor de una propiedad:</p>
<pre><code>&lt;jsp:getProperty name="nombreBean" property="propiedad"/&gt;</code></pre>
<p>
Esta página crea un objeto de clase fast.BeanMinimo,
 establece su propiedad y luego la utiliza.
</p>
<jsp:useBean id="bean" class="fast.BeanMinimo" />
<jsp:setProperty name="bean" property="propiedad" value="Prueba"/>
<p>Valores de las propiedades del bean:</p>
<ul>
<li><strong>propiedad: </strong><jsp:getProperty name="bean" property="propiedad" /></li>
</ul>
<hr />
<p>
<a href="../index.jsp">Volver al índice</a>
</p>
</body>
</html>