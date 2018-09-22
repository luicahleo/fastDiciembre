<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="nombre" required="true"%>

<div id='${nombre}'>
	<h3 class="underline">Test de FAST: ${nombre}</h3>
	<hr />
	<jsp:doBody/>
	<hr />
</div>
