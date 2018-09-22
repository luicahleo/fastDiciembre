<%@page pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Recogida datos formulario: FAST</title>
</head>
<body>
<p> Se reciben los datos rápidamente y se procesan con jsp</p>
<ul>
  <li>El usuario es: ${param.usu}</li>
  <li>La contraseña  primera  es: ${param.contra1}</li>
  <li>La contraseña  repetida es: ${param.contra2}</li>
</ul>
</body>
</html>
