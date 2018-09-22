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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>JSP 2.0 Expression Language - Operadores</title>
<link href="../estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <h1>JSP 2.0 Expression Language - Operadores</h1>
	<p>En EL existen los siguientes operadores:</p>
	<ul>
	<li>Aritméticos: <code>+</code>, <code>- </code>(binario), <code>*</code>,
		<code>/</code> y <code>div</code>, <code>%</code> y <code>mod</code>,
		<code>-</code> (unario)
	</li>
	<li>Lógicos: <code>and</code>, <code>&amp;&amp;</code>, <code>or</code>,
		<code>||</code>, <code>not</code>, <code>!</code></li>
	<li>Relacionales: <code>==</code>, <code>eq</code>, <code>!=</code>,
		<code>ne</code>, <code>&lt;</code>, <code>lt</code>, <code>&gt;</code>,
		<code>gt</code>, <code>&lt;=</code>, <code>ge</code>, <code>&gt;=</code>,
		<code>le</code>. Las comparaciones se pueden hacer con valores de 
		variables o constantes booleanas, de cadena, enteras o de punto flotante.
	</li>
	<li>Empty: el operador <code>empty</code> es una operación prefija
		que permite determinar si un valor es <code>null</code> o está
		vacío (cadena "").
	</li>
	<li>Condicional: <code>A ? B : C</code>. Valdrá <code>B</code>
		o <code>C</code>, dependiendo del valor de <code>A</code> (verdadero o falso).
	</li>
	</ul>
	<p>La prioridad de los operadores ordenada de mayor a menor prioridad es la
	 siguiente (en una misma línea se ordenan también de mayor menor prioridad):
	</p>
	<ol>
		<li><code>[] .</code></li>
		<li><code>()</code> (Usado para cambiar la prioridad de los operadores)</li>
		<li><code>- </code>(unario)<code> not ! empty</code></li>
		<li><code>* / div % mod</code></li>
		<li><code>+ - </code>(binario)</li>
		<li><code>&lt; &gt; &lt;= &gt;= lt gt le ge</code></li>
		<li><code>== != eq ne</code></li>
		<li><code>&amp;&amp; and</code></li>
		<li><code>|| or</code></li>
		<li><code>? :</code></li>
	</ol>

	<h2 id="creación de parámetros, atributos y beans">Creación de
		parámetros, atributos y beans</h2>
	<p>Vamos a crear una serie de atributos y objetos a los que accederemos después.</p>
	<ul>
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
		<li>Atributos <code class="highlight">a = 3</code>, <code class="highlight">b = 2</code> y <code class="highlight">c = 4</code>. 
		</li>
		<%
		pageContext.setAttribute("a", 
				3, PageContext.PAGE_SCOPE);
		pageContext.setAttribute("b", 
				2, PageContext.PAGE_SCOPE);
		pageContext.setAttribute("c", 
				4, PageContext.PAGE_SCOPE);
		
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
	</ul>
	

	<h2>Ejemplos: Aritmética básica</h2>
	<table>
		<thead>
			<tr>
				<th><b>Expresión EL</b></th>
				<th><b>Resultado</b></th>
				<th><b>&nbsp;</b></th>
				<th><b>Expresión EL</b></th>
				<th><b>Resultado</b></th>
			</tr>
		</thead>
		<tr>
			<td><code class="highlight">\${1}</code></td>
			<td><p><code>${1}</code></p></td>
			<td></td>
			<td><code class="highlight">\${1 + 2}</code></td>
			<td><p><code>${1 + 2}</code></p></td>

		</tr>
		<tr>
			<td><code class="highlight">\${1.2 + 2.3}</code></td>
			<td><p><code>${1.2 + 2.3}</code></p></td>
			<td></td>
			<td><code class="highlight">\${1.2E4 + 1.4}</code></td>
			<td><p><code>${1.2E4 + 1.4}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${-4 - 2}</code></td>
			<td><p><code>${-4 - 2}</code></p></td>
			<td></td>
			<td><code class="highlight">\${21 * 2}</code></td>
			<td><p><code>${21 * 2}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${3/4}</code></td>
			<td><p><code>${3/4}</code></p></td>
			<td></td>
			<td><code class="highlight">\${3 div 4}</code></td>
			<%-- Si utiliza eclipse, ignore estos errores que marca --%>
			<td><p><code>${3 div 4}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${3/0}</code></td>
			<td><p><code>${3/0}</code></p></td>
			<td></td>
			<td><code class="highlight">\${10%4}</code></td>
			<td><p><code>${10%4}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${10 mod 4}</code></td>
			<td><p><code>${10 mod 4}</code></p></td>
			<td></td>
			<td><code class="highlight">\${(1==2) ? 3 : 4}</code></td>
			<td><p><code>${(1==2) ? 3 : 4}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${empty param.paramB ? "vacío" : "no vacío"}</code></td>
			<td><p><code>${empty param.paramB ? "vacío" : "no vacío"}</code></p></td>
			<td></td>
			<td><code class="highlight">\${a + b * c}</code></td>
			<td><p><code>${a + b * c}</code></p></td>
		</tr>
	</table>
	
	<h2>Ejemplos: Comparaciones</h2>
	<table>
		<thead>
			<tr>
				<th><b>Expresión EL</b></th>
				<th><b>Resultado</b></th>
				<th><b>&nbsp;</b></th>
				<th><b>Expresión EL</b></th>
				<th><b>Resultado</b></th>
			</tr>
		</thead>
		<tr> 
			<td><code class="highlight">\${1 &lt; 2}</code></td>
			<td><p><code>${1 < 2}</code></p></td>
			<td></td>
			<td><code class="highlight">\${1 lt 2}</code></td>
			<td><p><code>${1 lt 2}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${1 &gt; (4/2)}</code></td>
			<td><p><code>${1 > (4/2)}</code></p></td>
			<td></td>
			<td><code class="highlight">\${1 gt (4/2)}</code></td>
			<td><p><code>${1 gt (4/2)}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${4.0 &gt;= 3}</code></td>
			<td><p><code>${4.0 >= 3}</code></p></td>
			<td></td>
			<td><code class="highlight">\${4.0 ge 3}</code></td>
			<td><p><code>${4.0 ge 3}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${4 &lt;= 3}</code></td>
			<td><p><code>${4 <= 3}</code></p></td>
			<td></td>
			<td><code class="highlight">\${4 le 3}</code></td>
			<td><p><code>${4 le 3}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${100.0 == 100}</code></td>
			<td><p><code>${100.0 == 100}</code></p></td>
			<td></td>
			<td><code class="highlight">\${100.0 eq 100}</code></td>
			<td><p><code>${100.0 eq 100}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${(10*10) != 100}</code></td>
			<td><p><code>${(10*10) != 100}</code></p></td>
			<td></td>
			<td><code class="highlight">\${(10*10) ne 100}</code></td>
			<%-- Si utiliza eclipse, ignore estos errores que marca --%>
			<td><p><code>${(10*10) ne 100}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${'a' &lt; 'b'}</code></td>
			<td><p><code>${'a' < 'b'}</code></p></td>
			<td></td>
			<td><code class="highlight">\${a &lt; b}</code></td>
			<td><p><code>${a < b}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${'hip' &gt; 'hit'}</code></td>
			<td><p><code>${'hip' > 'hit'}</code></p></td>
			<td></td>
			<td><code class="highlight">\${'4' &gt; 3}</code></td>
			<td><p><code>${'4' > 3}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${tabla[0] &gt; tabla[1]}</code></td>
			<td><p><code>${tabla[0] > tabla[1]}</code></p></td>
		</tr>
	</table>
	
	<h2>Ejemplos: Utilización de operaciones en asignaciones a propiedades de beans</h2>
	<table>
		<thead>
			<tr>
				<%-- Si utiliza eclipse, ignore estos errores que marca --%>
				<th><b>Expresión EL</b></th>
				<th><b>Resultado tras asignar la expresión<br /> a la propiedad <code>edad</code> de <code>pepito</code></b></th>
			</tr>
		</thead>
		<tr>
			<td><code class="highlight">\${a*b}</code></td>
			<%-- Si utiliza eclipse, ignore estos errores que marca --%>
			<jsp:setProperty property="edad" name="pepito" value="${a*b}"/>
			<td><p><code>${pepito.edad}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${a}\${b}</code></td>
			<jsp:setProperty property="edad" name="pepito" value="${a}${b}"/>
			<td><p><code>${pepito.edad}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">-\${a}\${b}</code></td>
			<jsp:setProperty property="edad" name="pepito" value="-${a}${b}"/>
			<td><p><code>${pepito.edad}</code></p></td>
		</tr>
	</table>
	<br />
	<table>
		<thead>
			<tr>
				<th><b>Expresión EL</b></th>
				<th><b>Resultado tras asignar la expresión<br /> a la propiedad <code>nombre</code> de <code>pepito</code></b></th>
			</tr>
		</thead>
		<tr>
			<td><code class="highlight">\${a*b}</code></td>
			<jsp:setProperty property="nombre" name="pepito" value="${a*b}"/>
			<td><p><code>${pepito.nombre}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${tabla[6]}</code></td>
			<jsp:setProperty property="nombre" name="pepito" value="${tabla[6]}"/>
			<td><p><code>${pepito.nombre}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${'ANT'}\${c-b-b}NIO</code></td>
			<jsp:setProperty property="nombre" name="pepito" value="${'ANT'}${c-b-b}NIO"/>
			<td><p><code>${pepito.nombre}</code></p></td>
		</tr>
		<tr>
			<td><code class="highlight">\${param.paramA}\${noExiste} negro</code></td>
			<jsp:setProperty property="nombre" name="pepito" value="${param.paramA}${noExiste} negro"/>
			<td><p><code>${pepito.nombre}</code></p></td>
		</tr>
	</table>
	
	<hr />
</body>
</html>


