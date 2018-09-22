#include <stdio.h>
#include <stdlib.h>
#define MAXLEN 80
#define DATAFILE "/home/dit/datos_alumno.txt"

int main(void)
{
 char *lenstr;
 char input[MAXLEN+1];
 long len;

 FILE *fout;
 int error = 0;

 printf("Content-Type:text/html\n\n");
 printf("<html>\n<head>\n");
 printf("<title>Ejercicio 2: Formulario CGI y Leng. C</title>\n");
 printf("</head>\n<body>\n");

 lenstr = getenv("CONTENT_LENGTH");

 if(lenstr == NULL || sscanf(lenstr,"%ld",&len)!=1 || len > MAXLEN)
  printf("<p>Error en formulario.</p>");

 else {
   if ((fout = fopen(DATAFILE, "w")) == NULL)
   {
     printf("<p>Error de escritura de datos.</p>\n");
     error=1;
    }
    else {

     fgets(input, len+1, stdin);
     fputs(input, fout);

     fclose(fout);
     printf("<p>Datos escritos correctamente.</p>\n");
     error=0;
    }
 }

 printf("</body>\n");
 printf("</html>\n");

 return error;
}
