<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Crea cookie</title>
	<link href="../estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>Crea cookie</h1>
	<p>
		Esta página crea una cookie llamada
		<code>ejemploCookie</code>
		con valor
		<code>Hola cookies</code>
	</p>
	<pre><code>Cookie nueva = new Cookie( "ejemploCookie", "Hola cookies");
response.addCookie(nueva);	</code></pre>
	<p>
		Más información: <a
			href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/Cookie.html">
			http://docs.oracle.com/javaee/6/api/javax/servlet/http/Cookie.html</a>
	</p>
	<%
	// Creamos la cookie
	Cookie nueva = new Cookie( "ejemploCookie", "Hola cookies");
	response.addCookie(nueva);
	%>
	<p>
		<a href="listarcookies.jsp">Ver todas las cookies existentes.</a>
	</p>
	<p>
		<a href="borrarcookie.jsp">Borrar la cookie <code>ejemploCookie</code>.</a>
	</p>
</body>
</html>