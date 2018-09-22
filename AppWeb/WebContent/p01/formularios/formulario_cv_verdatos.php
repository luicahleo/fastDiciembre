<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recogida datos formulario: FAST</title>
</head>
<body>
<p> Se reciben los datos de formulario_cv.html y se procesan con php</p>

<?php
$nombre=$_POST["nombre"];
$apellidos=$_POST["apellidos"];
$contrasena=$_POST["contrasena"];
$sexo=$_POST["sexo"];
$empleo=$_POST["empleo"];
$suscribir=$_POST["suscribir"];

echo "El nombre es: $nombre<br>";
echo "Los apellidos son $apellidos<br>";
echo "La contraseña es  $contrasena<br>";
echo "El sexo es $sexo<br>";
echo "El empleo es: $empleo<br>";
echo "El valor de suscribir es : $suscribir<br>";
?>

</body>

</html>
