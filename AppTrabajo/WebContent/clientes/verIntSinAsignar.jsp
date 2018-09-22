<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	
	<meta charset="UTF-8">
	<title>Equipos</title>
	<link rel="stylesheet" href="../css/estilos.css">
	<script type="text/javascript" src="js/funTablasURL.js"></script>
	<script type="text/javascript" src="js/funCargaTablas.js"></script>
	<%-- COMPLETAR --%>
	<script src="../cgi-bin/jscgi"></script>
	
</head>
<body>
	<%-- COMPLETAR --%> <!-- deja EXACTAMENTE 2 lineas vacias -->
	<jsp:include page="../cabecera.jsp" /> <!-- O aqui o en la cabecera -->
	
	<%--final de lineas vacias --%>
	<div id="contenedor">
		<h1>Interfaces sin Asignar</h1>
		<h2 class="warning">Tabla de Interfaces</h2>
		<%-- MODIFICAR --%>
		<table class="interfaces" id="verIntSinAsignar">
		</table>
	</div>
	
	<%-- COMPLETAR --%>
	<%@include file="../pie.jsp"%>

</body>
</html>