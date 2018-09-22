"use strict";
/**
 * Elimina las últimas colummnas de una fila
 * @param pFila objeto del DOM asociado a la fila
 * @param nCols número de columnas a eliminar (empezando por el final)
 * @returns
 */
function elimCols(pFila,nCols) {//Va borrando columnitas, celdas cada una
	/* TODO MODIFICAR */
	 for(var i=0; i<nCols;i++)//va borrando columnas
		 pFila.deleteCell(pFila.getElementsByTagName("td").length-1);//borra una célula
	 
//Revisar porque no funciona
	 //La idea es que te llegue el número de fila de la que quieres borrar nCols casillas y eliminas esas de una única fila
}

/**
 * Elimina varias columnas de una tabla, y añade una columna con un elemeto <a href=url?col1...
 * @param ident identificador de la tabla
 * @param colsElim número de columnas a eliminar (empezando por el final)
 * @param colsEnviar número de valores a enviar (empezando por la primera columna)
 * @param nuevaCol texto de la columna añadida
 * @param url URL del href de la columna añadida
 * @returns
 */
function modificaTabla(ident,colsElim,colsEnviar,nuevaCol,url) {
	var selectorFilas = "table#"+ident+" tr";//selecciona una tabla por su id
 	var pFilas  = document.querySelectorAll(selectorFilas); //pfilas[0] es la cabecera, pfilas array de las filas de la tabla
 	 	
 	// se eliminan columnas
	/* TODO MODIFICAR */
	 for(var i = 0; i < pFilas.length; i++)
		 elimCols(pFilas[i], colsElim);	

 	// se añade una columna al resto de las filas
	/* TODO MODIFICADO */
 	pFilas[0].innerHTML+="<th>"+nuevaCol+"</th>";
 	
	 var tablaCab=pFilas[0].getElementsByTagName("th"); // contiene los elementos de la cabecera

 	for (var i=1; i < pFilas.length; i++) { // i empieza en 1, a cada fila después de la cabecera
 		/* TODO MODIFICAR */
 		 var tablaFila=pFilas[i].getElementsByTagName("td");
 		// contiene los elementos de la fila i

		var col='<td><a href="'+url+'?';
 		for (var j=0;j<colsEnviar;j++) { 
 			col+=tablaCab[j].innerHTML+"="+tablaFila[j].innerHTML; // el nombre se coge de la cabecera y el valor de la fila
 			if (j<(colsEnviar-1)) {
 				col+="&";
 				}
 		}
 		col+='">' + nuevaCol + '</a></td>';  // nuevaCol es el contenido de <a>
 		pFilas[i].innerHTML+=col;
 	}	
}

/**
 * Construye un String con el HTML correspondiente a una cabecera de una tabla a partir de un objeto JSON.
 * Usa los nombres de las propiedades del objeto.
 * @param objeto objeto JSON para tomar los nombres de sus propiedades
 * @returns código HTML de una cabecera como un String
 */
function rellenaCabecera(objeto) {//Sólo rellena cabeceras recordar!!
  /* TODO MODIFICAR */
	 var cad = "<thead>";
	 for (var i in objeto)//i valdra ip, gw, mask etc... i toma los valores de los campos del objeto, recordar!
		 cad += "<th>" + i + "</th>"; //Aquí imprimes la clave del objeto JSON, no su valor
	 cad += "</thead>";
	 return cad;


}

/**
 * Construye un String con el HTML correspondiente a una fila de una tabla a partir de un objeto JSON.
 * Usa los valores de las propiedades del objeto.
 * @param objeto objeto JSON para tomar los valores de sus propiedades
 * @returns código HTML de una fila como un String
 */function rellenaFila(objeto) {
	  var fila = "<tr>"; 
	  for (var clave in objeto)
	    fila += "<td>" + objeto[clave] + "</td>"; // se van añadiendo celdas a fila con el valor de la propiedad //Objeto clave te accede al objeto cuya clave corresponde
	  fila += "</tr>";
	  return fila;
}			

/**
 * Rellena una tabla vacía a partir de un Array de objetos JSON
 * Los valores de la cabecera los obtiene de los nombres de las propiedades del primer objeto
 * Los valores de las filas los obtiene de los valores de los objetos
 * @param identif identificador de la tabla
 * @param elementos Array de objetos JSON donde cada elemento representa una fila
 * @returns
 */function rellenaTabla(identif, elementos) {//identif==id de la tabla, elementos==JSON(tabla de elementos)
	var pTabla = document.getElementById(identif); //se localiza la tabla por su identificador
	pTabla.innerHTML+="<thead>" + rellenaCabecera(elementos[0]) + "</thead>"; // se rellena la cabecera thead
	var pFila="<tbody>";                           // pFila va a contener el HTML correspondiente a tbody
  	for (var i = 0; i < elementos.length; i++){
  		 /* TODO MODIFICADO */
 		 // se van añadiendo filas a pFila
  		pFila+= rellenaFila(elementos[i]);
  	}
  	pTabla.innerHTML+= pFila + "</tbody>";         // se rellena el cuerpo con todas las filas y tbody
}

/**
 * Realiza una petición AJAX y los datos devueltos (en formato JSON) se los pasa a otra función,
 * junto con el primer parámetro.
 * Se usa para solicitar los datos a un servlet y con el resultado se rellena una tabla.
 * La URL del servlet coincide con el identificador de la tabla. 
 * @param url_identif URL de la petición (y primer parámetro que se pasa a la función llamada)
 * @param fun función llamada con el primer parámetro y los datos devueltos
 * @returns
 */function procesaDatosURL(url_identif, fun) {//hace una peticio JSON
    var elementos;
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    	  elementos = JSON.parse(xmlhttp.responseText);//xmlhttp.responseText coge el JSON del response del servlet y lo procesa
    	  fun(url_identif, elementos); // fun==rellenaTabla, le da el id de la tabla y el objeto JSON
      }
    };
    xmlhttp.open("GET", url_identif, true);
    xmlhttp.send();
}
 
 /**
  * Recorre todas las tablas de la página y para cada una llama a la función procesaDatosURL
  * con el identificador y la función recibida como parámetro (sólo si tiene identificador).
  * Se supone que las tablas están vacías y que el identificador coincide
  * con la URL del servlet que devuelve los datos para rellenar la tabla.
  * La función que se recibe como parámetro es la que finalmente procesa los datos recibidos mediante AJAX.
  * Esa función es la que rellena la tabla, y en algún caso la modifica
  * @param funInic función con 2 parámetros que debe procesar los datos devueltos
  * @returns
  */
 function iniciaTablas(funInic) {//funInic==rellenaTabla
 	var pTablas = document.getElementsByTagName("table"); // Array con todas las tablas
 	var identificador = "";                               // para almacenar el identificador de la tabla
 	for (var i = 0; i < pTablas.length; i++) {            // si no hay tablas, la longitud es 0 y no entra en el bucle
 		identificador = pTablas[i].id;
 		if (identificador != "")                          // si la tabla tiene identificador
 			procesaDatosURL(identificador, funInic);//funInic ==rellenatabla
 	}

 }


