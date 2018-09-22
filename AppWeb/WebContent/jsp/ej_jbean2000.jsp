<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%-- jbean.jsp
  Ejemplo para mostrar el uso de un JavaBean siguiendo la
  convención de la especificación JavaBean
--%>
<html>
<head>
<title>Titulo del Ejemplo: Pagina JSP basada en JavaBeans</title>
</head>

<body>
<%-- Indicamos que se desea crear una instancia del objeto jspJB --%>
<jsp:useBean id="miBean" scope="page" class="ej_jbean.jspJB">
  <jsp:setProperty name="miBean" property="saludo" value="Nuevo" />
</jsp:useBean>
  
<h2>Ejemplo: Pagina JSP basada en JavaBeans</h2>
<p>Saludo inicial:<br>
  <%-- Se imprime el valor inicial de la propiedad Saludo --%>
  <jsp:getProperty name="miBean" property="saludo" />
<p>Saludo final:<br>
  <%-- Se fija e imprime un nuevo valor para la propiedad Saludo --%>
  <jsp:setProperty name="miBean" property="saludo" value="Adios" />
  <jsp:getProperty name="miBean" property="saludo" />
</body>
</html>

