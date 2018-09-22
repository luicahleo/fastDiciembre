/*FJFJ*/
function inicioFormQuiz() {
	document.getElementById("tipo").onchange = function() {
		var tipoSeleccionado = this.value;
		if ( tipoSeleccionado == 2 || tipoSeleccionado == 4 ) {
			document.getElementById("numero-elementos").style.display="inline";
		} else {
			document.getElementById("numero-elementos").style.display="none";
		}
	  };
	document.getElementById("generar").onclick = function() {
		var res = true;
		var elementoTipo = document.getElementById("tipo");
		
		//Comprobar si han seleccionado un tipo de elemento
		if( elementoTipo.value == 0) {
			alert('Debes seleccionar un tipo de elemento');
			elementoTipo.focus();
			res = false;
		} else {
			//Comprobar si han seleccionado un tipo de elemento
			var elementoNombre = document.getElementById("nombre");
			if( elementoNombre.value == "" ) {
				alert('Debes introducir un nombre de elemento');
				elementoNombre.focus();
				res = false;
			} else {
				//Comprobar el número de elementos si se ha elegido el tipo 2 o 4
				if ( elementoTipo.value == 2 || elementoTipo.value == 4 ) {
					var elementoNumElem = document.getElementById("numElementos");
					if ( elementoNumElem.value < 1 || elementoNumElem.value > 5 ) {
						alert('El número de elementos debe ser un número comprendido entre 1 y 5');
						elementoNumElem.focus();
						res = false;
					}
				}
				
			}
			
		}
		
		
		if (res)
			document.getElementById("form").submit();
		
		return res;
	  };
}
