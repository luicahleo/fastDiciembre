<html>
  <body>
   <br/><br/>
   Su IP: <%=request.getRemoteAddr()%>
   <br/>
   Su Puerto: <%=request.getRemotePort()%>
   <br/>
   Su nombre de host: <%= request.getRemoteHost() %>
   <br/>
   Valor del m�todo: <%= request.getMethod() %>
   <br/>
   Valor del QueryString: <%= request.getQueryString() %>
  </body>
</html>
