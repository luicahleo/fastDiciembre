<html>
<head>
<title>Contador de visitas 2</title>
</head>
<body>
<%
    Integer contador = 
      (Integer)application.getAttribute("cuentaVisitas");
    if( contador ==null || contador == 0 ){
       /* Primera visita */
       out.println("ˇBienvenido a mi website!");
       contador = 1;
    }else{
       /* Siguientes visitas */
       out.println("ˇBienvenido de nuevo a mi website!");
       contador++;
    }
    application.setAttribute("cuentaVisitas", contador);
%>
<p>Numero total de visitas: <%= contador%></p>
</body>
</html>
