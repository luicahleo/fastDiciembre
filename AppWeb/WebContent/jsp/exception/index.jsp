<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Página que lanza excepciones</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Página que lanza excepciones</h1>
<%
    String usuario = request.getParameter("nombre");
    String edadString = request.getParameter("edad");
    int edad = 0;
    
    if( usuario != null && "".equals(usuario) ){
    	//Si el campo existe pero está vacío, lanzamos una excepción.
        throw new ServletException("El campo usuario está vacío.");
    }
    if( edadString != null && "".equals(edadString) ){
    	//Si el campo existe pero está vacío, lanzamos una excepción.
        throw new ServletException("El campo edad está vacío.");
    }
    //Intentamos convertir edad a n�mero. Lanza una excepción si el número es incorrecto.
    if ( edadString != null )
    	edad = Integer.parseInt(edadString);
    
    if ( usuario != null )
    	//Se muestra el nombre y la edad.
    	out.print("<h2>Usuario "+usuario+" con "+edad+" años</h2>");
    
%>
<hr />
<h3>Introducir datos</h3>
<form action="" method="post">
	<p><strong>Nombre</strong>: <input type="text" name="nombre" /></p>
	<p><strong>Edad</strong>: <input type="text" name="edad" /></p>
	<p><input type="submit" value="Cambiar" /></p>
</form>
<p>Si se deja algún campo vacío o si el valor de edad no es un número entero, generará una excepción.</p>
</body>
</html>