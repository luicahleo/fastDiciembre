<%@ page session="true" %>
<%
  java.util.Hashtable<String,String> direcciones=
  	(java.util.Hashtable<String,String>) application.getAttribute("direcciones");

  if (direcciones==null)
    direcciones=new java.util.Hashtable<String,String>();
    direcciones.put(request.getRemoteAddr(),"");
    application.setAttribute("direcciones", direcciones);
%>

<html> 
 <body> El servidor fue accedido desde las siguientes direcciones IP:
  <br>
  <% 
    java.util.Enumeration<String> e=direcciones.keys(); 
    while (e.hasMoreElements()) 
    {
     %>
      <%= e.nextElement() %>
      <br>
      <%
      }
     %>
  </body> 
</html>

