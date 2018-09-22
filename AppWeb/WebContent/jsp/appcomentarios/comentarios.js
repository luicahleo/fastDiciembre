/*FJFJ*/

//constantes
const PETICION_COMPLETADA = 4;
const PETICION_OK = 200;

//Variables globales
totalComentarios = 0;
ultComentarioObtenido = 0;
timerSondeo = null;
sondeoEnCurso = false;

//Codificación de cadenas, del navegador al servidor
// Para evitar problemas con los caracteres UTF-8
//Más información https://developer.mozilla.org/en-US/docs/Web/API/Window.btoa
function utf8_to_b64( str ) {
	//escape() codifica caracteres especiales
	//encodeURIComponent codifica más caracteres especiales
	//btoa comvierte la cadena en base64
    return window.btoa(encodeURIComponent( escape( str )));
}

//Decodificación de cadenas, del servidor al navegador
//Para evitar problemas con los caracteres UTF-8
function b64_to_utf8( str ) {
	//Se hace lo inverso a utf8_to_b64
    return unescape(decodeURIComponent(window.atob( str )));
}

//Petición AJAX GET
//peticion - URL de la solicitud HTTP
//funcionRespuesta - función a llamar cuando termine la petición
//parametro - parámetro adicional que hay que enviar a la función para que
// esta sepa a qué petición se refiere
function ajax(peticion, funcionRespuesta, parametro) {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET",peticion,true);
	xmlhttp.onreadystatechange = function(){ 
		if ( xmlhttp.readyState==PETICION_COMPLETADA ) { 
			if (xmlhttp.status==PETICION_OK) {
				//Respuesta recibida completamente (4) y sin
				//errores del servidor (codigo HTTP 200) 
				//Cambiamos página con la respuesta
				funcionRespuesta(xmlhttp, parametro);
			} else {
				funcionRespuesta(null, parametro);
			}
			
		}
	  };
	
	xmlhttp.send(); //enviamos
}

//Petición AJAX POST
//peticion - URL de la solicitud HTTP
//datosPost - Parámetros a pasar mediante POST (tipo formulario)
//funcionRespuesta - función a llamar cuando termine la petición
//parametro - parámetro adicional que hay que enviar a la función para que
//esta sepa a qué petición se refiere
function ajaxPost(peticion, datosPost, funcionRespuesta, parametro) {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST",peticion,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.onreadystatechange = function(){ 
		if ( xmlhttp.readyState==PETICION_COMPLETADA ) { 
			if (xmlhttp.status==PETICION_OK) {
				//Respuesta recibida completamente (4) y sin
				//errores del servidor (codigo HTTP 200) 
				//Cambiamos página con la respuesta
				funcionRespuesta(xmlhttp, parametro);
			} else {
				funcionRespuesta(null, parametro);
			}
			
		}
	  };
	
	xmlhttp.send(datosPost); //enviamos
}

//Función para acortar las llamadas a getElementById
function elem(id) {
	return document.getElementById(id);
}


function enviarComentario() {
	var autor = elem("autor").value;
	var comentario = elem("texto").value;
	//Generamos la URL de la petición
	//IMPORTANTE, los campos se envían codificados en base64, para que los
	// caracteres no ascii no den problemas
	var peticion = "insertar.jsp";
	var datosPost="autor="+utf8_to_b64(autor)+"&texto="+utf8_to_b64(comentario);
	//Ocultamos el estado del último envio
	elem("resultadoEnvio").style.visibility="hidden";
	//Enviamos la petición. El resultado se informará a la función resultadoEnvio
	ajaxPost(peticion, datosPost, resultadoEnvio, null); 
	
}

function resultadoEnvio(xmlHttp, parametro) {
	if (xmlHttp == null) {
		//Envío incorrecto
		elem("resultadoEnvio").innerHTML="<p class='error'>Envío incorrecto</p>";
	} else {
		//Envío correcto
		elem("resultadoEnvio").innerHTML="<p class='info'>Envío correcto</p>";
		
	}
	elem("resultadoEnvio").style.visibility="visible";
}


function iniciarSondeo() {
	elem("boton").onclick=enviarComentario;
	//Si se pulsa intro en el campo texto, se envia el comentario inmediatamente también
	elem("texto").onkeypress=function(event) {
		if (event.keyCode == 13)
			enviarComentario();
		};
	timerSondeo=setInterval(sondeo, 1000);
		
}

function sondeo() {
	if (!sondeoEnCurso) {
		sondeoEnCurso=true;  //Evitamos que se pidan simultaneamente
							 //antes de terminar de recibir comentarios
		pedirTotal();
		recibirComentarios();
	}
}

function pedirTotal() {
	ajax("getTotal.jsp", resultadoTotal, null);
}

function resultadoTotal(xmlHttp, parametro) {
	if (xmlHttp != null) {
		totalComentarios = parseInt(xmlHttp.responseText.trim(), 10);
		elem("total").innerHTML=totalComentarios;
	}
}

function recibirComentarios() {
	//Inicia la recepción de comentarios
	//Comprobamos si hace falta obtener comentarios
	if ( totalComentarios > ultComentarioObtenido ) {
		elem("cargando").style.visibility="visible";
		//Intentamos obtener el siguiente comentario
		var peticion = "recuperar.jsp?id="+(ultComentarioObtenido+1);
		ajax(peticion, resultadoRecibir, ultComentarioObtenido+1 );
	} else {
		//Hemos terminado de recibir comentarios
		elem("cargando").style.visibility="hidden";
		sondeoEnCurso=false;
	};
}

function resultadoRecibir(xmlHttp, id) {
	if (xmlHttp != null) {
		ultComentarioObtenido = id;
		//Escribimos HTML
		var xmlDoc = xmlHttp.responseXML;
		
		var txt=xmlDoc.getElementsByTagName("texto")[0].childNodes[0].nodeValue;
		var autor=xmlDoc.getElementsByTagName("autor")[0].childNodes[0].nodeValue;
		var fecha=xmlDoc.getElementsByTagName("fecha")[0].childNodes[0].nodeValue;
		
		var divNuevo = document.createElement("div");
		divNuevo.className="divComentario";
		//IMPORTANTE, los campos se reciben codificados en base64, para que los
		// caracteres no ascii no den problemas (menos el campo fecha)
		divNuevo.innerHTML="<span class='autor'>"+b64_to_utf8(autor)+"</span>"+
						   "<span class='fecha'>"+fecha+"</span>"+
						   "<span class='comentario'>"+b64_to_utf8(txt)+"</span>";
		var comentarios = elem("comentarios");
		comentarios.insertBefore(divNuevo,comentarios.firstChild);
		//Volvemos a pedir
		recibirComentarios();
	}
};


