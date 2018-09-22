<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Objeto implícito application</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<style>
.nombreParam {
	font-weight: bold;
}

#tablaAtributos {
	font-size: 0.75em;
}
</style>
</head>
<body>
	<h1>Ejemplos del objeto implícito application</h1>
	<p>
		El objeto implícito
		<code>application</code>
		permite:

	</p>
	<ul>
		<li>Obtener y modificar parámetros de contexto</li>
		<li>Obtener y <a href="modificaAtributos.jsp">modificar</a> atributos globales a la aplicación.</li>
		<li>Obtener información del servidor.</li>
		<li>Obtener información de rutas y URL asociadas a esta
			aplicación.</li>
		<li>Etc.</li>
	</ul>
	<p>La clase del objeto es: javax.servlet.ServletContext</p>
	<p>
		Más información: <a
			href="http://docs.oracle.com/javaee/6/api/javax/servlet/ServletContext.html">
			http://docs.oracle.com/javaee/6/api/javax/servlet/ServletConfig.html</a>
	</p>
	<hr />
	<h2>Parámetros de contexto</h2>
	<p>
		Para crear parámetros de contexto hay que añadir en el fichero
		<code>web.xml</code>
		algo similar a esto:
	</p>
	<pre><code>  &lt;context-param&gt;
    &lt;param-name&gt;nombre1&lt;/param-name&gt;
    &lt;param-value&gt;valor1&lt;/param-value&gt;
  &lt;/context-param&gt;
  &lt;context-param&gt;
    &lt;param-name&gt;nombre1&lt;/param-name&gt;
    &lt;param-value&gt;valor1&lt;/param-value&gt;
  &lt;/context-param&gt;
</code></pre>
	<p>Los valores son todos de tipo String</p>
	<p>Listado de todos los parámetros de contexto:</p>
	<table>
		<tr>
			<th>Nombre</th>
			<th>Valor</th>
		</tr>
		<%
			Enumeration<String> enumInitParam = application
					.getInitParameterNames();
			while (enumInitParam.hasMoreElements()) {
				String nombreInitParam = enumInitParam.nextElement();
		%>
		<tr>
			<td><span class="nombreParam"><%=nombreInitParam%></span></td>
			<td><%=application.getInitParameter(nombreInitParam)%></td>
		</tr>

		<%
			}
		%>
	</table>
	<hr />
	<h2>Atributos de aplicación</h2>
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
	<p>Puede añadir, modificar o eliminar los atributos de aplicación en <a href="modificaAtributos.jsp">esta página.</a></p>
	<hr />
	<h2>
		Otra información que se puede obtener del objeto
		<code>application</code>
		:
	</h2>
	<ul>
		<li>Ruta de la aplicación web (alias de la URL): <pre><%=application.getContextPath()%></pre></li>
		<li>Tipo MIME del fichero <code>/application/index.hmtl</code>: <pre><%=application.getMimeType("/application/index.html")%></pre></li>
		<li>Ruta real del fichero <code>/application/index.hmtl</code>: <pre><%=application.getRealPath("/application/index.html")%></pre></li>
		<li>Información del servidor: <pre><%=application.getServerInfo()%></pre></li>
		<li>Nombre de la aplicación web tal como está en el fichero <code>web.xml</code>:
			<pre><%=application.getServletContextName()%></pre></li>
	</ul>

</body>
</html>