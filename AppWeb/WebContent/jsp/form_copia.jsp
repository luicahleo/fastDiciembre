<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

