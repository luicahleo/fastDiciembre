<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Sesiones</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Sesiones: uso básico</h1>
	<h2>Creación de una sesión</h2>
		<p>Las sesiones se crean automáticamente, a menos que se indique expresamente 
		que no se quiere hacer uso de ellas.</p>
	<h2>Uso de una sesión</h2>
		<p>Las sesiones en JSP se manejan con el objeto implícito
		<code>session</code> que es de la clase: javax.servlet.http.HttpSession</p>
		<p>
			Más información: <a
				href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpSession.html">
				http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpSession.html</a>
		</p>
	<h2>Destrucción de una sesión</h2>
		<p>Para destruir una sesión con toda la información que contiene, solo hay que
		llamar a la función <code>invalidate</code>:</p>
		<pre><code>session.invalidate()</code></pre>
		<p>Una vez destruida una sesión, automáticamente se crea una nueva en la
		siguiente petición HTTP.</p>
		<p>Pulse en el siguiente botón para destruir la sesión actual:</p>
		<form action="cerrarSesion.jsp"><input type="submit" name="destruir" value="Destruir sesión actual"/></form>
		<%
			//Ejemplo de destrucción de una sesión
			//	session.invalidate();
			//No podemos hacerlo en esta página, porque necesitamos seguir utilizando
			// el objeto session, y tras llamar a invalidate() no se puede usar más.
		%>
		<p>También es posible indicar un tiempo de inactividad máximo (sin recibir
		 peticiones HTTP asociadas a esta sesión) permitido. Transcurrido este tiempo
		 la sesión se destruye automáticamente. Para ello se utiliza la propiedad
		 <code>MaxInactiveInterval</code> del objeto <code>session</code> (valor
		 en segundos). El valor
		 actual es:</p>
		 <pre><code><%=session.getMaxInactiveInterval() %></code></pre>
		 <p>Pulse en el siguiente botón para establecer un intervalo de inactividad
		 máximo de 30 segundos:</p>
		<form action="maxInactividadSesion.jsp"><input type="submit" name="destruir" 
			value="Establecer a 30 segundos"/></form>

	<h2>Información no modificable de una sesión</h2>
	<ul>
		<li><code>Id</code> - Identificador único de la sesión (cadena de
			caracteres) <pre><code><%=session.getId()%></code></pre></li>
		<li><code>isNew</code> - Indica si la sesión acaba de crearse o
			no <pre><code><%=session.isNew()%></code></pre></li>
		<li><code>CreationTime</code> - Fecha/hora de creación (número de
			milisegundos desde el 01/01/1970) <pre><code><%=session.getCreationTime()%> - <%=new Date(session.getCreationTime())%></code></pre></li>
		<li><code>LastAccessedTime</code> - Fecha/hora de la última
			petición HTTP asociada a esta sesión (número de milisegundos desde el
			01/01/1970) <pre><code><%=session.getLastAccessedTime()%> - <%=new Date(session.getLastAccessedTime())%></code></pre></li>
	</ul>
	<h2>Atributos de una sesión</h2>
	<p>Por último, las sesiones pueden guardar cualquier tipo de objeto
		asociado a un nombre (cadena de caracteres), que es lo que se conoce
		como atributo. Estos atributos pueden ser creados/modificados/borrados
		desde cualquier página accedida con la misma sesión. Funciones útiles:</p>
	<ul>
		<li>Para acceder al valor de un atributo se utiliza la función <code>
				<a
					href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpSession.html#getAttribute(java.lang.String)">getAttribute
				</a>
			</code></li>
		<li>Para modificar o crear un atributo se utiliza la función <code>
				<a
					href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpSession.html#setAttribute(java.lang.String,%20java.lang.Object)">setAttribute
				</a>
			</code></li>
		<li>Para borrar un atributo se utiliza la función <code>
				<a
					href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpSession.html#removeValue(java.lang.String)">removeAttribute
				</a>
			</code></li>
		<li>Para obtener todos los nombres de los atributos se utiliza la
			función <code>
				<a
					href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpSession.html#getAttributeNames()">getAttributeNames
				</a>
			</code>
		</li>
	</ul>
	<p><em>Mire el código JSP para ver cómo se realizan estas acciones en los ejemplos</em></p>
	<h2>Ejemplos con atributos de sesión</h2>
	<p>Creamos tres atributos: <code>ditUno</code>, <code>ditDos</code> y <code>ditTres</code></p>
	<%
	session.setAttribute("ditUno", "Vale cualquier objeto, esto es una cadena");
	session.setAttribute("ditDos", 2);  //Objeto entero
	Map<String,String> mapa  = new HashMap<String,String>();
	mapa.put("blanco", "#FFF");
	mapa.put("negro", "#000");
	mapa.put("rojo", "#F00");
	mapa.put("verde", "#0F0");
	mapa.put("azul", "#00F");
	session.setAttribute("ditTres", mapa);  //Objeto tabla asociativa (mapa)
	%>
	<p>Mostramos los valores de los tres atributos:</p>
	<blockquote>
	<p><code class="highlight">ditUno</code> = <code><%=session.getAttribute("ditUno") %></code></p>
	<p><code class="highlight">ditDos</code> = <code><%=session.getAttribute("ditDos") %></code></p>
	<p><code class="highlight">ditTres</code> = <code><%=session.getAttribute("ditTres") %></code></p>
	</blockquote>
	<p>Se borra el atributo <code>ditDos</code></p>
	<% session.removeAttribute("ditDos"); %>
	<p>Mostramos todos los atributos de sesión existentes y sus clases:</p>
	<table id="tablaAtributos">
		<tr>
			<th>Nombre</th>
			<th>Tipo</th>
			<th>Valor</th>
		</tr>
		<%
			Enumeration<String> enumAtributos = session.getAttributeNames();
			while (enumAtributos.hasMoreElements()) {
				String nombreAtributo = enumAtributos.nextElement();
		%>
		<tr>
			<td><span class="nombreParam"><%=nombreAtributo%></span></td>
			<td><%=session.getAttribute(nombreAtributo).getClass().getName()%></td>
			<td><%=session.getAttribute(nombreAtributo)%></td>
		</tr>

		<%
			}
		%>
	</table>
	<br />
	<hr />
	
</body>
</html>