
<jsp:useBean id="datos" class="fast.DatosPaginaBloc" scope="request" />
<%
/***FJFJ***/

if (datos.getHayQueCerrarSesion()) {
	session.invalidate();
} else {
	if (datos.getUsuario() != null) {
		//Guardamos el usuario en la sesion
		session.setAttribute("usuario", datos.getUsuario());
		//El idusuario es siempre 1
		session.setAttribute("idusuario", new Integer(1));
	} else {
		datos.setUsuario( (String) session.getAttribute("usuario") );
	}
}

boolean accesoDenegado = !( datos.getUsuario() !=null || datos.getEsPaginaInicial());

// La etiqueta html se cerrara al incluir pie.jsp
 %>
<!DOCTYPE html>
<html>

  <head>
    <title><%=datos.getTitulo()%> (Soluci&oacute;n)</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="estilo.css" />
	<% if (accesoDenegado) { 
	//Redireccion a pagina inicial en 2 segundos	
	%>
	<meta http-equiv="refresh" content="2;url=inicio.jsp" />
	<% } %>
	<script  type="text/javascript">
		function muestraFormAcceso() {
			document.getElementById("formacceso").style.display="block";
			document.getElementById("usuario").focus();
		}
		function ocultaFormAcceso() {
			document.getElementById("formacceso").style.display="none";
		}
	</script>
  </head>

  <body> <!-- Esta etiqueta se cerrara al incluir e2-pie.jsp -->
	<div id="cabecera">
		<div id="logotipo">
			<% if (!datos.getEsPaginaInicial()) { %>
				<a href="menu.jsp">
				<img src="imagen/blocnotasfast-p.png" alt="Bloc de Notas FAST" />
				</a>
			<% } %>
		</div>
		
		<% 
		//Sesion no iniciada: Boton para acceder
		if (datos.getUsuario() == null) { %>
			<noscript>
				<p><span class="acceso">
				Esta p&aacute;gina necesita JavaScript para funcionar
				</span></p>
			</noscript>
			<script type="text/javascript">
				//<![CDATA[
				//Mostramos un texto u otro depediendo si JavaScript esta activo
				document.write("<a onclick='muestraFormAcceso()'>");
				document.write("<span class='acceso'>");
				document.write("Acceder");
				document.write("</span></a>");
				//]]>
			</script>
			<div id="formacceso">
				<form action="menu.jsp" method="post">
				<p> <label for="usuario">Usuario:</label><br/>
				<input type="text" name="usuario" size="20" id="usuario" /></p>
				<p> <label for="clave">Clave:</label> <br/>
				<input type="password" name="clave" size="20" id="clave" /></p>
				<p> <input class="boton" type="submit" name="entrar" value="Entrar" /> 
				&nbsp;&nbsp;
				<input class="boton" type="button" name="cancelar" value="Cancelar" onclick="ocultaFormAcceso()" /> 
				</p>
				</form>
			</div>
		<% }
		else { 
		%>
			<a href="inicio.jsp?salir">
			<span class="acceso">
				Cerrar sesi&oacute;n
			</span>
			</a>
		 
			<!-- Sesion iniciada: Mostramos informacion del usuario -->
			<span class='acceso' id='nombreusuario'><%=(String)session.getAttribute("usuario") %> </span>
		<% } %>
	</div>

<% 
	if (accesoDenegado) {
%>
<div id="bienvenida">
	<h1>Acceso denegado</h1>
	<h3>Redirigiendo a inicio...</h3>
</div>
<%@include file="pie.jsp" %>
<% 

	  
    }
%>