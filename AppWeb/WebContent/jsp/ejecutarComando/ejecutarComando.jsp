<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Solo vamos a permitir ejecutar esta página, si la petición viene de la máquina local --%>
<%
	if ( !request.getRemoteAddr().equals("127.0.0.1")) {
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acceso denegado");
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Ejecutar comando</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Ejecutar comando externo</h1>
<div id="formulario">
<form action="" method="post" >
<label for="comando">Introduzca un comando a ejecutar:</label>
<input type="text" name="comando" id="comando"></input>
<input type="submit" value="Ejecutar" />
</form>
</div>
<div id="resultado">
<h2>Resultado</h2>
<h3>Salida estándar:</h3>
<pre><code>
<%
String comando = request.getParameter("comando");
if ( comando!=null && !comando.isEmpty() ) {
	try
	{
		// Se lanza el ejecutable.
		Process p=Runtime.getRuntime().exec (comando);
	
		// Se obtiene el stream de salida del programa
		InputStream is = p.getInputStream();
	
		/* Se prepara un bufferedReader para poder leer la salida más comodamente. */
		BufferedReader br = new BufferedReader (new InputStreamReader(is));
	
		// Se lee la primera linea
		String aux = br.readLine();
	
		// Mientras se haya leido alguna linea
		while (aux!=null)
		{
			// Se escribe la linea en pantalla
			out.println (aux);
			out.flush();
			// y se lee la siguiente.
			aux = br.readLine();
		}
%>
</code></pre>
<h3>Salida de errores estándar:</h3>
<pre><code>
<% 		
		// Se hace lo mismo para la salida de errores
		// Se obtiene el stream de salida del programa
		InputStream eis = p.getErrorStream();
	
		/* Se prepara un bufferedReader para poder leer la salida más comodamente. */
		BufferedReader ebr = new BufferedReader (new InputStreamReader(eis));
	
		// Se lee la primera linea
		aux = ebr.readLine();
	
		// Mientras se haya leido alguna linea
		while (aux!=null)
		{
			// Se escribe la linea en pantalla
			out.println (aux);
			out.flush();
			// y se lee la siguiente.
			aux = ebr.readLine();
		}
%>
</code></pre>
<h3>Valor devuelto por el comando:</h3>
<pre><code>
<%
		//Esperamos a que termine completamente
		p.waitFor();
		//Por último imprimimos el valor devuelto	
		out.println(p.exitValue());

	} catch (Exception e)
	{
		// Excepciones si hay algún problema al arrancar el ejecutable o al leer su salida.*/
		out.println("Error al ejecutar: ");
		out.println(e.getMessage());
	}
	
}
%>
</code></pre>
</div>
</body>
</html>