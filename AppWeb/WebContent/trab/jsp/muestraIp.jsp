<%@page pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Recogida datos formulario: FAST</title>
</head>
<body>
<p> Se reciben los datos y se presentan con jsp</p>
<ul>
  <li>Dirección IP: ${param.ip}</li>
  <li>Longitud de máscara: ${param.mask}</li>
  <li>Dirección IP pasarela: ${param.gw}</li>
</ul>
</body>
</html>
