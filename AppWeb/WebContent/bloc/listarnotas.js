
//Indica el id de la ultima nota cuyo detalle se ha mostrado
var ultid=-1;

//Esta funcion sirve para mostrar un mensaje mientras se obtienen los detalles
function mostrarEsperando(elemento) {
	var html = "<p><strong>Obteniendo detalles...</strong></p>"+
				"<img src='imagen/espera.gif' alt='Espera' />";
	elemento.innerHTML=html;
}
//Muestra los detalles obtenidos mediante AJAX.
//objetoDetalle, tiene que ser un objeto con las siguientes propiedades:
//	nota: texto de la nota
//	imagen: url de la imagen asociada a la nota
//  error: texto con el error producido al buscar los detalles de una nota
function mostrarDetalle(elemento, objetoDetalle) {
	if (objetoDetalle.error != null && objetoDetalle.error !="") {
		//error
		elemento.innerHTML="<p>Error: "+objetoDetalle.error+"</p>";
	} else {
		elemento.innerHTML=
			"<p class='textonota'>"+
			objetoDetalle.nota+"</p><p>"+
			"<img src='"+objetoDetalle.imagen+"' alt='Sin imagen' /><br />"+
			"<button class='boton' onclick='borrar(event, ultid);'>Borrar</button></p>";
	}
}

//Muestra informacion sobre la nota con el identificador pasado
function mostrar(id) {
	
	if (ultid > 0) {
		//Ocultamos el anterior detalle
		document.getElementById("detalle-"+ultid).style.display="none";
	}
	if (ultid == id)  //en este caso, no mostramos, solo ocultamos
		ultid = -1; 
	else {
		ultid = id;
		
		//Cambiamos el detalle
		var divDetalle = document.getElementById("detalle-"+ultid);
		mostrarEsperando(divDetalle);
		divDetalle.style.display="block"; //Hacemos visible

		//Peticion AJAX
		var peticion="detallenota.jsp?id="+ultid;
		//HACER CON AJAX. El resultado de detallenota.jsp es codigo JSON.
		//var detalleNota = JSON... //Crear variable, a partir de lo obtenido
		//mostrarDetalle(divDetalle, detalleNota);
		
	}
}

//Muestra informacion sobre la nota con el identificador pasado
function borrar(event, id) {
	
	//Para evitar que se oculte el detalle
	event.stopPropagation();
	
	if (ultid == id) { //en este caso, borramos
		
		
		//Peticion AJAX
		var peticion="borrarnota.jsp?id="+ultid;
		//HACER CON AJAX. El resultado de borrarnota.jsp es codigo JSON.
		//var resultadoBorrar = JSON... //Crear variable, a partir de lo obtenido
		//procesarResultadoBorrar(resultadoBorrar);
		
	}
	
}

//Procesa resultados de borrar obtenidos mediante AJAX.
//resultadoBorrar, tiene que ser un objeto con las siguientes propiedades:
//	id: identificador numérico de la nota
//  error: texto con el error producido al borrar nota. 
//          Es una cadena vacía si se borró correctamente.
function procesarResultadoBorrar(resultadoBorrar) {
	//Si tiene mensaje de error, mostramos como mensaje emergente.
	if (resultadoBorrar.error) {
		alert(resultadoBorrar.error);
	} else {
		//Eliminamos elemento de la tabla
		var fila = document.getElementById("fila-"+resultadoBorrar.id);
		fila.parentNode.removeChild(fila);
		//cambiamos ultid
		ultid = -1;
	}
}

