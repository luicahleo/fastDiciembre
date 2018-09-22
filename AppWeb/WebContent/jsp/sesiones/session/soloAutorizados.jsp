<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
//Comprobación de usuarios autorizados
 Boolean autorizado = true;
 Usuario usu = null;
 if ( session.getAttribute("autorizado") == null ) {
	 autorizado = false;
 } else {
	 usu = (Usuario) session.getAttribute("usuario");
 }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Pagina restringida 1</title>
<link href="../estilo.css" rel="stylesheet" type="text/css" />
<link href="restringido.css" rel="stylesheet" type="text/css" />
	<%
	if (!autorizado) { //Redirección en 5 segundos a la página de inicio
	%>
	<meta http-equiv="REFRESH" content="5; url=inicio.jsp" />
	<%
	}
	%>

</head>
<body>
<div id="cabecera">
<form name="login" action="logout.jsp" method="post" accept-charset="utf-8">
	<input type="submit" value="Cerrar sesión" />
</form>
<h1>Bienvenido a la <br />página de acceso restringido 1</h1>
<hr />
</div>
<%
if ( session.getAttribute("autorizado") == null ) {
	%>
	<p>Se ha detectado un acceso no autorizado. No mostramos datos.</p>
	<p>Volviendo al inicio en 5 segundos.</p>
<%	
} else {
%>
<div id="cuerpo">
<h2>Datos del usuario: </h2>
<p>Nombre real: <%= usu.getNombreReal() %></p>
<p>Usuario: <%= usu.getUsuario() %></p>
</div>
<p><a href="soloAutorizados2.jsp">Ir a página 2</a></p>
<% } %>
</body>
</html>

