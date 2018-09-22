<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Ejemplo de atributo de tipo request
pageContext.setAttribute("ejemplo", "valor de ejemplo", PageContext.REQUEST_SCOPE);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>PageContext: atributos y ámbitos (scopes)</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>PageContext: atributos y ámbitos (scopes)</h1>
<p>Operaciones (entre paréntesis están los argumentos que necesita):</p>
<ul>
	<li>Crear atributo (nombre, valor, ámbito)</li>
	<li>Borrar atributo (nombre, ámbito)</li>
	<li>Listar atributos de un ámbito (ámbito)</li>
	<li>Mostrar ámbito de un atributo (nombre)</li>
	<li>Mostrar valor de un atributo (nombre, ámbito)</li>
 </ul>
 <hr />
 <form action="" method="get">
	<p><strong>Nombre</strong>: <input type="text" name="nombre" value="nom"/></p>
	<p><strong>Valor</strong>: <input type="text" name="valor" value="val"/></p>
	<p> Ámbito: 
		<input type="radio" checked="checked" value="<%=PageContext.PAGE_SCOPE %>" name="ambito" />1-PAGE_SCOPE
		<input type="radio" value="<%=PageContext.REQUEST_SCOPE %>" name="ambito" />2-REQUEST_SCOPE
		<input type="radio" value="<%=PageContext.SESSION_SCOPE %>" name="ambito" />3-SESSION_SCOPE
		<input type="radio" value="<%=PageContext.APPLICATION_SCOPE %>" name="ambito" />4-APPLICATION_SCOPE
	</p>
	<p>
		<input type="submit" value="Crear" name="accion" />
		<input type="submit" value="Borrar" name="accion" />
		<input type="submit" value="Listar" name="accion" />
		<input type="submit" value="Ver ámbito" name="accion" />
		<input type="submit" value="Valor" name="accion" />
	</p>
</form>
<hr />
<%
if ( request.getParameter("accion") != null ) {
%>
	<h2>Resultados:</h2>
	<%
	String accion = request.getParameter("accion");
	String nombre = request.getParameter("nombre");
	String valor = request.getParameter("valor");
	int ambito = Integer.parseInt(request.getParameter("ambito"));
	if ( accion.equals("Crear") ) {
		pageContext.setAttribute(nombre, valor, ambito);
		%>
		<p>Creado atributo <code><%=nombre %></code> con valor <code><%=valor %></code>
			en el ámbito <code><%=ambito %></code></p>
		<%		
	} else if ( accion.equals("Borrar") ) {
		pageContext.removeAttribute(nombre, ambito);
		%>
		<p>Eliminado atributo <code><%=nombre %></code>
			en el ámbito <code><%=ambito %></code></p>
		<%
	} else if ( accion.equals("Listar") ) {
		Enumeration<String> lista = pageContext.getAttributeNamesInScope(ambito);
		%>
		<p>Atributos en el ámbito: <%=ambito %></p>
		<ul>
		<%
		while (lista.hasMoreElements()) {
			String nombreAtributo = lista.nextElement();
		%>
			<li><%=nombreAtributo %></li>
		<%
		}
		%>
		</ul>
		<%
	} else if ( accion.startsWith("Ver") ) {
		%>
		<p>El atributo <code><%=nombre %></code>
			está en el ámbito: 
			<%=pageContext.getAttributesScope(nombre) %>
			</p>
		<%
	} else if ( accion.equals("Valor") ) {
		%>
		<p>El atributo <code><%=nombre %></code>
			en el ámbito <code><%=ambito %></code> tiene de valor:
			<%=pageContext.getAttribute(nombre, ambito) %> 
			</p>
		<%
	} else {
		%>
		<p>Acción desconocida:
		<%=accion %> 
		</p>
		<%
	}
	
	%>
<%
}
%>




</body>
</html>