<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Ejercicio básico JSP</title>
<style>
	table {
		border:1px solid #ccc;	
		font-family:sans-serif;
		text-align:center;		
	}
	
	table td {
			
	}
</style>
</head>
<body>
<table>
<tr>

<%!
static final int TAM = 4;
double potencia(double v1, double v2) {
	return Math.pow(v1, v2);
}
%>

<%
	for (int i=1; i<=TAM; i++) {
		out.print("<tr>");
		for (int j=1; j<=TAM; j++) {
			int entero = (int) potencia(i,j);
			out.print("<td>"+ entero+ "</td>");
		}
		out.print("</tr>");
	}
	
%>
</tr>
</table>
</body>
</html>