<%--FJFJ--%>
<jsp:useBean id="datos" class="fast.DatosPaginaBloc" scope="request" />
<jsp:setProperty name="datos" property="titulo" value="Bloc de Notas - FAST: Men&uacute;" />

<%

//Comprobamos si nos han pasado un usuario y clave.
if (request.getParameter("usuario")!=null && request.getParameter("clave")!=null) {
	//Version limitada a un usuario fijo, se podria buscar en una BBDD
	if ("usuario".equals(request.getParameter("usuario")) && 
			"clave".equals(request.getParameter("clave")) )
		datos.setUsuario( request.getParameter("usuario") );
}

//Insertamos cabecera
%>
<jsp:include page="cabecera.jsp" />


<% if ( datos.getUsuario() != null)  { %>
<div id="menu">
	<h1>Men&uacute;</h1>
	<ol>
	<li>
		<a href="crearnota.jsp"><span class="fondo">
			<span class="textoopcion">Nueva</span>
		</span></a>
	</li>
	<li>
		<a href="listarnotas.jsp"><span class="fondo">
			<span class="textoopcion">Mostrar</span>
		</span></a></li>
	</ol>
</div>


<%@include file="pie.jsp" %>

<% } %>