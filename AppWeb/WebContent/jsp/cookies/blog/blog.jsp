<%--/*FJFJ*/--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fast.EntradaBlog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<jsp:useBean id="gestorEntradas" class="fast.GestorEntradasBlog" scope="application"></jsp:useBean>
<%
gestorEntradas.setNombreFichero( application.getRealPath("/jsp/cookies/blog/entradas.xml" ) );
%>    

<%!
//Funciones y variables del servlet
private final String nombreCookie = "historial";
private final int maxHistorial = 5;
/**
* Método que devuelve el valor de una cookie
*/
String buscarCookie(String nombre, Cookie[] cookies) {
	String valor = null;
	if ( cookies != null ) {
		for ( int i = 0 ; i < cookies.length ; i++ ) {
			Cookie c = cookies[i];
			if ( c.getName().equals( nombre) ) {
				valor = c.getValue();
				System.out.println("Encontrada cookie: "+nombre+" con valor: "+valor);
			}
		}
	}
	return valor;
}

/**
* Descompone la cookie historial en una tabla de enteros,
*  que son los identificadores de las entradas
*
*  La cookie historial tendrá un valor como 
*  1,21,13
*/
int[] descomponerCookieHistorial(String valor) {
	int[] valores = null;
	if ( valor != null ) {
		String[] cadenas = valor.split(",");
		valores = new int[cadenas.length];
		for( int i = 0 ; i < cadenas.length ; i++ ) {
			try {
				valores[i] = Integer.parseInt(cadenas[i]);
			} catch (NumberFormatException e) {
				System.out.println("Error procesando cadena:"+cadenas[i]);
				valores[i] = 0; //valor por defecto en caso de error
			}
		}
	} else {
		valores = new int[0];
	}
	
	return valores;
}

String componerCookieHistorial(int[] valores) {
	String resultado="";
	for( int i = 0 ; i < valores.length - 1 ; i++ ) {
		resultado += valores[i]+",";
	}
	if ( valores.length - 1 >= 0) {
		//último sin coma final
		resultado += valores[valores.length - 1];
	}
	return resultado;
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blog FAST</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<link href="blog.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="cabecera">
	<h1 id="tituloCabecera">Blog FAST</h1>
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
			<p><a id="volver" href="blog.jsp">&lt;- Volver</a></p>
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
	<div id="historial">
		<h2>Anteriores <%=maxHistorial %> últimas entradas visitadas:</h2>
		<%
		//Borramos historial
		if ( request.getParameter("borrar")!=null ) {
			//Establecemos tiempo de vida de la cookie a -1	
			Cookie paraBorrar = new Cookie( nombreCookie, "");
			paraBorrar.setMaxAge(0); //0 indica que hay que borrar la cookie
									//-1 que se borra cuando se cierra el navegador
								    //>0 número de segundos que deben pasar hasta borrar la cookie
			response.addCookie(paraBorrar);
		} else {
			//Listamos últimas entradas
			String valorActual = buscarCookie(nombreCookie, request.getCookies());
			int[] idEntradas = descomponerCookieHistorial(valorActual); %>
		<ul>  <!-- lista no numerada -->
		<%
			for ( int j = 0; j < idEntradas.length ; j++ ) {  %>
			<li><a href="?entrada=<%=idEntradas[j]%>"><%=lista.get( idEntradas[j] ).getTitulo() %></a></li>
		<%  }  %>
		</ul>
		<%
			//Actualizamos cookies
			if ( indice >=0 ) {
				int tamIndices;  //Obtenemos cuantas páginas están en el historial nuevo
				if ( idEntradas.length >= maxHistorial-1 )
					tamIndices =  maxHistorial;
				else
					tamIndices =  idEntradas.length + 1;
				
				//Generamos la tabla de indices de entrada
				int[] nuevosIndices = new int[tamIndices];
				nuevosIndices[0] = indice;
				for (int i = 1 ; i < tamIndices ; i++ ) {
					nuevosIndices[i] = idEntradas[i-1];
				}
				// Creamos la cookie
				Cookie nueva = new Cookie( nombreCookie, componerCookieHistorial(nuevosIndices));
				response.addCookie(nueva);
			}
				
		}
		%>
		<a href="?borrar=si">Borrar historial</a>
	</div>
</div>

<div id="pie">
	<hr />
	<p id="creditos">&copy; FAST. Fecha y hora actuales: <%=new Date() %> </p>
</div>
</body>
</html>
