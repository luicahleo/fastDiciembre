<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>Formulario JSP</title>
</head>
<body>

<form> 
  <input type="text" name="parametro1" value="valor por defecto"/> 
  <br/>
  <input type="password" name="clave"/> 
  <br/> 
  <textarea name="parametro2">Texto por defecto</textarea> 
  <br/> 
  <select name="selectMultiple" multiple="multiple"> 
    <option value="1">Uno</option> 
    <option>Dos</option> 
    <option>Tres</option> 
    <option>Cuatro</option> 
  </select>
  <input type="submit"/> 
</form>

  <h2>Valor de:</h2>
  <p>parametro1: <%= request.getParameter("parametro1") %> </p><br/> 
  <p>parametro2: <%= request.getParameter("parametro2") %> </p><br/> 
  <p>clave:  <%= request.getParameter("clave") %> </p><br/> 
  <p>selectMultiple:</p>
  <% 
   String[] seleccion= request.getParameterValues("selectMultiple"); 
   if (seleccion!=null) {
   	for (int i=0;i<seleccion.length;i++) 
   	{ 
   	%> 
   	<%= seleccion[i] %>
   	<br/> 
   	<% 
   	}
   }
  	%> 
</body>
</html>

