<%@ page import="java.io.*,java.util.*" %>
<%
   // Obtenemos el instante de creacion
   Date createTime = new Date(session.getCreationTime());

   // Obtenemos el instante de ultimo acceso a la pagina
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Bienvenido a mi website";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");
   String userIDKey = new String("userID");
   String userID = new String("ABCD");

   // Comprobamos si el visitante es nuevo en la web
   if (session.isNew() || session.getAttribute(visitCountKey)==null ){
      title = "Bienvenido a una NUEVA session a mi website ";
      session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   } 
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount);
%>

<html>
<head>
<title><%= title %></title>
</head>

<body>

<h1>Seguimiento de sesión <%= title %></h1>
<table border="1"> 
<tr bgcolor="#949494">
   <th>Info de sesion</th>
   <th>Valor</th>
</tr> 
<tr>
   <td>id</td>
   <td><% out.print( session.getId()); %></td>
</tr> 
<tr>
   <td>Instante de creacion</td>
   <td><% out.print(createTime); %></td>
</tr> 
<tr>
   <td>Instante de ultimo acceso</td>
   <td><% out.print(lastAccessTime); %></td>
</tr> 
<tr>
   <td>ID de usuario</td>
   <td><% out.print(userID); %></td>
</tr> 
<tr>
   <td>Numero de visitas</td>
   <td><% out.print(visitCount); %></td>
</tr> 
</table> 

</body>
</html>

