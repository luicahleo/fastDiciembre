<html>
  <body>
   <br/><br/>
   Su IP: <%=request.getRemoteAddr()%>
   <br/>
   Su Puerto: <%=request.getRemotePort()%>
   <br/>
   Su nombre de host: <%= request.getRemoteHost() %>
  </body>
</html>
