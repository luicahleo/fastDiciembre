#!/usr/bin/python3
import os

print("Content-Type:text/html\n\n")
print("<!DOCTYPE html>\n")
print("<html>\n<head>\n<meta charset='UTF-8'>\n")
print("<title>CGI en python</title>\n")
print("</head>\n")

print("<h1>P&aacutegina Web generada por CGI y programa en python</h1>")
print("<p>Puerto:    "+os.getenv("SERVER_PORT", default="")+"</p>")
print("<p>Datos GET: "+os.getenv("QUERY_STRING", default="")+"</p>")
print("</body>\n")
print("</html>\n")
