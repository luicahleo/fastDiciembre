<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="almacen" class="fast.AlmacenComentarios" scope="application" /> 
<%--Imprimimos en formato xml. El parámetro "id" debe almacenar el número de comentario 
 buscado. Restamos 1 al ID, porque el primero es 0 --%>
<comentario>
	<fecha>${almacen.comentarios[param.id-1].fecha}</fecha>
	<autor>${almacen.comentarios[param.id-1].autor}</autor>
	<texto>${almacen.comentarios[param.id-1].texto}</texto>
</comentario>
<%
//Para que la carga de datos sea un poco más lenta, vamos a poner aquí una 
// espera (innecesaria en la realidad)
Thread.sleep(100);
%>