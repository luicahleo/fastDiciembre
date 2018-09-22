// funIp.js	MIO
"use strict";

function procesaIp(cadena) {// codigo (improved and corrected)
	cadena = cadena.toString();// nos aseguramos que es string
	var str = cadena.trim();// le quitamos los espacios iniciales y finales
	var i;
	var j;
	var cont = 0;
	var ip;
	var maxi = "255";
	var mini = "000";
	var numNumero = "";

	ip = str.split('.');// ip=array de los elementos que hay separados por
	// puntos
	str = "";

	if (ip.length != 4) {// comprobamos que hay 4 elementos==3puntos
		return -1;
	}

	for (i = 0; i < ip.length; i++) {
		numNumero = ip[i].match(/[0-9]/g);
		if (numNumero == null) {
			return -2;
		} else if (numNumero.length != ip[i].length) {
			return -2;
		}

		if (parseInt(mini) > parseInt(ip[i])
				|| parseInt(maxi) < parseInt(ip[i]))// aqui comprobamos que el
			// bloque de numeros está
			// entre 0 y 255; Duda
			// comparar numeros en forma
			// de cadenas;
			return -3;
		ip[i] = (parseInt(ip[i])).toString();
		str += ip[i] + ".";
	}
	str = str.substring(0, str.length - 1);

	return str;
}

function ipToBin(cadena) {
	var chain = cadena.split(".");
	var i;
	var def = "";
	for (i = 0; i < chain.length; i++) {
		chain[i] = (parseInt(chain[i])).toString(2).padStart(8, 0);
		chain[i] = chain[i].toString();
		def = def.concat(chain[i]);
	}
	return def;
}

function validaFormulIp() {
	var end = true;
	var subred = true;
	var ip = document.forms["formIp"]["ip"].value;
	var mask = document.forms["formIp"]["mask"].value;
	var gate = document.forms["formIp"]["gw"].value;
	var bin_ip;
	var bin_gw;
	var i = 0;

	switch (procesaIp(ip)) {
	case -1:
		alert("Error en Dirección IP: no contiene sólo tres puntos");
		end = false;
		break;
	case -2:
		alert("Error en Dirección IP: no contiene cuatro campos sólo numéricos");
		end = false;
		break;
	case -3:
		alert("Error en Dirección IP: contiene números fuera de rango");
		end = false;
		break;
	default:
		if (procesaIp(ip) < 0) {
			end = false;
		}
		break;
	}

	if (end != false) {
		switch (procesaIp(gate)) {
		case -1:
			alert("Error en Dirección IP pasarela: no contiene sólo tres puntos");
			end = false;
			break;
		case -2:
			alert("Error en Dirección IP pasarela: no contiene cuatro campos sólo numéricos");
			end = false;
			break;
		case -3:
			alert("Error en Dirección IP pasarela: contiene números fuera de rango");
			end = false;
			break;
		default:
			if (procesaIp(gate) < 0) {
				end = false;
			}
			break;
		}
	}
	if (end == true) {
		bin_ip = ipToBin(ip);
		bin_gw = ipToBin(gate);
		for (i = 0; i < mask; i++) {
			if (bin_ip[i] != bin_gw[i]) {
				end = false;
				subred = false;
			}
		}
		if (subred == false) {

			alert("Error: no pertenecen a misma subred");
		}
	}
	return end;
}

// //////////////PARTE AJAX /////////////////
function creaFila(ip) {// ip es un objeto con los tres parametros abajo especificados
	var nuevafila = "<tr><td>";
	var str;

	str = nuevafila + ip.ip + "</td>" + "<td>" + ip.masc + "</td>" + "<td>"
			+ ip.ip_gw + "</td></tr>";

	return str;
}

function mostrarRedes(redes) {// codigo 
	var i;
	var format = "<thead><tr><th>IP</th><th>Mask</th><th>Gw</th></tr></thead>";//formato tabla nueva
	var fila = "";
	var selector;
	var red = redes.length;
	var tabla = document.getElementsByTagName("table")[0];
	
	//cambiar el boton!!
	if (tabla.rows.length==1 && red>0) {
		document.getElementById('mostrar').innerHTML = "<input type='button' onclick='pedirRedesURL' value='Ocultar Redes'>";
		
		for (i = 0; i < red; i++) {
			fila = creaFila(redes[i]);
			format += fila;
		}
		document.getElementsByTagName("table")[0].innerHTML = format;
		
		var tr = document.getElementsByTagName("tr");
		// i=!;
		for (i = 1; i < tr.length; i++) {
			tr[i].addEventListener("click", function() {
				this.parentNode.removeChild(this);
				
				if(tr.length==1 && red>0){
					document.getElementById('mostrar').innerHTML = "<input type='button' onclick='pedirRedesURL' value='Mostrar Redes'>";
				}
				
			});
		}
	}//Fin del if
	
	else{
		document.getElementById('mostrar').innerHTML = "<input type='button' onclick='pedirRedesURL' value='Mostrar Redes'>";//Para cambair el boton
		tabla
		document.getElementsByTagName("table")[0].innerHTML = format;
		
	
	}

}

function pedirRedesURL() {// codigo 
	var tabla;
	var visual;
	var llenado = 0;
	tabla = document.getElementsByTagName("table")[0];

		// título) entonces cambia el valor del
		// boton y muestra la tabla
		
		ip = procesaIp(document.forms["formIp"]["ip"].value);
		if (typeof (ip) == 'string') {
			// //////Peticion Ajax//////////
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					visual = JSON.parse(xhttp.responseText);

					mostrarRedes(visual);
				}
			};
			xhttp.open("GET", "mostrarRedes?ip="+ip, true);// !!!!!!!!!!!Con parámetro

			xhttp.send();
			// ////////Fin Peticion AJAX
		}
	

}

function inicial() {
	  
	  var x = document.getElementById("formIp");  
	  x.onsubmit= function (){ return validaFormulIp()};
	  
	  var y = document.getElementById("mostrar");
	  y.addEventListener("click", function (){ pedirRedesURL();});
	  
	}

	window.onload = inicial;