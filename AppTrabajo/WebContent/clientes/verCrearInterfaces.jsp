<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8" />
	<title>Interfaces</title>
	<link rel="stylesheet" href="../css/estilos.css" />
	<script type="text/javascript" src="js/funTablasURL.js"></script>
	<script type="text/javascript" src="js/funCargaTablas.js"></script>
	<script type="text/javascript" src="js/funMuestraForm.js"></script>
	<%-- COMPLETAR added--%>
	<script src="../cgi-bin/jscgi"></script>


</head>
<body>
	<%-- COMPLETAR Added--%>
	<jsp:include page="../cabecera.jsp" />


	<div id="contenedor">
		<h1>Ver/crear Interfaces</h1>
		<h2 class="warning">Tabla de interfaces</h2>
		<table class="interfaces" id="verInterfaces"><!--Al ser id verInterfaces se supone que llama al servlet ServletVerInterfaces.java -->
		</table>
		<div id="crear">
			<p>
				<button id="bNueva">Añadir interfaz</button><!-- donde viene el addEvent? en funMuestraForm-->
			</p>
			<div id="crearInterno" class="oculto">
				<form action="nuevaInterfaz" method="post" id="crearForm"><!--Aqui empieza el form  -->
					<table>
						<tr>
							<td><label for='equipo'>Equipo:<br> <select name='equipo' id='equipo'>
							</select></label></td>
							<td><label for='tipo'>Tipo: <br><select name='tipo' id='tipo'>
									<%//Scriptlets
									@SuppressWarnings("unchecked")
									Map<Integer, String> tipos_in = (Map<Integer, String>) application.getAttribute("tipos_in");//Como funciona exactamente
									for (Map.Entry<Integer, String> entry : tipos_in.entrySet()) {//TODO
										// MODIFICAR Puede usar getKey() y getValue()
										   out.print("<option value='" + entry.getKey()+"'>" + entry.getValue() +"</option>");//!!

									}
									%>
								</select></label></td>
							<td><label for='interfaz'>interfaz:<br>
							<input type='number' id='interfaz' name='interfaz' required="required" />
							</label>
							</td>
							<td><input type="submit" value="Enviar" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<%-- COMPLETAR-->completado --%>
	<%@include file="../pie.jsp"%>

</body>
</html>
