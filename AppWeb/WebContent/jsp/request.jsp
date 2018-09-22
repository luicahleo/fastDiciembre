<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>HTTP Header Request</title>
</head>
<body>
<h2>Cabeceras en la petición HTTP</h2>
<table border="1">
<tr>
<th>Header Name</th><th>Header Value(s)</th>
</tr>
<%
   Enumeration<String> nombresCabecera = request.getHeaderNames();
   while(nombresCabecera.hasMoreElements()) {
      String nombreCab = (String)nombresCabecera.nextElement();
      out.print("<tr><td>" + nombreCab + "</td>\n");
      String valorCab = request.getHeader(nombreCab);
      out.println("<td> " + valorCab + "</td></tr>\n");
   }
%>
</table>
</body>
</html>