<!--//////////////////////////////// -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../cabecera.jsp"%>
<!-- //////////////////////// -->
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>IP</title>
<link href="../css/estilos.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/funIp.js"></script>

<script src="../cgi-bin/jscgi"></script><!--añadido  -->

</head>
<body>
<div id="contenedor">
<h1>Gestión de IPs</h1>
<p>Introducción de datos para dar de alta <span class="revisando">o comprobar existencia</span> direcciones IP.</p>
<section class="col-2"><h2 class="entrada">Alta/comprobación IP</h2>
<!--Comienza el formulario....Cada campo estará compuesto por un párrafo que contendrá un elemento label y un elemento input (del
mismo nivel, hermanos), que estarán ligados entre sí con el atributo for¿the heck?-->


<form method="get" name="formIp" id="formIp" action="modificarIp"> <!--onsubmit="inicial()">-->

<p><label for="equipo">Equipo<br></label>
<input name="equipo" id="equipo" type="text" value="${param.id_eq}" readonly>
<br></p>

<p><label for="Interfaz">Interfaz<br></label>
<input name="interfaz" id="interfaz" type="text" value="${param.num_in}" readonly>
<br></p>


<p><label for="ip">Dirección IP<br></label>
<input name="ip" id="ip" type="text" size="16" maxlength="15" placeholder="A.B.C.D" required>
<br></p>
<p><label for="mask">Máscara<br></label>
<input name="mask" id="mask" type="number" min="8" max="30" value="24" required>
<br></p>
<p><label for="gw">Dirección IP pasarela<br></label>
<input name="gw" id="gw" type="text" size="16" maxlength="15" value="192.168.1.1">
<br></p>
<!-- el formulario se debe enviar a modificarIp (en vez de a muestraIp.jsp y sin extensión jsp), para
que se ejecute el servlet ServletModificarIp. -->
<p><input type="submit" value="Enviar"><input type="reset" value="Limpiar"></p>
</form>
<br>
<p id="mostrar"><input type="button" onclick="pedirRedesURL" value="Mostrar Redes"></p><!-- pedirRedesURL -->
</section>

<section class="col-2">
<h2 class="warning">Tabla redes</h2>
<p>Esta tabla se rellena al pulsar el botón "Mostrar".</p>
<p class="revisando">Se oculta pulsando el mismo botón que cambia de texto. Al pulsar sobre las filas de la tabla se elimina</p>

<table>
  <thead>
  <tr>
    <th>IP</th>
    <th>Mask</th>
    <th>Gw</th>
  </tr>
  </thead>
<tbody>

</tbody>
</table>
</section>

<%@include file="../pie.jsp"%></div>
</body>
</html>
