<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.BeanMinimo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String titulo = "JavaBeans: uso de un bean desde scriptlets"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<p>Un bean desde un scriptlet es como un objeto normal. Para crearlo:<br />
<code>ClaseBean bean = new ClaseBean();</code><br />
Para establecer una propiedad:<br />
<code>bean.setXXX(valor);</code><br />
Para recuperar el valor de una propiedad:<br />
<code>bean.getXXX();</code><br />
</p>
<p>
Esta página crea un objeto de clase fast.BeanMinimo,
 establece su propiedad y luego la utiliza.
</p>
<%
BeanMinimo bean = new BeanMinimo();
bean.setPropiedad("Prueba");
%>
<p>Valores de las propiedades del bean:</p>
<ul>
<li><strong>propiedad: </strong><%=bean.getPropiedad() %></li>
</ul>
<hr />
<p>
<a href="../index.jsp">Volver al índice</a>
</p>
</body>
</html>