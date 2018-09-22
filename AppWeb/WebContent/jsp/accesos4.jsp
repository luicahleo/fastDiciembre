<%! int numeroAccesos=150; %> 

<%!
 private String isEmptyCart() {
	return "No hay nada";
}
%>

<%!
public void jspInit() {
	numeroAccesos=0;
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

