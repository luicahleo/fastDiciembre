<html>
  <body>
   <form>
     <input type="text" name="nombrePara"/>
     <input type="submit"/>
   </form>
   <br/><br/>
   Su IP: <%=request.getRemoteAddr()%>
   <br/>
   Su nombre de host: <%= request.getRemoteHost() %>
   <br/>
   Valor del par�metro: <%= request.getParameter("nombrePara") %>
  </body>
</html>
