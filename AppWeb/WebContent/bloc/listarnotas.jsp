<%--FJFJ--%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="datos" class="fast.DatosPaginaBloc" scope="request" />
<jsp:setProperty name="datos" property="titulo" value="Bloc de Notas - FAST: Mostrar notas" />

<%

//Insertamos cabecera
%>
<jsp:include page="cabecera.jsp" />
<% if ( datos.getUsuario() != null)  { %>

<script src="listarnotas.js"></script>


<div id="lista">
	<h1>Lista de notas</h1>
	<div id="lista-div">
		<table id="lista-tabla">
		
<%
			// Codigo HTML + JSP
			//Obtenemos todas las notas
			String mensajeError = "";
			//Consulta SQL que obtiene los campos id y titulo de todas las notas del
			// usuario (el identificador del usuario esta en la variable $_SESSION['idusuario'] )
		    String sql=""; //HACER

			///////////////////////////////////////////////////////////////
			//CODIGO DE PRUEBA. ELIMINAR CUANDO NO SEA NECESARIO.
			String idNota = "1";
		    String tituloNota = "XXX";
		    out.println("<tr id='fila-" + idNota
					+ "'><td onclick='mostrar(" + idNota
					+ ")'>" + "<p><strong>" + tituloNota
					+ "</strong></p>"
					+ "<div class='detalle' id='detalle-"
					+ idNota + "'></div>" + "</td></tr>");
		    idNota = "2";
		    tituloNota = "YYY";
		    out.println("<tr id='fila-" + idNota
					+ "'><td onclick='mostrar(" + idNota
					+ ")'>" + "<p><strong>" + tituloNota
					+ "</strong></p>"
					+ "<div class='detalle' id='detalle-"
					+ idNota + "'></div>" + "</td></tr>");
			//FIN DEL CODIGO DE PRUEBA. ELIMINAR CUANDO NO SEA NECESARIO.
			///////////////////////////////////////////////////////////////
		    //HACER: OBTENER DE BBDD
					

			
		%>
		</table>
	</div>
	<%
	//Muestra mensaje de error
	if ( !mensajeError.isEmpty() ) {
	%>
		<div id="error"><p> ERROR: 
		<%=mensajeError%>
		</p></div>
	<%
	}
	%>
</div>


<%@include file="pie.jsp" %>

<% } %>