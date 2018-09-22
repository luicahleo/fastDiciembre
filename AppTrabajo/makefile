
CC = gcc
CFLAGS = -g -W -Wall
DIR_DESTINO = WebContent/WEB-INF/cgi
DIR_TOMCAT = ~/tomcat/webapps/AppTrabajo/WEB-INF/cgi
DIR_SRC = src_cgi

all: $(DIR_DESTINO)/jscgi
	cp $(DIR_DESTINO)/* $(DIR_TOMCAT)
	chmod +x $(DIR_TOMCAT)/*


$(DIR_DESTINO)/jscgi: $(DIR_SRC)/jscgi.c
	$(CC) $(CFLAGS) -o $@ $^


clean:
	rm  $(DIR_DESTINO)/jscgi

	