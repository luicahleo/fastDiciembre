#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Tamano maximo del mensaje introducido en el formulario HTML:
#define MAXLEN 80

//EXTRA: valor del campo "dataX" del formulario mas "="
#define EXTRA 6

// Datos del formulario (uno de los campos)
#define MAXINPUT MAXLEN+EXTRA
// Datos del formulario (dos campos + separador)
#define TOTALINPUT (MAXLEN+EXTRA)*2+1

//Fichero de salida
#define DATAFILE "/home/dit/datos5.txt"


//Funcion para convertir caracteres no alfanumericos dentro de codigo HTML.
//Codigos HTML (hexadecimal): http://www.ascii.cl/htmlcodes.htm
void descodifica(char *cini, char *cfin, char *dest);


int main(void)
{
  char *lenstr;
  char input[TOTALINPUT+1];
  char input_orig[TOTALINPUT+1];
  char data1[MAXLEN+1];
  char data2[MAXLEN+1];
  long len;
  FILE *fout;
  char *p;

  printf("Content-Type:text/html\n\n");
  printf("<html>\n<head>\n");
  printf("<title>Almacen de datos</title>\n");
  printf("</head>\n<h1>Almacen de datos</h1>\n");
  printf("<body>\n");

  //Obtenemos la longitud de la peticion POST:
  lenstr = getenv("CONTENT_LENGTH");

  if(lenstr == NULL || sscanf(lenstr,"%ld",&len)!=1 || len > TOTALINPUT)
    printf("<p>Error en la invocacion: revise el formulario.</p>");

  else
    {
      fgets(input, len+1, stdin);
      strcpy(input_orig, input);

      //Obtenemos el mensaje descodificado a partir de "data1="...
      p = strtok (input,"&");
      descodifica(p+EXTRA, p+strlen(p), data1);

      //Obtenemos el mensaje descodificado a partir de "data2="...
      p = strtok (NULL,"&");
      descodifica(p+EXTRA, p+strlen(p), data2);

      fout = fopen(DATAFILE, "w");

      if(fout == NULL)
	printf("<p>No ha sido posible almacenar los datos.</p>");
      else
	{
	  //Almacenamos el mensaje en el fichero de salida:
	  fprintf(fout, "***************\nDatos codificados\n***************\n");
	  fprintf(fout, "%s\n", input_orig);

	  fprintf(fout, "\n\n***************\nDatos descodificados\n***************\n");
	  fprintf(fout, "data1: %s\n", data1);
	  fprintf(fout, "data2: %s\n", data2);

	  printf("<p>Datos almacenados.</p>");
	  fclose(fout);
	}
    }

  printf("</body>\n");
  printf("</html>\n");

  return 0;
}


//Funcion para convertir caracteres no alfanumericos dentro de codigo HTML.
void descodifica(char *cini, char *cfin, char *dest)
{
  unsigned int cod;
  
  for(; cini < cfin; cini++, dest++)
    {
      if(*cini == '+')
	*dest = ' ';
      
      else if(*cini == '%') {
	
	if(sscanf(cini+1, "%2x", &cod) != 1)
	  cod = '?';
	
	*dest = cod;
	cini +=2;
      }
      else
	*dest = *cini;
    }
  *dest = '\0';
}
