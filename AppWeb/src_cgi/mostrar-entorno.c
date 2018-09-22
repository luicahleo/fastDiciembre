#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[], char *env[])
{
  int i;

  printf("Content-Type:text/html\n\n");
  printf("<!DOCTYPE html>\n");
  printf("<html>\n<head>\n");
  printf("<meta charset='UTF-8'>");
  printf("<title>Información de argumentos y entorno</title>\n");
  printf("</head>\n");
  
  printf("<body>\n");

  printf("<h1>Argumentos:</h1>\n");
  i=0;
  while (i<argc)
    {
      printf("<p>%d: %s</p>\n", i, argv[i]);
      i++;
    }
  
  printf("<h1>Variables de entorno:</h1>\n");
  i=0;
  while (env[i]!=NULL)
    {
      printf("<p>%d: %s</p>\n", i, env[i]);
      i++;
    }

  printf("<h1>Entrada estándar:</h1>\n<pre>\n");
  char *lenstr = getenv("CONTENT_LENGTH");
  if (lenstr!=NULL && strlen(lenstr)!=0 )
    {
      while ( (i = getchar()) != EOF )
        putchar(i);
    }
  printf("</pre>\n");
  printf("</body>\n");
  printf("</html>\n");

 return 0;
}

