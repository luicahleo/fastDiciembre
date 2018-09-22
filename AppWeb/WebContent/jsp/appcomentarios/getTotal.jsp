<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" isThreadSafe="false" %>  
<%--isThreadSafe="false" hace que solo un cliente pueda ejecutar esta página simultáneamente--%>
<jsp:useBean id="almacen" class="fast.AlmacenComentarios" scope="application" /> 
<%--Imprimimos el número total --%>
${almacen.total}