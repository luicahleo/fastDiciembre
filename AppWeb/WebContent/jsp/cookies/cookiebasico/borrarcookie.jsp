<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
<%!
/**
* Método que devuelve el valor de una cookie
*/
String buscarCookie(String nombre, Cookie[] cookies) {
	String valor = null;
	if ( cookies != null ) {
		for ( int i = 0 ; i < cookies.length ; i++ ) {
			Cookie c = cookies[i];
			if ( c.getName().equals( nombre) ) {
				valor = c.getValue();
			}
		}
	}
	return valor;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Borrar cookie</title>
	<link href="../estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>Borrar cookie</h1>
	<p>
		Esta página borra la cookie <code>ejemploCookie</code> 
		que actualmente vale <code><%=buscarCookie("ejemploCookie", request.getCookies()) %></code>
		
	</p>
	<pre><code>	Cookie paraBorrar = new Cookie( "ejemploCookie", "");
	paraBorrar.setMaxAge(0); //0 indica que hay que borrar la cookie
						     //-1 que se borra cuando se cierra el navegador
						     //&gt;0 número de segundos que deben pasar hasta borrar la cookie
	response.addCookie(paraBorrar);</code></pre>
	<p>
		Más información: <a
			href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/Cookie.html">
			http://docs.oracle.com/javaee/6/api/javax/servlet/http/Cookie.html</a>
	</p>
	<%
	Cookie paraBorrar = new Cookie( "ejemploCookie", "");
	paraBorrar.setMaxAge(0); //0 indica que hay que borrar la cookie
							//-1 que se borra cuando se cierra el navegador
						    //>0 número de segundos que deben pasar hasta borrar la cookie
	response.addCookie(paraBorrar);
	%>
	<p>
		<a href="listarcookies.jsp">Ver todas las cookies existentes.</a>
	</p><p>
		<a href="crearcookie.jsp">Crea la cookie <code>ejemploCookie</code>.</a>
	</p>
</body>
</html>
