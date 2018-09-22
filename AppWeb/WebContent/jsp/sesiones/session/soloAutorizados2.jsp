<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
//Comprobación de usuarios autorizados
 Usuario usu = null;
 if ( session.getAttribute("autorizado") == null ) {
	 response.sendError(HttpServletResponse.SC_FORBIDDEN, "¡Pero qué te has creído!");
	 //Termina aquí mostrando un error
 } else {
	 usu = (Usuario) session.getAttribute("usuario");
	 %>
 
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Pagina restringida 2</title>
	<link href="../estilo.css" rel="stylesheet" type="text/css" />
	<link href="restringido.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div id="cabecera">
	<form name="login" action="logout.jsp" method="post" accept-charset="utf-8">
		<input type="submit" value="Cerrar sesión" />
	</form>
	<h1>Otra página <br />de acceso restringido 2</h1>
	<hr />
	</div>
	<div id="cuerpo">
	<h2>Repito los datos del usuario: </h2>
	<p>Nombre real: <%= usu.getNombreReal() %></p>
	<p>Usuario: <%= usu.getUsuario() %></p>
	<p>No tengo nada más que decir :-)</p>
	</div>
	<p><a href="soloAutorizados.jsp">Ir a página 1</a></p>
	</body>
	</html>
<%
 } //Fin del else
%>
