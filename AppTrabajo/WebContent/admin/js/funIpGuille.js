// funIp.js
"use strict";

function procesaIp(cadena) {
	var cadena = cadena.trim();
	var datos = cadena.split(".");
	var i;
	if (datos.length != 4)
		return -1;
	for (i = 0; i < datos.length; i++) {
		if (isNaN(datos[i]) == true || datos[i] == "")
			return -2;
		else if (datos[i] < 0 || datos[i] > 255)
			return -3;
	}
	for (i = 0; i < datos.length; i++) {
		datos[i] = parseInt(datos[i]);
	}

	cadena = datos[0] + "." + datos[1] + "." + datos[2] + "." + datos[3];
	return cadena;
}

function ipToBin(cadena) {
	var datos = cadena.split(".");
	var i;
	var num;
	var bin;
	var result;

	for (i = 0; i < datos.length; i++) {
		num = parseInt(datos[i]);
		bin = (num >>> 0).toString(2);
		while (bin.length < 8)
			bin = "0" + bin;
		result = result + bin;
	}

	return result.substr(9);
}

function validaFormulIp() {
	var ip = document.forms["formIp"]["ip"].value;
	var gw = document.forms["formIp"]["gw"].value;
	var mask = document.forms["formIp"]["mask"].value;
	ip = procesaIp(ip);
	gw = procesaIp(gw);

	if (ip == -1)
		alert("Error en Dirección IP: no contiene sólo tres puntos");
	else if (ip == -2)
		alert("Error en Dirección IP: no contiene cuatro campos sólo numéricos");
	else if (ip == -3)
		alert("Error en Dirección IP: contiene números fuera de rango");

	if (gw == -1)
		alert("Error en Dirección IP pasarela: no contiene sólo tres puntos");
	else if (gw == -2)
		alert("Error en Dirección IP pasarela: no contiene cuatro campos sólo numéricos");
	else if (gw == -3)
		alert("Error en Dirección IP pasarela: contiene números fuera de rango");

	var ipBin = ipToBin(ip);
	var gwBin = ipToBin(gw);

	// var binMask = "1".repeat(mask);
	var ipMask = ipBin.substring(0, mask);
	var gwMask = gwBin.substring(0, mask);

	if (ipMask != gwMask)
		alert("Error: no pertenecen a misma subred");

}

function creaFila(ip) {
	var fila

	fila = "<tr><td>" + ip.ip + "</td>" + "<td>" + ip.masc + "</td>" + "<td>"
			+ ip.ip_gw + "</td></tr>";

	return fila;
}

function mostrarRedes(redes) {
	var formato = "<thead><tr><th>IP</th><th>Mask</th><th>Gw</th></tr></thead>";
	var selector;
	
	if (document.getElementById('mostrar').innerHTML == "Ocultar Redes") {
		document.getElementsByTagName("table")[0].innerHTML = formato;
		document.getElementById('mostrar').innerHTML = "Mostrar Redes";
	} else {
		for (var i = 0; i < redes.length; i++) {
			var fila = creaFila(redes[i]);
			formato += fila;
		}
		document.getElementsByTagName("table")[0].innerHTML = formato;//Pone la tabla
		var tr = document.getElementsByTagName("tr");

		for (i = 0; i < tr.length - 1; i++) { // Eliminar tablas con click
			tr[i].addEventListener("click", function() {
				this.parentNode.removeChild(this);
			});
		}
	}

	if (tr.length == 1) {
		document.getElementById('mostrar').innerHTML = "Mostrar Redes";
	} else {
		document.getElementById('mostrar').innerHTML = "Ocultar Redes";
	}

}

function pedirRedesURL() {
	var tabla;
	var visual;
	var llenado = 0;
	var ip;
	tabla = document.getElementsByTagName("table")[0];

	ip = document.forms["formIp"]["ip"].value;
	// AJAX
	if (procesaIp(ip) == ip) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				visual = JSON.parse(xhttp.responseText);

				mostrarRedes(visual);
			}
		};
		xhttp.open("GET", "mostrarRedes?ip=" + ip, true);

		xhttp.send();
	}
}

function inicial() {
	document.getElementById("mostrar").addEventListener("click", pedirRedesURL);
	document.getElementById("formIp").onsubmit = function() {
		return validaFormulIp()
	};
}

window.onload = inicial;
