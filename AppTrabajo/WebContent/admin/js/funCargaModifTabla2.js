"use strict";

window.addEventListener("load", function(){iniciaTablas(function(ident, elementos) {
	rellenaTabla(ident, elementos);//rellena tabla como marca el nombre
	modificaTabla(ident, 3, 2, "asigna IP", "ipForm.jsp");//function modificaTabla(ident,colsElim,colsEnviar,nuevaCol,url)
})});

