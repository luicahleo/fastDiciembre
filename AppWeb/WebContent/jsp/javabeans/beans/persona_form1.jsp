<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Formulario datos de Persona</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<style>
	#mensajeError {
		color: red;
	}
</style>
<script>
	function validarSiNumero() {
		esNumero=true;
		mensajeError=document.getElementById("mensajeError");
		edad=document.getElementById("campoEdad").value;
		if (!/^-?([0-9])*$/.test(edad)) {
			 mensajeError.innerHTML=
				"El valor " + edad + " no es un número";
			esNumero=false;
		} else {
			mensajeError.innerHTML=
				"";
		}
		return esNumero;
	}
</script>
</head>
<body>
<h1>Formulario de datos de persona</h1>
<form action="bean_ini_param1.jsp" onsubmit="return validarSiNumero();">
<p>
<label for="nombre">Nombre:</label>
<input type="text" name="campoNombre"/>
</p>
<p>
<label for="apellidos">Apellidos:</label>
<input type="text" name="campoApellidos"/>
</p>
<p>
<label for="edad">Edad:</label>
<input type="text" name="campoEdad" value="0" id="campoEdad" onchange="validarSiNumero();" />
</p>
<input type="submit" value="Enviar"/>
</form>
<p id="mensajeError"></p>
<hr />
<p>
<a href="../index.jsp">Volver al índice</a>
</p>
</body>
</html>