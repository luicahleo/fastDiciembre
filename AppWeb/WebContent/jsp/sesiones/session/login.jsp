<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.Usuario"%>
<%@page import="fast.GestorUsuarios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! 
	//Creamos el gestor de usuarios, que guarda información de todos
	// los usuarios autorizados
	GestorUsuarios gestorUsu = new GestorUsuarios(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<link href="restringido.css" rel="stylesheet" type="text/css"/>
<script src="restringido.js"></script>

</head>
<body>
<% 
String paramUsuario = request.getParameter("usuario");
String paramClave = request.getParameter("clave");
Usuario usuario = gestorUsu.getUsuario(paramUsuario, paramClave);

if ( usuario != null) { 
	//Guardamos los datos del usuario en la sesion con nombre "usuario"
	session.setAttribute("usuario", usuario);
	//Indicamos que el usuario está autorizado
	session.setAttribute("autorizado", true);
%>

	<div id="loginExito">
		<h2>Datos de usuario correctos</h2>
		<p>Puede acceder a la página restringida.</p>
		<p>
			<a href="soloAutorizados.jsp">Continuar</a>
		</p>

		<br />
	</div>

	<% } else { %>

	<div id="loginError">
		<h2>Datos incorrectos</h2>
		<p>No puede acceder a la página restringida.</p>
		<p>
			<a href="inicio.jsp">Volver al inicio</a>
		</p>
		<br />
	</div>

	<% } %>
</body>
</html>