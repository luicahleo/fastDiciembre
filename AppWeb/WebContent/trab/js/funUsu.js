// funUsu.js 
"use strict";

function validaFormuUsu() {
	
	var resultado= 0;
	var lonMin = 6;
    var minNum = 2;
    var minMayus = 2;
    var minMinus = 2;
    var nomUsu = document.getElementById("usu").value;
    var pass = document.getElementById("contra1").value;
    var pass2 = document.getElementById("contra2").value;
    var comprueba = compruebaContra(pass, lonMin, minNum, minMayus, minMinus, nomUsu);
  
    switch(comprueba){
    case 0:
    	if(pass != pass2){
  		alert("Error: contraseña debe ser igual en los dos campos");
  		resultado= false;}
  		break;
	case -1:
		alert("Error: debe tener una longitud mínima de 6 caracteres");
	    resultado= false;
	    break;
	case -2:
		alert("Error: debe contener al menos dos caracteres numéricos");
	    resultado= false;
	    break;
	case -3:
		alert("Error: debe contener al menos dos caracteres en mayúsculas");
	    resultado= false;
	    break;
	case -4:
		alert("Error: debe contener al menos dos caracteres en minúsculas");
	    resultado= false;
	    break;
	case -5:
		alert("Error: no debe contener el nombre de usuario");
	    resultado= false;
	    break;
	default:
		resultado= true;
	}
	return resultado;	
}

function compruebaContra(pass, lonMin, minNum, minMayus, minMinus, nomUsu) {
	
/*	var nomUsu = document.getElementById("usu").value;
    var pass = document.getElementById("contra1").value;
    var pass2 = document.getElementById("contra2").value;
    
	var numeros = 0;
	var mayusculas = 0;
	var minusculas = 0;
	var str = "Hello";
	var arr = str.split("");
	var text = "";
	var i;
	for (i = 0; i < arr.length; i++) {
    	text += arr[i]
	}
	document.getElementById("demo").innerHTML = text[3];

	for(var i = 0; i < text.lenght; i++){
		if(text[i]=="H"){
			numeros++;}
    	if("A"<=text[i]<="Z"){
			mayusculas++;}
    	if("a"<=text[i]<="z"){
			minusculas++; }
}        
	
*/	var resultado= 0;
	var numeros = pass.match(/[0-9]/g);//sacamos un array con la cantidad de numeros que tiene la pass
	var mayusculas = pass.match(/[A-Z]/g);//sacamos un array con la cantidad de Mayusculas que tiene la pass
	var minusculas = pass.match(/[a-z]/g);//sacamos un array con la cantidad de Minusculas de la pass
					
	mayusculas = mayusculas.length;
	minusculas = minusculas.length;


	if (pass.length < lonMin)
		resultado= -1;
    else if(minNum > numeros)
	    resultado= -2;
    else if(minMayus > mayusculas)
	    resultado= -3;
    else if(minMinus > minusculas)
	    resultado= -4;
    else if(pass.includes(nomUsu))
	    resultado= -5;
    else
	    resultado= 0;
	
	return resultado;
}

function inicial() {
	
	var x = document.getElementById("formUsu");
	x.onsubmit= function (){ return validaFormuUsu()};
}

window.onload = inicial;


