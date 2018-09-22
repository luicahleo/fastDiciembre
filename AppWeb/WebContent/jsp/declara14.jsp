<%!
 private String isEmptyCart() {
	return "No hay nada";
}
%>

<%!
public void jspinit() {
	numeroAccesos=0;
}
%>

<!DOCTYPE html>

<html> 
 <body>
  <p>
  <%! int numeroAccesos=150; %> 
  <%="La pagina ha sido accedida "+(++numeroAccesos)+ 
     " veces desde el arranque del servidor" %> 
  </p>
  <p>
  <%="El carrito está vacío: " + isEmptyCart()%>
  </p>
 </body> 
</html>
