<%@ page contentType='text/html;charset=UTF-8'%>
<%@ page import='java.util.Date' %>

<!DOCTYPE html>

<html>
 <head><title>Hola Mundo</title></head>
 <body>
  <h1>Hola, esto es una página JSP</h1>
  <%@ include file="cabecerah2.html"  %>
  <p>La hora del servidor es <%= new Date() %></p>
 </body>
</html>
