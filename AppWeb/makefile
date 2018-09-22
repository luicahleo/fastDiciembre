
CC = gcc
CFLAGS = -g -W -Wall
DIR_DESTINO = WebContent/WEB-INF/cgi
DIR_TOMCAT = ~/tomcat/webapps/AppWeb/WEB-INF/cgi

all: $(DIR_DESTINO)/ejemplo-cgi-1.cgi \
	 $(DIR_DESTINO)/ejemplo-cgi-2.out \
	 $(DIR_DESTINO)/ejemplo-cgi-3.out \
	 $(DIR_DESTINO)/ejemplo-cgi-4.out \
	 $(DIR_DESTINO)/ejemplo-cgi-5.out \
	 $(DIR_DESTINO)/mostrar-entorno.html
	cp $(DIR_DESTINO)/* $(DIR_TOMCAT)
	chmod +x $(DIR_TOMCAT)/*


$(DIR_DESTINO)/ejemplo-cgi-1.cgi: src_cgi/ejemplo-cgi-1.c
	$(CC) $(CFLAGS) -o $@ $^

$(DIR_DESTINO)/ejemplo-cgi-2.out: src_cgi/ejemplo-cgi-2.c
	$(CC) $(CFLAGS) -o $@ $^

$(DIR_DESTINO)/ejemplo-cgi-3.out: src_cgi/ejemplo-cgi-3.c
	$(CC) $(CFLAGS) -o $@ $^

$(DIR_DESTINO)/ejemplo-cgi-4.out: src_cgi/ejemplo-cgi-4.c
	$(CC) $(CFLAGS) -o $@ $^

$(DIR_DESTINO)/ejemplo-cgi-5.out: src_cgi/ejemplo-cgi-5.c
	$(CC) $(CFLAGS) -o $@ $^

$(DIR_DESTINO)/mostrar-entorno.html: src_cgi/mostrar-entorno.c
	$(CC) $(CFLAGS) -o $@ $^


clean:
	rm  $(DIR_DESTINO)/ejemplo-cgi-1.cgi \
	 	$(DIR_DESTINO)/ejemplo-cgi-2.out \
	 	$(DIR_DESTINO)/ejemplo-cgi-3.out \
	 	$(DIR_DESTINO)/ejemplo-cgi-4.out \
	 	$(DIR_DESTINO)/ejemplo-cgi-5.out \
	 	$(DIR_DESTINO)/mostrar-entorno.html

	