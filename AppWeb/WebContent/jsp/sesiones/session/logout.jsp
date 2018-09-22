<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Salir de Acceso Restringido</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<link href="restringido.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<% session.invalidate(); //Fin de la sesión %>

<div id="acceso">
<h2>Acaba de terminar la sesión</h2>
<p> Gracias por su visita</p>
<p><a href="inicio.jsp">Volver al inicio</a></p>
<br />
</div>
</body>
</html>