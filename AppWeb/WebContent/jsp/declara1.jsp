<%! int numeroAccesos=0; %> 

<%!
 private String isEmptyCart() {
	return "No hay nada";
}
%>

<!DOCTYPE html>

<html> 
 <body>
  <p>
  <%="La pagina ha sido accedida "+(++numeroAccesos)+ 
     " veces desde el arranque del servidor" %> 
  </p>
  <p>
  <%="El carrito est� vac�o: " + isEmptyCart()%>
  </p>
 </body> 
</html>

