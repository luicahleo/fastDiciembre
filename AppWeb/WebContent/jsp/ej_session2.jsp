<%@ page import="java.io.*,java.util.*" %>

<%@ page session="true" %> 

<%
 java.util.ArrayList<String> accesos=
	(java.util.ArrayList<String>) session.getAttribute("accesos");
 if (accesos==null)
   accesos=new java.util.ArrayList<String>();
 
 accesos.add(new java.util.Date().toString());
 session.setAttribute("accesos", accesos);
 
 if (request.getParameter("invalidaSesion")!=null)
   session.invalidate();
 
%>

<html>
  <body>
    <form>
      <input type="submit" name="invalidaSesion" value="Invalidar sesion"/>
      <input type="submit" value="Recargar pagina"/>
    </form>
    <br/>
    Usted accedio a esta pagina en los siguientes momentos: <br />
    <%
     for (int i=0;i<accesos.size();i++)
     {
    %>
    <%= accesos.get(i) %>
    <br />
    <% 
     }
    %>
  </body>
</html>

