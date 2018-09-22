<%
  java.util.HashSet<String> direcciones=
  	(java.util.HashSet<String>) application.getAttribute("direcciones");

  if (direcciones==null){
    direcciones=new java.util.HashSet<String>();
    application.setAttribute("direcciones", direcciones);
  }
  direcciones.add(request.getRemoteAddr());
  
%>

<html> 
 <body> El servidor fue accedido desde las siguientes direcciones IP:
  <br>
  <% 
    java.util.Iterator<String> e=direcciones.iterator(); 
    while (e.hasNext()) 
    {
     %>
      <%= e.next() %>
      <br>
      <%
      }
     %>
  </body> 
</html>

