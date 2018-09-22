<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Modificación de atributos de aplicación web</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<style>
table,tr,th,td {
	border-collapse: collapse;
	border: 1px solid grey;
}

#tablaAtributos {
	font-size: 0.75em;
}
</style>
</head>
<body>
<h1>Página que permite modificar los atributos de aplicación web</h1>

	<%
		String mensaje = "Ninguna acción realizada.";
		if (request.getParameter("accion") != null) {

			if ("Borrar".equals(request.getParameter("accion"))) {
				//Borramos	
				if (request.getParameter("nombre") != null
						&& application.getAttribute(request.getParameter("nombre")) != null) {
					application.removeAttribute(request	.getParameter("nombre"));
					mensaje = "Atributo eliminado: "+ request.getParameter("nombre");
				} else {
					mensaje = "Atributo no existe: "+ request.getParameter("nombre");
				}
			} else {
				//Modificamos o creamos si no existe
				application.setAttribute(request.getParameter("nombre"),
						request.getParameter("valor"));
				mensaje = "Atributo creado/modificado: "
						+ request.getParameter("nombre") + " Valor="
						+ request.getParameter("valor");
			}

		}
	%>
	<p>Última acción realizada: <%=mensaje %></p>
<form action="" method="get">
	<p><strong>Nombre atributo</strong>: <input type="text" name="nombre" /></p>
	<p><strong>Valor (String)</strong>: <input type="text" name="valor" /></p>
	<p><input type="submit" value="Crear/modificar" name="accion"/></p>
	<p><input type="submit" value="Borrar" name="accion"/></p>
</form>
<p><a href="index.jsp">Volver</a></p>
<hr />
<p>Listado de todos los atributos de aplicación (son de tipo <code>Object</code>):</p>
	<table id="tablaAtributos">
		<tr>
			<th>Nombre</th>
			<th>Tipo</th>
			<th>Valor</th>
		</tr>
		<%
			Enumeration<String> enumAtributos = application
					.getAttributeNames();
			while (enumAtributos.hasMoreElements()) {
				String nombreAtributo = enumAtributos.nextElement();
		%>
		<tr>
			<td><span class="nombreParam"><%=nombreAtributo%></span></td>
			<td><%=application.getAttribute(nombreAtributo).getClass().getName()%></td>
			<td><%=application.getAttribute(nombreAtributo)%></td>
		</tr>

		<%
			}
		%>
	</table>
</body>
</html>