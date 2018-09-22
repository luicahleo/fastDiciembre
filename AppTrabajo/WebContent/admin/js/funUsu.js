// funUsu.js de Guille; para el boton llama al servlet directamente
"use strict";

function validaFormuUsu() {
  var	lonMin = 6;
  var	minNum = 2;
  var	minMayus = 2;
  var	minMinus = 2;
  var	nomUsu = document.forms["formUsu"]["usu"].value;
  var	pass = document.forms["formUsu"]["contra1"].value;
  var	pass2 = document.forms["formUsu"]["contra2"].value;
  var comprueba = compruebaContra(pass, lonMin, minNum, minMayus, minMinus, nomUsu);

  if(comprueba == 0){
	if(pass != pass2){
		alert("Error: contraseña debe ser igual en los dos campos")
		return false;
	}

  }		
  else if(comprueba == -1){
	alert("Error: debe tener una longitud mínima de 6 caracteres")
	return false;
  } else if(comprueba == -2){
	alert("Error: debe contener al menos dos caracteres numéricos")
	return false;
  } else if(comprueba == -3){
	alert("Error: debe contener al menos dos caracteres en mayúsculas")
	return false;
  } else if(comprueba == -4){
	alert("Error: debe contener al menos dos caracteres en minúsculas")
	return false;
  } else if(comprueba == -5){
	alert("Error: no debe contener el nombre de usuario")
	return false;
  } else
	return true;
	
		
}

function compruebaContra(pass, lonMin, minNum, minMayus, minMinus, nomUsu) {
  var numNumero = pass.match(/[0-9]/g);//sacamos un array con la cantidad de numeros que tiene la pass
  var  numMayus = pass.match(/[A-Z]/g);//sacamos un array con la cantidad de Mayusculas que tiene la pass
  var numMinus = pass.match(/[a-z]/g);//sacamos un array con la cantidad de Minusculas de la pass
	
  if (Array.isArray(numNumero))//si es un array tiene como mínimo 2 elementos, alright men
	numNumero = numNumero.length;
  else
	return -2;

  if(Array.isArray(numMayus))
	numMayus = numMayus.length;
  else
	return -3;

  if(Array.isArray(numMinus))
	numMinus = numMinus.length;
  else
	return -4;
	

  if (pass.length < lonMin)
	return -1;
  else if(2 > numNumero)
		return -2;
  else if(2 > numMayus)
		return -3;
  else if(2 > numMinus)
		return -4;
  else if(pass.includes(nomUsu))
	return -5;
  else
	return 0;
}

function inicial() {
	  
	  var x = document.getElementById("formUsu");
	  x.onsubmit= function (){ return validaFormuUsu()};
	}

	window.onload = inicial;
