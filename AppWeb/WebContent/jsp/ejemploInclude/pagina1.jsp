<!DOCTYPE html>
<html>
<body>
<p>Uso de DIRECTIVA include con anexo.jsp<br/>
   El contador de esta p�gina (pagina1.jsp):<br/>
<%@ include file="anexo.jsp" %>
</p>
<p>Uso de ETIQUETA DE ACCI�N include con anexo.jsp<br/>
   El contador del anexo
   (cuenta tanto los accesos desde pagina1 como pagina2):<br/>
<jsp:include page="anexo.jsp" />
</p>
</body>
</html>
