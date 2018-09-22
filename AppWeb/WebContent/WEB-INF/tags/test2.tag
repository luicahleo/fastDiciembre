<%@ tag language="java" pageEncoding="UTF-8" 
	body-content="scriptless"
	description="Etiqueta para Test de FAST" 
	display-name="Test FAST" trimDirectiveWhitespaces="true"%>
<%@ attribute name="nombre" 
	description="Nombre del test" 
	required="true"
	type="java.lang.String" %>

<jsp:useBean id="now" class="java.util.Date" />

<jsp:useBean id="numTest" class="fast.IntegerBean" scope="request"/>
<%-- Incrementamos el número de test --%>
<jsp:setProperty property="value" name="numTest" value="${numTest.value+1}"/>

<div id='${nombre}'>
	<h3 class="underline">Test de FAST ${numTest.value}: ${nombre}</h3>
	<h4>Fecha: ${now}</h4>
	<hr />
	<%-- Incorporamos el cuerpo de la etiqueta (se podría procesar) --%>
	<jsp:doBody/>
	<hr />
</div>
