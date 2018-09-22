<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Eliminacion de Cookies</title>
</head>
<body>
<h1>Eliminacion de Cookies</h1>

<%
   Cookie cookie = null;
   Cookie[] cookies = null;

   cookies = request.getCookies();
   if( cookies != null ){
      out.println("<h2> Cookies encontradas:</h2>");
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];

	 //Eliminamos la cookie "first_name"
         if((cookie.getName( )).compareTo("first_name") == 0 ){
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            out.print("Cookie eliminada: " + 
            cookie.getName( ) + "<br/>");
         }
         out.print("Nombre : " + cookie.getName( ) + ",  ");
         out.print("Valor: " + cookie.getValue( )+" <br/>");
      }
  }else{
      out.println(
      "<h2>No se encontraron cookies</h2>");
  }
%>
</body>
</html>
