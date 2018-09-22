<%@ taglib uri="/WEB-INF/tlds/ejemploWeb.tld" prefix="ejemploWeb"%>
<!DOCTYPE html>
<HTML>
<BODY>

	<H2>
		<ejemploWeb:hola atrhola="Sr." />
	</H2>

	<hr />
	<p>Texto entre etiquetas</p>
	<hr />
	
	<H2>
		<ejemploWeb:adios atrad="2" atrad2="${param.numero}">
	    Dentro
	</ejemploWeb:adios>
	</H2>
</BODY>
</HTML>