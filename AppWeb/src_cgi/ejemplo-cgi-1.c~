#include <stdio.h>
#include <stdlib.h>
int main()
{
 printf("Content-Type:text/html\n\n");
 printf("<!DOCTYPE html>\n");
 printf("<html>\n<head>\n<meta charset='UTF-8'>\n");
 printf("<title>CGI en c</title>\n");
 printf("</head>\n");
 printf("<body>\n");
 printf("<h1>Página Web generada por CGI y programa en c</h1>\n");
 //printf("<h2>Mi nombre</h2>\n");
 printf("<p>Puerto:    %s</p>\n", getenv("SERVER_PORT"));
 printf("<p>Datos GET: %s</p>\n", getenv("QUERY_STRING"));
 printf("</body>\n");
 printf("</html>\n");

 return 0;
}

