<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("usuario") != null)//Si no hay usuario redirige a menu que llama a un servlet
		response.sendRedirect("menu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trabajo 17/18 - FAST</title>
<link rel="stylesheet" type="text/css" href="css/estilos.css" />
<script src="js/conmutaAcceso.js"></script>
<script src="cgi-bin/jscgi"></script>
</head>
<body>
	<noscript>
		<p>
			<span class="acceso"> Esta p&aacute;gina necesita JavaScript
				para funcionar </span>
		</p>
	</noscript>
	<div id="bienvenida">
		<h1>Bienvenido</h1>
		<h1>Gestión de IPs de interfaces - FAST</h1>
		<h3>Acceda con su usuario y clave</h3>
		<button id="botAcceso">Acceder</button>

	</div>


	<div id="formacceso">
		<form action="menu" method="post">
			<p>
				<label for="usu">Usuario:</label><br /> <input type="text"
					name="usu" size="11" id="usu" />
			</p>
			<p>
				<label for="contra">Clave:</label> <br /> <input type="password"
					name="contra" size="10" id="contra" />
			</p>
			<p>
				<input class="boton" type="submit" name="entrar" value="Entrar" />
				&nbsp;&nbsp; <input class="boton" type="button" id="cancelar"
					value="Cancelar" />
			</p>
		</form>
	</div>

	<%@include file="pie.jsp"%>
</body>
</html>