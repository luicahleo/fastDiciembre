// funIp.js	DE MANU, para el boton llamando a pedirRedesURL
"use strict";

function procesaIp(cadena) {
	var sinesp = cadena.trim(); // Elimina los espacios al principio y al final.
	var ip = sinesp.split(".");
	var resul = 0;
	
	if(ip.length != 4)
		resul = -1;
	else for(var i=0;i<ip.length;i++){
		if( /\D/.test(ip[i]) || ip[i] == "")
			resul = -2;
	}
	if(resul == 0) {
		for(i=0;i<ip.length;i++){	
			if(ip[i] < 0 || ip[i] > 255)
					resul=-3;
			}
		if(resul == 0){
			resul = "";
			for(i=0;i<ip.length;i++){
				resul = resul + parseInt(ip[i],10);
				if(i != 3)
					resul=resul+".";
			}
		}
	}
	
	return resul;	
}

function ipToBin(cadena) {
	var ipBin = "";
	var ip = cadena.split(".");
	for(var i=0;i<ip.length;i++){
		var num = parseInt(ip[i],10).toString(2);
		var z = 8 - num.length;
		while(z > 0){
			num = "0"+num;
			z--;
		}
		ipBin = ipBin + num;
	}
	return ipBin;
}


function validaFormulIp() {
	var direccion = document.getElementById("ip").value;
	var mascara = document.getElementById("mask").value;
	var gateway = document.getElementById("gw").value;
	var ip;
	var gw;
	var devuelve = false;
	
	if( (ip=procesaIp(direccion)) == -1)
		alert("Error en Dirección IP: no contiene sólo tres puntos");
	else if(ip == -2)
		alert("Error en Dirección IP: no contiene cuatro campos sólo numéricos");
	else if(ip == -3)
		alert("Error en Dirección IP: contiene números fuera de rango");
	else if( (gw=procesaIp(gateway)) == -1)
		alert("Error en Dirección IP pasarela: no contiene sólo tres puntos");
	else if(gw == -2)
		alert("Error en Dirección IP pasarela: no contiene cuatro campos sólo numéricos");
	else if(gw == -3)
		alert("Error en Dirección IP pasarela: contiene números fuera de rango");
	else {
		var i=0;
		var igual = true;
		var ipB = ipToBin(ip);
		var gwB = ipToBin(gw);
		while(i<ipB.length && igual == true){
			if(ipB[i] != gwB[i])
				igual = false;
			else
				i++;
		}
		if(i>=mascara)
			devuelve=true;
		else
			alert("Error: no pertenecen a misma subred");
	}
	return devuelve;	
}


function creaFila(ip) { 
	var cadena = "<tr> <td>"+ ip.ip +"</td> <td>"+ ip.masc +"</td> <td>"+ ip.ip_gw +"</td> </tr>";
	
	return cadena;
	
}

function mostrarRedes(redes) {
	
	var t = document.querySelector("table");//consigue la tabla
	for(var i=0; i<redes.length;i++){
		var tabla = t.tBodies[0].innerHTML;//esto es una bonita fumada
		var fila = creaFila(redes[i]);
		t.tBodies[0].innerHTML = tabla + fila;
	}
	
	// Eliminar las tablas con hacer click
	var long = t.rows.length;
	for(var i=1;i<long;i++){
		t.rows[i].onclick = function(){
			this.parentNode.removeChild(this);
		};
	}
	
	if( (document.querySelector("table").rows.length) == 1)//si solo hay una fila...
		document.getElementById("mostrar").innerHTML = "Mostrar Redes";//Cojo el botón y lo pongo a mostrar redes
	else if( (document.querySelector("table").rows.length) > 1)//Si tiene mas de una fila
		document.getElementById("mostrar").innerHTML = "Ocultar Redes";//cambio el boton a ocultar redes
}


function pedirRedesURL() {

	if( (document.querySelector("table").rows.length -1) == 0){ // -1 porque tiene en cuenta la cabecera
		var ip = procesaIp(document.getElementById("ip").value);
	
		if(typeof ip == "string"){ // Si l valor del campo Dirección IP es correcto: (( IGUAL NO ES ASÍ ))
			var xmlhttp;
			var txt;
			xmlhttp= new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					txt = JSON.parse(xmlhttp.responseText);
					mostrarRedes(txt);
				}
			}
			xmlhttp.open("GET", "mostrarRedes?ip="+ip , true);
			xmlhttp.send();
		}
	}
	else{
		document.querySelector("table").tBodies[0].innerHTML="";
		document.getElementById("mostrar").innerHTML = "Mostrar Redes";
	}
		
	
	
	
}

function inicial() {
	document.getElementById("mostrar").addEventListener("click",pedirRedesURL);
	document.getElementById("formIp").onsubmit = function(){return validaFormulIp()} ;
}

window.onload = inicial;

