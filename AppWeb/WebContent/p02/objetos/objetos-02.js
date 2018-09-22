// Creamos nuestra función constructora
"use strict";
function Impresora (id, color){
  this.id=id;
  this.color=color;
  this.muestraId = function(){
    alert(this.id + this.color);
   // alert(this.color);
   };   
};

// Definido el constructor, se crea objeto 
//  con llamada  a new con función constructora
var laser = new Impresora("GH-Laser1345", "azul");
// uso del método y la propiedad
laser.muestraId();
alert("Id de la impresora: " + laser.id);

// segundo objeto con la misma clase
var tintaColor = new Impresora("DEF-Color-4500","rojo");
tintaColor.muestraId();

