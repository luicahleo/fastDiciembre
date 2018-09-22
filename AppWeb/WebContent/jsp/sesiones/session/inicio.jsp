<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Inicio Página Acceso Restringido</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<link href="restringido.css" rel="stylesheet" type="text/css"/>
<script src="restringido.js"></script>

</head>
<body>

<div id="acceso">
<h2>Acceso Restringido</h2>
<p> Está a punto de entrar en una página restringida a solo personal autorizado.</p>
<p> Introduzca datos de usuario: </p>
<form name="login" action="login.jsp" method="post" accept-charset="utf-8"
	onsubmit="return validarForm();">
		<label for="usuario">Usuario</label>
		<input type="text" name="usuario" />
		<label for="clave">Contraseña</label>
		<input type="password" name="clave" />
		<input type="submit" value="Entrar" />
</form>
<br />
<span id="verPistas" onclick="mostrarPistas()">
+</span>
</div>
<div id="pistas">
		<p>Están configurados los siguientes usuarios/claves:</p>
		<ul>
			<li>dit/dit</li>
			<li>fast/clave</li>
			<li>admin/root</li>
			<li>usuario/clave</li>
		</ul>
		<p>Accesos directos a páginas restringidas (puede probar como se
			comportan cuando no tiene permiso para acceder a ellas):</p>
		<ul>
			<li><a href="soloAutorizados.jsp">Página 1 (redirige)</a></li>
			<li><a href="soloAutorizados2.jsp">Página 2 (da error)</a></li>
		</ul>
	</div>
</body>
</html>