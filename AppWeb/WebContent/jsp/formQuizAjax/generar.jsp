<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="datosForm" class="fast.DatosForm" scope="session" /> 
<jsp:useBean id="datosInput" class="fast.DatosInput" scope="page" />   

<%-- Cargamos datos del nuevo campo si existe --%>
<jsp:setProperty property="*" name="datosInput" />
<jsp:setProperty property="nuevoCampo" name="datosForm" value="${datosInput}" />

<%-- Respuesta --%>
<% //Borramos buffer actual, para evitar espacios en blanco 
out.clearBuffer(); %><jsp:getProperty property="html" name="datosForm"/>
