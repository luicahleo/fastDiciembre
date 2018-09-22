<%! int numeroAccesos=0; %> 

<%!
 private String isEmptyCart() {
	return "No hay nada";
}
%>

<!DOCTYPE html>

<html> 
 <body>

  <%= 
     "La pagina ha sido accedida "+(++numeroAccesos)+ 
     " veces desde el arranque del servidor" 
  %> 
  <%=
  	"El carrito está vacío: " + isEmptyCart()
  %>
  
 </body> 
</html>

