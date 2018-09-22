<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Obtención de los parámetros de inicialización</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<style>
	.nombreParam { font-weight: bold; }
	table, tr, th, td { 
		border-collapse:collapse;
		border: 1px solid grey; 
	}
</style>
</head>
<body>
<h1>Obtención de los parámetros de inicialización</h1>
<p>El objeto implícito config permite obtener los parámetros de inicialización de un servlet,
 pero no modificarlos. La clase del objeto es: javax.servlet.ServletConfig</p>
<p>Más información: <a href="http://docs.oracle.com/javaee/6/api/javax/servlet/ServletConfig.html">
http://docs.oracle.com/javaee/6/api/javax/servlet/ServletConfig.html</a></p>
<p>Por defecto, el nombre del servlet encargado de procesar las páginas JSP se denomina <code>jsp</code>.
Para crear parámetros de inicialización hay que añadir en el fichero <code>web.xml</code>
algo similar a esto:</p>
<pre><code>&lt;servlet&gt;
  &lt;servlet-name&gt;jsp&lt;/servlet-name&gt;
  &lt;init-param&gt;
      &lt;param-name&gt;nombre1&lt;/param-name&gt;
      &lt;param-value&gt;valor1&lt;/param-value&gt;
  &lt;/init-param&gt;
  &lt;init-param&gt;
      &lt;param-name&gt;nombre2&lt;/param-name&gt;
      &lt;param-value&gt;valor2&lt;/param-value&gt;
  &lt;/init-param&gt;
&lt;/servlet&gt;
</code></pre>
<p>Los valores son todos de tipo String</p>

<p>Listado de todos los parámetros de inicialización:</p>
<table>
	<tr><th>Nombre</th><th>Valor</th></tr>
<%

Enumeration<String> enumInitParam = config.getInitParameterNames();
while ( enumInitParam.hasMoreElements() ) {
	String nombreInitParam = enumInitParam.nextElement();
%>
	<tr>
		<td><span class="nombreParam"><%=nombreInitParam%></span></td>
		<td><%=config.getInitParameter(nombreInitParam) %></td>
	</tr>
	
<% } %>
</table>
</body>
</html>
