<%! int numeroAccesos=0; %> 

<!DOCTYPE html>

<html> 
 <body>
  <p>
  <%= "La pagina ha sido accedida "+(++numeroAccesos)+ 
      " veces desde el arranque del servidor" %>
  </p> 
 </body> 
</html>

