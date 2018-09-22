<!--////////////-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../cabecera.jsp"%>

<!--//////////////////////-->
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Usuario</title>
<link href="../css/estilos.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/funUsu.js"></script>

<script src="../cgi-bin/jscgi"></script><!-- Added -->

</head>
<body id="contenedor">
<h1>Creación/modificación de usuario</h1>
<h2 class="entrada">Introduzca usuario y contraseña</h2>
<p>El usuario debe contener un máximo de <span class="warning entrada">11 caracteres</span></p>
<p>La contraseña debe cumplir las siguientes condiciones:</p>

<ol>
<li>debe tener una longitud mínima de 6 caracteres</li>
<li>debe tener una longitud máxima de 10 caracteres</li>
<li>debe contener al menos dos caracteres numéricos</li>
<li>debe contener al menos dos caracteres en mayúsculas</li>
<li>debe contener al menos dos caracteres en minúsculas</li>
<li>no debe contener el nombre de usuario</li>
</ol>
<form name="formUsu" id="formUsu" action = "modificarUsuario" method="post">
<p><input name="usu" id="usu" type="text" maxlength="11" required><label for="contra1">Usuario</label></p>
<p><input name="contra1" id="contra1" type="password" maxlength="10" required><label for="contra1">Contraseña</label></p>
<p><input name="contra2" id="contra2" type="password" maxlength="10"><label for="contra2">Repetición de la contraseña</label></p>
<p><input type="submit" value="Enviar"><input type="reset" value="Limpiar"></p>
</form>
<%@include file="../pie.jsp"%>
</body>
</html>
