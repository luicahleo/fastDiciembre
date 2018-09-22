<%--/*FJFJ*/--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fast.EntradaBlog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<jsp:useBean id="gestorEntradas" class="fast.GestorEntradasBlog" scope="application">
	<jsp:setProperty name="gestorEntradas" property="nombreFichero" 
		 value="${pageContext.servletContext.getRealPath('/jsp/cookies/blog/entradas.xml') }"/>
</jsp:useBean>
<%-- Ignorar el error que marca el eclipse, es correcto --%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Blog FAST Simple</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<link href="blog.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="cabecera">
	<h1 id="tituloCabecera">Blog FAST Simple</h1>
</div>

<div id="centro">
	<div id="contenido">
		<% 
		int indice = -1;   //indice de la entrada a mostrar
		int numEntradas = gestorEntradas.getEntradas().size();
		List<EntradaBlog> lista = gestorEntradas.getEntradas();
		
		if (request.getParameter("entrada") != null &&
			!request.getParameter("entrada").isEmpty()) {
			//Petición de una entrada
			try {
				//Obtenemos el índice
				indice = Integer.parseInt( request.getParameter("entrada") );
			} catch (NumberFormatException e) {
				//indice no válido
				indice = -1;
			}
			EntradaBlog entrada;
			if (indice >=0 && indice <numEntradas )
				entrada = lista.get(indice);
			else {
				//El índice es incorrecto, generamos uno para que el resto de la página funcione
				entrada = new EntradaBlog(new Date(), "Blog FAST",
						"NO EXISTE", "Índice de entrada incorrecto");
			}
				
			%>
			<p><a id="volver" href="${pageContext.request.requestURL}">&lt;- Volver</a></p>
			<h2 id="tituloEntrada"><%=entrada.getTitulo() %></h2>
			<%=entrada.getContenido() %>
			<p id="infoEntrada">
			    <span class="autor"><%=entrada.getAutor() %></span> -
			    <span class="fecha">Fecha: <%=new SimpleDateFormat("dd/MM/yyyy").format(entrada.getFecha()) %></span>
			</p>
		<%
		} else {
			%>
			<h2>Listado de entradas</h2>
			<ul id="listaEntradas">
			<%
			for (int i = 0 ; i < numEntradas ; i++ ) {
			%>
			<li><a href="?entrada=<%=i%>"><span class="titulo"><%=lista.get(i).getTitulo() %></span></a>
				<br />
			    <span class="autor"><%=lista.get(i).getAutor() %></span> -
			    <span class="fecha">Fecha: <%=new SimpleDateFormat("dd/MM/yyyy").format(lista.get(i).getFecha()) %></span>
			</li>
			<%
			}
			%>
			</ul>
		<%	
		}
		
		%>
		</div>

</div>

<div id="pie">
	<hr />
	<p id="creditos">&copy; FAST. Fecha y hora actuales: <%=new Date() %> </p>
</div>
</body>
</html>
