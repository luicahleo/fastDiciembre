<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../cabecera.jsp"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Menú clientes</title>
	<%-- COMPLETAR Modificado --%>
	<link href="css/estilos.css" rel="stylesheet" type="text/css" /><!--CSS added  -->
	<script src="../cgi-bin/jscgi"></script><!--CGI added  -->



</head>
<body>
	<%-- COMPLETAR Algo modifiqué--%>


	<div id="contenedor">
		<h1>Menú clientes</h1>
		<ul>
			<li><a href="clientes/verEquipos.jsp">Ver equipos</a></li>
			<li><a href="clientes/verIntSinAsignar.jsp"  >Ver interfaces sin asignar</a></li>
			<li><a href="clientes/verCrearInterfaces.jsp">Ver/crear interfaces</a></li>
		</ul>
	</div>

	<%-- COMPLETAR --%>
<%@include file="../pie.jsp"%>

</body>
</html>
