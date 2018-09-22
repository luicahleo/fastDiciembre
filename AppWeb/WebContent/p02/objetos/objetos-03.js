// Creamos nuestra función constructora
function Impresora (id){
  this.id=id; 
};
Impresora.prototype.muestraId = function() {
    alert(this.id);
}


// Definido el constructor, se crea objeto 
//  con llamada  a new con función constructora
var laser = new Impresora("GH-Laser1345");
// uso del método y la propiedad
laser.muestraId();
alert("Id de la impresora: " + laser.id);

alert(laser instanceof Impresora) // muestra ‘true’

// segundo objeto con la misma clase
var tintaColor = new Impresora("DEF-Color-4500");
tintaColor.muestraId();




