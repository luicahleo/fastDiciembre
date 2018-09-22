<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Listar cookies</title>
	<link href="../estilo.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		ul {
			border: 2px solid grey;
			padding: 1em;
		}
	</style>
</head>
<body>
	<h1>Listar cookies</h1>
	<p>
		Listado de todas las cookies enviadas por el navegador:
	</p>
	<ul>
	<%
	Cookie[] cookies = request.getCookies();
	if ( cookies != null ) {
		for ( int i = 0 ; i < cookies.length ; i++ ) {
			Cookie c = cookies[i];
			%>
			<li><code class="highlight"><%=c.getName() %></code> = <code><%=c.getValue() %></code></li>	
			<%
		}
	}
	%>
	</ul>
	<p>
		<a href="crearcookie.jsp">Crea la cookie <code>ejemploCookie</code>.</a>
	</p>
	<p>
		<a href="borrarcookie.jsp">Borrar la cookie <code>ejemploCookie</code>.</a>
	</p>
</body>
</html>