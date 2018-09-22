<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Objeto implícito pageContext</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h1>Ejemplos del objeto implícito pageContext</h1>
	<p>La clase del objeto es: javax.servlet.jsp.PageContext</p>
	<p>
		Más información: <a
			href="http://docs.oracle.com/javaee/6/api/javax/servlet/jsp/PageContext.html">
			http://docs.oracle.com/javaee/6/api/javax/servlet/jsp/PageContext.html</a>
	</p>
	<p>
		Entre sus funcionalidades destacan:
	</p>
	<ul>
		<li>Acceso indirecto al resto de objetos implícitos con las
			funciones: <code>getException()</code>, <code>getPage()</code> <code>getRequest()</code>,
			<code>getResponse()</code>, <code>getSession()</code>, <code>getServletConfig()</code>
			y <code>getServletContext()</code> (application).
		</li>
		<li>Reenviar la petición a otra página con la función <code>forward()</code>.
		</li>
		<li>Incluir otro fichero jsp (similiar a @include) con la función <code>include()</code>.</li>
		<li>Enviar un error a la página de error de JSP con la función <code>handlePageException()</code>.</li>
		<li>Crear/modificar/borrar atributos en distintos ámbitos (APPLICATION_SCOPE, PAGE_SCOPE, 
			REQUEST_SCOPE y SESSION_SCOPE). <a href="atributos.jsp">Ver ejemplo</a></li>
	</ul>
	<p><a href="redireccionador.jsp">Ejemplo de forward, include y diferencia entre PAGE_SCOPE y REQUEST_SCOPE</a></p>
	
</body>
</html>