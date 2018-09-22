<html>
<head>
<title>Formulario JSP</title>
</head>

<body>

  <form action="procesa_form.jsp"> 
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
</body>
</html>

