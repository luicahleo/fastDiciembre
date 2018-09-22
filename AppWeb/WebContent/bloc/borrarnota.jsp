<%--FJFJ--%>
<%@ page language="java" import="java.sql.*"%>
<%
//Verificamos que estamos en una sesion
if(session.getAttribute("usuario")!=null) {
    // Creamos respuesta en formato JSON 
    // Hay que obtener los campos nota y urlimagen de la nota 
    //   con id=(el pasado en la peticion)
    String mensajeError = "";
    
    //Mientras tanto enviamos una respuesta de ejemplo
    out.println("{ \"id\":\"" + request.getParameter("id") + "\", \"error\":\"POR HACER\" }");
}
%>
