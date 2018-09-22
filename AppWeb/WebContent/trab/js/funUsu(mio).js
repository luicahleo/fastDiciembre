// funUsu.js 
"use strict";

function validaFormulUsu() {
	
	var resultado=true;
	var contra=document.getElementById("contra").value;
	var a=compruebaPass(contra,"8","15");
	switch(a){
	case -1:
		alert("Error: debe tener una longitud mínima de 6 caracteres");
	      resultado=false;
	      break;
	case -2:
		alert("Error: debe contener al menos dos caracteres numéricos");
		  resultado=false;
		  break;
	case -3:
		alert("Error: debe contener al menos dos caracteres en mayúsculas");
		  resultado=false;
		  break;
	case -4:
		alert("Error: debe contener al menos dos caracteres en minúsculas");
		  resultado=false;
		  break;
	case -5:
		alert("Error: no debe contener el nombre de usuario");
		  resultado=false;
		  break;
	default:
		return resultado;
	}
	
	
}

function compruebaContra(pass, lonMin, minNum, minMayus, minMinus, nomUsu) {
	
	var resultado=0;
	var numeros=0;
	var mayusculas=0;
	var minusculas=0;
	
	
	for(var i=0;i<pass.lenght();i++){
		if(0<=i<=9)
			numeros++;
		if(A<=i<=Z)
			mayusculas++;
		if(a<=i<=z)
			minusculas++;
		
		
	}
	
	if(pass.lenght<lonMin){
		resultado =-1;
	} else if(numeros<minMun){
		resultado=-2;
	} else if(mayusculas<minMayus){
		resultado=-3;
	} else if(minusculas<minMinus){
		resultado=-4;
	} else if (pass.includes(nomUsu)) {
		resultado=-5;
	}
	
	return resultado;
}

function inicial() {
	
	var valido = validaFormuUsu()
	return valido;
}

window.onload = inicial;
