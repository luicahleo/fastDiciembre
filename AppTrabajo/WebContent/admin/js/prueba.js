"use strict";



function creaFila() {//recibe un objeto con 3 campos(array), donde el primero es la ip, máscara y ip de pasarela y devuelve el html para rellenar una tabla
	var arraii=["192.168.1.34", "24", "192.168.1.1" ];
	var ip;	
	var nuevafila= "<tr><td>";
	var str;
	str = nuevafila + arraii[0] + "</td>" + "<td>" + arraii[1] + "</td>" + "<td>" + arraii[2] + "</td></tr>";

	return str;

}



function getTableFromTxt(){
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       // Typical action to be performed when the document is ready:
       document.getElementById("demo").innerHTML = this.responseText;
    }
};
xhttp.open("GET", "../data/direcciones.json", true);

xhttp.send();//qué hace esto
//document.getElementById("demo").innerHTML = xhttp.responseText;//sería tan facil como esto?
}


function mostrarRedes(redes) {//redes es una tabla de los elementos del archivo txt


}

