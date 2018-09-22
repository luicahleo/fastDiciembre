<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fast" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ejemplo de uso de la etiqueta test2</title>
<link href="../estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>Ejemplo de uso de la etiqueta &lt;fast:test2></h1>
	<p>Primera utilización</p>
	<fast:test2 nombre="JSESSIONID">
		<p>El valor de la cookie JSESSIONID es: ${cookie.JSESSIONID.value}</p>
	</fast:test2>
	<p>Segunda utilización</p>
	<fast:test2 nombre="Multiplicar">
		<p>Si multiplico <code>${param.a}</code> * <code>${param.b}</code> obtengo:</p>
		<p class="highlight">${ param.a * param.b }</p>
	</fast:test2>
</body>
</html>