<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Error</title>
	<link rel="stylesheet" href="../css/estilos.css">
	<%-- COMPLETAR --%>
	<script src="../cgi-bin/jscgi"></script><!--añadido  -->
	  <jsp:include page="../cabecera.jsp" />
	


</head>
<body>
	<%-- COMPLETAR --%>


	<div id="contenedor">
	
		<%-- MODIFICAR --%>
		<h1 class="warning">${mensaje}</h1>


		<a href="${volverURL}">Volver</a>

	</div>
	<%-- COMPLETAR --%>

<%@include file="../pie.jsp"%>
</body>
</html>