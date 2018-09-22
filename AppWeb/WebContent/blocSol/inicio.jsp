<%--FJFJ--%>

<jsp:useBean id="datos" class="fast.DatosPaginaBloc" scope="request" />
<jsp:setProperty name="datos" property="titulo" value="Bloc de Notas - FAST" />
<jsp:setProperty name="datos" property="esPaginaInicial" value="true" />

<%
//Comprobamos si hay que cerrar la sesion
if (request.getParameterMap().containsKey("salir"))
	datos.setHayQueCerrarSesion(true);

//Insertamos cabecera. En el se define la variable sesionIniciada

%>
<jsp:include page="cabecera.jsp" />


<div id="bienvenida">
	<h1>Bienvenido</h1>
	<p><img src="imagen/blocnotasfast.png" alt="Bloc de Notas FAST" /></p>
	<%
	if (datos.getUsuario()!=null) {
	%>
		<h3><a href="menu.jsp">Men&uacute;</a></h3>
	<%
	} else {
	%>
		<h3>Acceda con su usuario y clave</h3>
	<%
	}
	%>
</div>

<%@include file="pie.jsp"%>
