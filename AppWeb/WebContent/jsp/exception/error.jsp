<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Error</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<style>
	.rojo {
		color: red;
	}
	#info {
		display: none;
	}
	#mas {
		font-size: 0.75em;
		border: thin solid black;
		cursor: pointer;
		background-color: yellow;
	} 
</style>
<script>
	//Función que muestra la sección "info" con la pila de llamadas de la excepción
	function muestraInfo() {
		document.getElementById("info").style.display="block";
		//Se oculta el elemento "mas" para que no se pueda volver a hacer click.
		document.getElementById("mas").style.display="none";
	}
</script>
</head>
<body>
<h1>Se ha producido un error:</h1>
<% 
//Cuando se produce una excepción, el código de error HTML devuelto es el 500
//Esto se puede comprobar usando el objeto implícito response.
if(response.getStatus() == 500){ %>
<p class="rojo">Excepción detectada: <%=exception.getMessage() %>
<em id="mas" onclick="muestraInfo();" title="Haga click para mostrar más información">Más información</em>
</p>
<div id="info">
	<pre><code>
	<%	//Impresión de la pila de llamadas
		exception.printStackTrace(new java.io.PrintWriter(out)); %>
	</code></pre>
</div> 
<%}else {
//Mostramos el error HTML %>
<p class="rojo">Error HTML: <%=response.getStatus() %></p>
<% }

//Si en la cabecera de la petición viene información de la página origen (referer), volvemos a esa
// página, de lo contrario al indice general
if (request.getHeader("Referer")!=null) {
	out.print("<p><a href='"+request.getHeader("Referer")+"'>Volver</a></p>");
} else {
	out.print("<p><a href='../index.jsp'>Página principal</a></p>");
}
%>
</body>
</html>