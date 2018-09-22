<%--FJFJ--%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="datos" class="fast.DatosPaginaBloc" scope="request" />
<jsp:setProperty name="datos" property="titulo" value="Bloc de Notas - FAST: Crear nota" />
<%


//Insertamos cabecera
%>
<jsp:include page="cabecera.jsp" />
<% if ( datos.getUsuario() != null)  { %>


<% // Código HTML + JSP  

if ( request.getParameter("titulo") != null) {
	//Creamos notas
	String tituloNota = (String) request.getParameter("titulo");
	String imagen;
	String nota;
	if ( request.getParameter("imagen") != null )
		imagen = (String) request.getParameter("imagen");
	else
		imagen="";
	if ( request.getParameter("nota") != null ) 
		nota = (String) request.getParameter("nota");
	else
		nota="";
	
	String mensajeError = "";
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		
		String url = "jdbc:postgresql://localhost:5432/notasfast";
	    String user = "dit";
	    String pass = "dit";
	    String consultaSql = "INSERT INTO notas (idusuario, titulo, nota, urlimagen) VALUES ('"+
	    		(Integer)session.getAttribute("idusuario")+"', '"+
	    		tituloNota+"', '"+nota+"', '"+imagen+"');";
	    try {
	    	Connection conn = null; //MODIFICAR
	    	if (conn == null)      
	    		throw new SQLException();
	    	
	    	try {
	    		Statement st = conn.createStatement();
		    	int resUpdate = 0; //MODIFICAR
				st.close();
	    	} catch (SQLException e) {
	    		mensajeError= "No se ha podido insertar la nota."+e;
	    	}
			conn.close();
	    } catch (SQLException e) {
	    	mensajeError="Imposible acceder a la base de datos.";
	    }
		
	} catch (Exception e) {
		mensajeError="Driver no soportado.";
	}
	
    //Muestra error o exito
	if ( ! mensajeError.isEmpty() ) {
	%>
		<div id="error"><p> ERROR: 
		<%= mensajeError %>
		</p></div>
	<%
	} else { %>
		<div id="exito"><p> INFO: NOTA CREADA</p></div>
<%
	}
} 
//mostramos formulario
%>



<script type="text/javascript">
//Situa el cursor en el campo de titulo
window.onload = function(){
  document.getElementById("titulo").focus();
}

function validacion() {  
	//COMPLETAR
}
</script>
<div id="crear">
	<h1>Crear nota</h1>
	<div id="formcrear">
		<form method="post" action="">
		<div class="titulo-div">
			<label for="titulo"><strong>T&iacute;tulo de la nota</strong></label>
			<input id="titulo" type="text" value="" name="titulo" maxlength="100"></input>
		</div>
		<div class="imagen-div">
			<label for="imagen"><strong>URL de la imagen</strong></label>
			<input id="imagen" type="text" value="" name="imagen"></input>
		</div>
		<div class="nota-div">
			<label for="nota"><strong>Nota</strong></label>
			<textarea id="nota" name="nota" cols="100%" rows="100%"></textarea>
		</div>
		<input class="boton" id="enviarnota" type="submit" value="Crear" name="enviarnota"></input>
		<input class="boton" id="limpiar" type="reset" value="Limpiar datos" name="limpiar"></input>
		</form>
		
	</div>
</div>


<%@include file="pie.jsp" %>
<% } %>
