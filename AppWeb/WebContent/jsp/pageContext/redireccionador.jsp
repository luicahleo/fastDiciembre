<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Redireccionar</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Redireccionador</h1>
<p>Se crean dos atributos:</p>
<ul>
	<li><code>fast.uno</code> con valor <code>VALOR_UNO</code> y ámbito PAGE (válido sólo para este
	fichero jsp)</li>
	<% pageContext.setAttribute("fast.uno", "VALOR_UNO", PageContext.PAGE_SCOPE); %>
	<li><code>fast.dos</code> con valor <code>VALOR_DOS</code> y ámbito REQUEST (válido también para 
	ficheros incluidos y destinos de reenvío, porque todos procesan la misma petición)</li>
	<% pageContext.setAttribute("fast.dos", "VALOR_DOS", PageContext.REQUEST_SCOPE); %>
</ul>
<%	
	//Ejemplo de uso de pageContext para acceder a otros objetos implícitos
	if ( pageContext.getRequest().getParameter("redireccionar")!=null) {
		pageContext.forward("nuevodestino.jsp");
		//Tras la redirección no se debería hacer nada más
	} else {
%>
<p>Incluimos el fichero <code>incluido.jsp</code> (observe los valores de los atributos):</p>
<hr />
<% pageContext.include("incluido.jsp"); %>
<hr />
<p>Si esta página se llama con el parámetro "redireccionar", se hace una redirección
usando la función <code>forward()</code>. Pulse el siguiente botón para recargar esta 
página con ese parámetro</p>
<form action="" method="get">
	<input type="submit" value="Recargar página con redirección" name="redireccionar"/>
</form>
</body>
</html>
<% } //Fin del else%>