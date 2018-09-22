#include <stdio.h>
#include <stdlib.h>

//Fichero de dato almacenado
#define DATAFILE "/home/dit/contador.txt"

int main(void) {
	int contador = 0;       //Contador de accesos
	FILE *fcontador;        //Fichero para leer/escribir el contador.

	//Leer el contador
	fcontador = fopen(DATAFILE, "r");
	if (fcontador != NULL) {

		fscanf(fcontador, "%d", &contador);

		fclose(fcontador);
	}
	contador++;
	//Actualizar contador
	fcontador = fopen(DATAFILE, "w");
	if (fcontador != NULL) {

		fprintf(fcontador, "%d\n", contador);

		fclose(fcontador);
	} else {
		fprintf(stderr, "Registro - no puedo abrir el archivo.\n");
	}

	//Generar contenido
	printf("Content-Type: text/ecmascript\n\n");
	printf("var contador=%d\n", contador);
	printf("var cookies='%s'\n", getenv("HTTP_COOKIE"));

	// TODO
	// MODIFICAR
	printf("window.addEventListener('load', function() {var salida = document.getElementById('pie');"
	      "salida.innerHTML += '<p><strong>Contador</strong>=' +contador+"
	                    "          '</p><p><strong>Cookies:</strong></p>'+'<p>' +cookies+ '</p>';"
	                    "});");
	return 0;
}

