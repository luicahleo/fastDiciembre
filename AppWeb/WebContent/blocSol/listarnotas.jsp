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
		    String sql="SELECT id, titulo FROM notas WHERE idusuario="+
			session.getAttribute("idusuario");
			//constantes
			//Nos conectamos a la base de datos
			try {
				Class.forName("org.postgresql.Driver").newInstance();
				
				String url = "jdbc:postgresql://localhost:5432/notasfast";
				String user = "dit";
				String pass = "dit";
				Connection conn = DriverManager.getConnection(url, user,
						pass);
				try {
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
						//Generamos tabla
						String idNota = rs.getString(1);
						String tituloNota = rs.getString(2);
						out.println("<tr id='fila-" + idNota
								+ "'><td onclick='mostrar(" + idNota
								+ ")'>" + "<p><strong>" + tituloNota
								+ "</strong></p>"
								+ "<div class='detalle' id='detalle-"
								+ idNota + "'></div>" + "</td></tr>");

					}
					rs.close();
					st.close();
				} catch (SQLException e) {
					mensajeError = "No se ha podido obtener la nota." + e;
				}
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				mensajeError = "Imposible acceder a la base de datos.";
			}
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