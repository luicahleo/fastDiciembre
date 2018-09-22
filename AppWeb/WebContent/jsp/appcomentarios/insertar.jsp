<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isThreadSafe="false" %>  
<%--isThreadSafe="false" hace que solo un cliente pueda ejecutar esta página simultáneamente--%>

<jsp:useBean id="almacen" class="fast.AlmacenComentarios" scope="application" /> 
<jsp:useBean id="comentario" class="fast.Comentario" scope="page" />   

<%-- Cargamos datos del nuevo comentario si existe --%>
<jsp:setProperty property="*" name="comentario" />
<jsp:setProperty property="nuevoComentario" name="almacen" value="${comentario}" />