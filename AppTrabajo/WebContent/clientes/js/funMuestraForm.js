"use strict";

/**
 * Muestra el formulario (que tiene id crearInterno), que está inicialmente oculto, y rellena el elemento select (que tiene id equipo)
 * con los valores de la primera columna de la tabla (que tiene id verInterfaces).
 * Si hay elementos repetidos sólo los pone una vez.
 * @returns
 */function muestraFormulario() {//donde esta el elemento con id crearInterno??
	 
	if (crearInterno.style.display!="block") {              // si el elemento con id crearInterno no está visible (para sólo hacerlo una vez)
		var selectorFilas = "table#verInterfaces tr";    // para seleccionar las filas de la tabla con identificador verInterfaces;Devuelve un array?
		var pFilas = document.querySelectorAll(selectorFilas); //pfilas[0] es la cabecera

		var sel = document.getElementById("equipo");        // selector que hay que rellenar con los equipos de la tabla

		var equipos = [];                                   // va a contener los equipos sin repetir
		for (var i = 1; i < pFilas.length; i++) {           // i empieza en 1, a cada fila después de la cabecera
			var equipo = pFilas[i].children[0].textContent; // el texto de la primera columna de la fila i
			if (equipos.indexOf(equipo)==-1 )               // sólo añade si no está (equipos contendrá los elementos no repetidos)
				equipos.push(equipo);                       // se añade el texto de la primera columna
		}


		var txt = '';                                       // va a contener el HTML con todos los elementos option
		for (var i = 0; i < equipos.length; i++) {          // equipos contiene los elementos sin repetir
			/* TODO MODIFICAR modificado, but... sure? */
			 txt +='<option value="'+ equipos[i]+'">'+ equipos[i] + '</option>';

		}
		sel.innerHTML = txt;                                // se rellena el elemento select
		crearInterno.style.display="block";                 // hace visible el elemento (y así además no vuelve a entar en el if)
		bNueva.style.display="none";                        // oculta el botón de añadir
	}

}

// Hace que cuando se termine de cargar la página se asocie la función muestrFormulario con el evento onclick del botón de Añadir Interfaz
window.addEventListener("load", function() {bNueva.onclick = muestraFormulario;})//bNueva es el boton de añadir interfaces
