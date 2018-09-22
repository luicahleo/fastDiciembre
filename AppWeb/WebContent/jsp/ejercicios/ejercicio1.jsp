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
	
	table td.par {
		background-color:#fff;
		color:#000;
	}
	
	table td.impar {
		background-color:#000;
		color:#fff;		
	}	
</style>
</head>
<body>
<table>
<tr>
<% for( int i=1; i <= 100; i++) { %>
	
	<td class="<%=(i%2==0) ? "par" : "impar" %>"><%=i %></td>
	<% if( i%10 == 0) { %>
    	</tr><tr>
    <% }
} %>
</tr>
</table>

</body>
</html>