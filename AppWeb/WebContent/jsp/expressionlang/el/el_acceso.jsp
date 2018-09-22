<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.util.Arrays"%>
<%@page import="fast.Direccion"%>
<%@page import="fast.Persona"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Crear cookies
	System.out.println("Creando cookies...");
	Cookie cookie1 = new Cookie("pruebaCookie1", "valor de la cookie1");
	Cookie cookie2 = new Cookie("pruebaCookie2", "otro valor");
	
	// Añadimos cookies a las cabeceras.
	response.addCookie( cookie1 );
	response.addCookie( cookie2 );
	
	//Listar cookies existentes
	boolean cookieYaExiste = false;
	Cookie[] cookies = request.getCookies();
    for(int i = 0; i < cookies.length; i++) { 
       Cookie c = cookies[i];
       System.out.println("Cookie: "+c.getName()+" - "+c.getValue()+" - "+c.getMaxAge());
       if (c.getName().equals("pruebaCookie1"))
    	   cookieYaExiste = true;
    }
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>JSP 2.0 Expression Language - Acceso a datos</title>
<link href="../estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <h1>JSP 2.0 Expression Language - Acceso a datos</h1>
    <p>JSP Expression Language (EL) permite acceder fácilmente a datos
    	almacenados en beans, atributos, parámetros de inicialización de contexto,
    	datos de la cabecera de la petición HTTP y parámetros de la petición HTTP.</p>
    <p>
    Los siguientes objetos implícitos están disponibles
    para ser usados con EL:</p>
    <ul>
      <li><code class="highlight">pageContext</code> - el objeto PageContext.</li>
      <li><code class="highlight">pageScope</code> - un objeto Map que guarda cada uno de los nombres de los atributos
      	de ámbito <code>page</code> con su valor.</li>
      <li><code class="highlight">requestScope</code> - un objeto Map que guarda cada uno de los nombres de los atributos
      	de ámbito <code>request</code> con su valor.</li>
      <li><code class="highlight">sessionScope</code> - un objeto Map que guarda cada uno de los nombres de los atributos
      	de ámbito <code>session</code> con su valor.</li>
      <li><code class="highlight">applicationScope</code> - un objeto Map que guarda cada uno de los nombres de los atributos
      	de ámbito <code>application</code> con su valor.</li>
      <li><code class="highlight">param</code> - un objeto Map que guarda cada uno de los nombres de los parámetros de la petición
      	HTTP con un único valor de tipo String.</li>
      <li><code class="highlight">paramValues</code> - un objeto Map que guarda cada uno de los nombres de los parámetros
      	de la petición HTTP con un tabla de String con todos los valores para ese parámetro.</li>
      <li><code class="highlight">header</code> - un objeto Map que guarda cada uno de los nombres de las cabeceras de la petición
      	HTTP con un único valor de tipo String.</li>
      <li><code class="highlight">headerValues</code> - un objeto Map que guarda cada uno de los nombres de las cabeceras
      	de la petición HTTP con un tabla de String con todos los valores para esa cabecera.</li>
      <li><code class="highlight">initParam</code> - un objeto Map que guarda cada uno de los nombres de los parámetros
      	de inicialización de contexto con su valor de tipo String.</li>
      <li><code class="highlight">cookie</code> - un objeto Map que guarda cada uno de los nombres de las cookie
      	con su valor de tipo objeto Cookie.</li>
    </ul>

	<h2 id="creación de parámetros, atributos y beans">Creación de
		parámetros, atributos y beans</h2>
	<p>Vamos a crear una serie de atributos y objetos a los que accederemos después.</p>
	<ul>
		<li>Dos cookies llamadas <code class="highlight">pruebaCookie1</code>
		 y <code class="highlight">pruebaCookie2</code>.
			<%
			if (!cookieYaExiste) {
		%> (necesita recargar la
			página). <%
			}
		%>
		</li>
		<li>Párametros de petición HTTP, llamados <code class="highlight">paramA</code>
		 y <code class="highlight">paramB</code>.
			<%
			if (request.getParameter("paramA") == null) {
		%> Debe recargar la
			página, haciendo click en <a href="?paramA=azul&paramB=1">este
				enlace</a>. <%
			}
		%>
		</li>
		<li>Un atributo llamado <code class="highlight">nombreIgual</code> de ámbito <code>page</code> y
			valor <code>"atributo de ámbito page"</code> y otro con el mismo nombre <code class="highlight">nombreIgual</code>, pero
			de ámbito <code>session</code> y valor <code>"atributo de ámbito session"</code>. 
		</li>
		<%
		pageContext.setAttribute("nombreIgual", 
				"atributo de ámbito page", PageContext.PAGE_SCOPE);
		pageContext.setAttribute("nombreIgual", 
				"atributo de ámbito session", PageContext.SESSION_SCOPE);
		%>
		<li>Un atributo llamado <code class="highlight">tabla</code> de ámbito <code>session</code> y
			valor una tabla con los nombres de los días de la semana. 
		</li>
		<%
		String[] tabla = new String[] {"lunes", "martes", "miércoles", "jueves",
				"viernes", "sábado", "domingo"};
		session.setAttribute("tabla", tabla);
		%>
		<li>Un atributo llamado <code class="highlight">colores</code> de ámbito <code>request</code> y 
		una tabla asociativa de tipo HashMap que asocie un nombre de color 
		con su código hexadecimal HTML. 
		</li>
		<%
		Map<String,String> mapa  = new HashMap<String,String>();
		mapa.put("blanco", "#FFF");
		mapa.put("negro", "#000");
		mapa.put("rojo", "#F00");
		mapa.put("verde", "#0F0");
		mapa.put("azul", "#00F");
		request.setAttribute("colores", mapa);
		%>
		<li>Un bean llamado <code class="highlight">pepito</code> de tipo <code>Persona</code>. 
		</li>
		<jsp:useBean id="pepito" class="fast.Persona"></jsp:useBean>
		<jsp:setProperty property="nombre" name="pepito" value="Pepito"/>
		<jsp:setProperty property="apellidos" name="pepito" value="García de Tal"/>
		<jsp:setProperty property="edad" name="pepito" value="20"/>
		<li>Un bean llamado <code class="highlight">empresa</code> de tipo <code>Empresa</code>
			 relleno con una dirección y varios empleados, en el ámbito <code>request</code>. 
		</li>
		<jsp:useBean id="empresa" class="fast.Empresa" scope="request"></jsp:useBean>
		<%
		//Rellenamos con datos
		//Nombre
		empresa.setNombre("FAST S.A.");
		//Dirección
		Direccion direccion = new Direccion();
		direccion.setCalle("Camino de los Descubrimientos s/n");
		direccion.setCiudad("Sevilla");
		direccion.setCodigoPostal(41092);
		empresa.setDireccion(direccion);
		//Empleados
		Persona empleado1 = new Persona();
		empleado1.setNombre("Jefe");
		Persona empleado2 = new Persona();
		empleado2.setNombre("Secretario");
		empresa.getEmpleados().add(empleado1);
		empresa.getEmpleados().add(empleado2);
		%>
	</ul>
	<h2 id="ejemplos de acceso con el">Ejemplos de acceso con EL</h2>
	
	<h3>Acceso a cookies</h3>
	<p><code class="highlight">\${cookie.pruebaCookie1.value}</code> = <code>${cookie.pruebaCookie1.value }</code></p>
	<p><code class="highlight">\${cookie['pruebaCookie1'].value}</code> = <code>${cookie['pruebaCookie1'].value }</code></p>
	<p><code class="highlight">\${cookie["pruebaCookie2"].value}</code> = <code>${cookie["pruebaCookie2"].value }</code></p>
	<p><code class="highlight">\${cookie["noExiste"].value}</code> = <code>${cookie["noExiste"].value }</code></p>
	
	<h3>Acceso a parámetros de inicialización de contexto</h3>
	<p><code class="highlight">\${initParam.parametroContexto1}</code> = <code>${initParam.parametroContexto1}</code></p>
	<p><code class="highlight">\${initParam["parametroContexto2"]}</code> = <code>${initParam["parametroContexto2"]}</code></p>
	
	<h3>Acceso a cabeceras de petición HTTP</h3>
	<p><code class="highlight">\${header.host}</code> = <code>${header.host}</code></p>
	<p><code class="highlight">\${header["user-agent"]}</code> = <code>${header["user-agent"]}</code></p>
	
	<h3>Acceso a parámetros de petición HTTP</h3>
	<p><code class="highlight">\${param.paramA}</code> = <code>${param.paramA}</code></p>
	<p><code class="highlight">\${param["paramB"]}</code> = <code>${param["paramB"]}</code></p>
	
	<h3>Acceso a atributos independientemente de su ámbito</h3>
	<p>Se buscan los atributos en los distintos ámbitos hasta encontrarlo en este orden:
	<code>page</code>, <code>request</code>, <code>session</code> y por último <code>application</code>.</p>
	<p><code class="highlight">\${nombreIgual}</code> = <code>${nombreIgual}</code></p>
	<p><code class="highlight">\${tabla}</code> = <code>${tabla}</code></p>
	<p><code class="highlight">\${colores}</code> = <code>${colores}</code></p>
	<p><code class="highlight">\${pepito}</code> = <code>${pepito}</code></p>
	
	<h3>Acceso a atributos según su ámbito</h3>
	<p><code class="highlight">\${pageScope.nombreIgual}</code> = <code>${pageScope.nombreIgual}</code></p>
	<p><code class="highlight">\${sessionScope.nombreIgual}</code> = <code>${sessionScope.nombreIgual}</code></p>
	<p><code class="highlight">\${requestScope["colores"]}</code> = <code>${requestScope["colores"]}</code></p>
	
	<h3>Acceso a elementos de tablas</h3>
	<p>No se puede utilizar el operador <code>.</code> cuando se utilizan números.</p>
	<p><code class="highlight">\${tabla[0]}</code> = <code>${tabla[0]}</code></p>
	<p><code class="highlight">\${tabla[param.paramB]}</code> = <code>${tabla[param.paramB]}</code></p>
	<p><code class="highlight">\${tabla[2]}</code> = <code>${tabla[2]}</code></p>
	
	<h3>Acceso a elementos de tablas asociativas (clave, valor)</h3>
	<p><code class="highlight">\${colores.negro}</code> =
		<code style="color: ${colores.negro};">${colores.negro}</code></p>
	<p><code class="highlight">\${colores['rojo']}</code> =
		<code style="color: ${colores['rojo']};">${colores['rojo']}</code></p>
	<p><code class="highlight">\${colores["verde"]}</code> =
		<code style='color: ${colores["verde"]};'>${colores["verde"]}</code></p>
	<p><code class="highlight">\${colores[param.paramA]}</code> =
		<code style='color: ${colores[param.paramA]};'>${colores[param.paramA]}</code></p>
	
	<h3>Acceso a beans</h3>
	<p><code class="highlight">\${pepito.nombre}</code> =
						<code>${pepito.nombre}</code></p>
	<p><code class="highlight">\${pepito["apellidos"]}</code> =
						<code>${pepito["apellidos"]}</code></p>
	<p><code class="highlight">\${pepito['nombreCompleto']}</code> =
						<code>${pepito['nombreCompleto']}</code></p>
	<p><code class="highlight">\${empresa.nombre}</code> =
						<code>${empresa.nombre}</code></p>
	<p><code class="highlight">\${requestScope.empresa.nombre}</code> =
						<code>${requestScope.empresa.nombre}</code></p>
	<p><code class="highlight">\${empresa.direccion.calle}</code> =
						<code>${empresa.direccion.calle}</code></p>
	<p><code class="highlight">\${empresa.direccion['calle']}</code> =
						<code>${empresa.direccion['calle']}</code></p>
	<p><code class="highlight">\${empresa['direccion'].calle}</code> =
						<code>${empresa['direccion'].calle}</code></p>
	<p><code class="highlight">\${empresa['direccion']['calle']}</code> =
						<code>${empresa['direccion']['calle']}</code></p>
	<p><code class="highlight">\${empresa.direccion["ciudad"]}</code> =
						<code>${empresa.direccion["ciudad"]}</code></p>
	<p><code class="highlight">\${empresa["direccion"]["codigoPostal"]}</code> =
						<code>${empresa["direccion"]["codigoPostal"]}</code></p>
	<p><code class="highlight">\${empresa.empleados[0].nombre}</code> =
						<code>${empresa.empleados[0].nombre}</code></p>
	<p><code class="highlight">\${empresa.empleados[param.paramB]['nombre']}</code> =
						<code>${empresa.empleados[param.paramB]['nombre']}</code></p>
	<hr />
</body>
</html>


