<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Nuevo destino</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Nuevo destino</h1>
<p>Se crea un atributo:</p>
<ul>
	<li>Atributo <code>fast.uno</code>=<%=pageContext.findAttribute("fast.uno") %></li>
	<li>Atributo <code>fast.dos</code>=<%=pageContext.findAttribute("fast.dos") %></li>
	<li>Se crea <code>fast.tres</code> con valor <code>VALOR_TRES</code> y ámbito PAGE</li>
	<% pageContext.setAttribute("fast.tres", "VALOR_TRES", PageContext.PAGE_SCOPE); %>
</ul>
<p>Incluimos el fichero <code>incluido.jsp</code> (observe los valores de los atributos):</p>
<hr />
<% pageContext.include("incluido.jsp"); %>
<hr />
</body>
</html>