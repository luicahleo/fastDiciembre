<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fast" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ejemplo de uso de la etiqueta test3</title>
<link href="../estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>Ejemplo de uso de la etiqueta &lt;fast:test3></h1>
	<p>Primera utilización</p>
	<fast:test3 nombre="JSESSIONID">
		<p>El valor de la cookie JSESSIONID es: ${cookie.JSESSIONID.value}</p>
	</fast:test3>
</body>
</html>