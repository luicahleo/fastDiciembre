// objetos-01.js
"use strict";
var miobjeto = new Object();
var suobjeto = new Object();

// Notación "abreviada"
var tuobjeto = {};

// definiendo la propiedad
miobjeto.id="A001";
tuobjeto.name="Ana";

// accediendo a las propiedades
alert(miobjeto.id+": "+ tuobjeto.name);

// creando métodos: funcion no definida previamente,
miobjeto.muestraId = function () {
  alert(this.id); 
}
// Invocando el método
miobjeto.muestraId();

// asignado una función definida previamente
// Para asignar una función externa al método de un objeto, 
// basta indicar el nombre de la función sin paréntesis. 

function muestraName() {
  alert(this.name);
}
tuobjeto.muestraName = muestraName;
//suobjeto.muestranombre = muestraName;


tuobjeto.name="Pablo";
tuobjeto.muestraName();

suobjeto.name="Pepe";
suobjeto.muestranombre();

// Nota: método no tiene por qué llamarse igual que función






