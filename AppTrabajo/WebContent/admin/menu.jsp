<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Menú administrador</title>
  <%-- COMPLETAR —--%>
  <link href="css/estilos.css" rel="stylesheet" />
  <script src="cgi-bin/jscgi "></script>
  <!-- la cabecera hay que incluirla smp en plan jsp:include. hay que cambiarlo en todos los sitios. a ver si descubro como se hace la vd -->
  <jsp:include page="../cabecera.jsp" />
  


</head>
<body>
  <%-- COMPLETAR —--%>

  <div id="contenedor">
    <h1>Menú administrador</h1>
    <ul>
      <li><a href="admin/verUsuarios.jsp"          >Ver usuarios</a></li>
      <li><a href="admin/usuForm.jsp"              >Crear/modificar usuarios</a></li>
      <li><a href="clientes/verCrearInterfaces.jsp">Ver/crear interfaces (de todos los usuarios)</a></li>
      <li><a href="clientes/verEquipos.jsp"        >Ver todos los equipos (de todos los usuarios)</a></li>
      <li><a href="admin/asigIpIntSinAsignar.jsp"  >Asignar direcciones IP</a></li>
      <li><a href="admin/asigIpCualquiera.jsp"      >Asignar direcciones IP a cualquier interfaz</a></li>
    
    </ul>
  </div>
  <%-- COMPLETAR —--%>

<%@include file="../pie.jsp"%>
</body>
</html>