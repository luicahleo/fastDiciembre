function muestraFormAcceso() {
	document.getElementById("formacceso").style.display = "block";
	document.getElementById("usu").focus();
	document.getElementById("botAcceso").style.display = "none";
}

function ocultaFormAcceso() {
	document.getElementById("formacceso").style.display = "none";
	document.getElementById("botAcceso").style.display = "";



}

window.addEventListener("load", function() {//al cargar la página(index imagino)...:
	document.getElementById("botAcceso").addEventListener("click", muestraFormAcceso);
//Hace que se ejecute la funcion muestraForAcceso cuando se hace click en el elemento con id "botAcceso"
document.getElementById("cancelar").addEventListener("click", ocultaFormAcceso);


});
