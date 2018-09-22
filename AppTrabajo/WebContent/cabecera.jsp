<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="cabecera">
	<a href="${pageContext.servletContext.contextPath}/menu" class="acceso" id="volver">Volver al menú</a><!-- estudiar el pageContext -->
	<a href="${pageContext.servletContext.contextPath}/cerrar" class="acceso">Cerrar sesión</a>
	<span class="acceso" id="nombreusuario">${sessionScope.usuario.usu}</span><!-- ||${usuario.usu}||pageContext.id}</span> -->
									<!-- 	contiene atributos de sesio		                  id de la sesion -->
									
	<div id="sepCabecera"></div>
</div>