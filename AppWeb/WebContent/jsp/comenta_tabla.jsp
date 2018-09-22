<html> 
  <body> 
   <table> 
   <!-- Este comentario HTML se ve en el navegador
        inspeccionando el código -->
    <%-- empieza el bucle para la tabla
         este comentario no llega al navegador --%>
    <% for (int i=0;i<10;i++) 
     { 
    %> 
      <!-- esto es una fila de la tabla -->
      <tr><td> <%=i%> </td></tr> 
    <% } %> 
   </table>
  </body> 
</html>

