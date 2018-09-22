<%--/*FJFJ*/--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fast.EntradaBlog"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:useBean id="gestorEntradas" class="fast.GestorEntradasBlog" scope="application">
	<jsp:setProperty name="gestorEntradas" property="nombreFichero"
		value="${pageContext.servletContext.getRealPath('/jsp/cookies/blog/entradas.xml') }" />
</jsp:useBean>
<%-- Ignorar el error que marca el eclipse, es correcto --%>

<jsp:useBean id="ahora" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Blog FAST Simple JSTL</title>
<link href="../estilo.css" rel="stylesheet" type="text/css" />
<link href="blog.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="cabecera">
		<h1 id="tituloCabecera">Blog FAST Simple JSTL</h1>
	</div>

	<div id="centro">
		<div id="contenido">

			<c:if test="${not empty param.entrada }">

				<c:catch var="catchException">
					<c:set var="entrada"
						value="${gestorEntradas.entradas[param.entrada]}" />
				</c:catch>

				<c:if test="${catchException != null or
							param.entrada < 0 or 
							param.entrada >= fn:length(gestorEntradas.entradas)}">
					<jsp:useBean id="entrada" class="fast.EntradaBlog">
						<jsp:setProperty name="entrada" property="titulo"
							value="Blog FAST" />
						<jsp:setProperty name="entrada" property="fecha" value="${ahora}" />
						<jsp:setProperty name="entrada" property="autor" value="NO EXISTE" />
						<jsp:setProperty name="entrada" property="contenido"
							value="Índice de entrada incorrecto" />

					</jsp:useBean>
				</c:if>

				<p>
					<a id="volver" href="${pageContext.request.requestURL}">&lt;-
						Volver</a>
				</p>
				<h2 id="tituloEntrada">${entrada.titulo}</h2>
				${entrada.contenido}
				<p id="infoEntrada">
					<span class="autor">${entrada.autor}</span> - <span class="fecha">Fecha:
						<fmt:formatDate pattern="dd/MM/yyyy" value="${entrada.fecha}" />
					</span>
				</p>
			</c:if>
			<c:if test="${empty param.entrada }">
				<h2>Listado de entradas</h2>
				<ul id="listaEntradas">
					<c:forEach var="entrada" items="${gestorEntradas.entradas}"
						varStatus="i">
						<c:url var="urlEntrada" value="">
							<c:param name="entrada" value="${i.index}" />
						</c:url>
						<li><a href="${urlEntrada}"><span class="titulo">${entrada.titulo}</span></a>
							<br /> <span class="autor">${entrada.autor}</span> - <span
							class="fecha">Fecha: <fmt:formatDate pattern="dd/MM/yyyy"
									value="${entrada.fecha}" />
						</span></li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

	</div>

	<div id="pie">
		<hr />
		<p id="creditos">&copy; FAST. Fecha y hora actuales: ${ahora}</p>
	</div>
</body>
</html>
