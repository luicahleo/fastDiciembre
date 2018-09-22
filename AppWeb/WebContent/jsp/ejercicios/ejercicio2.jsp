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
		padding:10px;
	}
	
	table td {
		padding:5px;	
	}
	
	table td.par {
		background-color:#FFCE9E;
		color:#000;
	}
	
	table td.impar {
		background-color:#D18B47;
		color:#fff;		
	}	
	
	table td.number {
		font-size:9px;
		color:#666;	
	}
</style>
</head>
<body>
<%!
int numFilas=8;
String[] columnas = new String[] { "A", "B", "C", "D", "E", "F", "G", "H" };
%>
<table>

<!-- recorrer todas las filas, empezando por la última -->
<% for(int i=numFilas; i>=1; i--) { %>

		<!-- si nos encontramos en la primera fila de la tabla, antes de generarla, generamos la fila con la letra
        correspondiente a cada columna -->
		<% if( i == numFilas) { %>
    		<tr>    
            <td>&nbsp;</td>
			<% for( int jx=0; jx<columnas.length; jx++) { %>
        	<td class="number"><%=columnas[jx] %></td>
	        <% } %>
            <td>&nbsp;</td>
            </tr>
		<% } %>
        
	<tr>
    
    	<!-- recorrer la tabla de columnas para generar todas las columnas de la fila en la que nos encontramos
        ATENCIÓN: las tablas comienzan en la posición 0, como nos interesa comenzar en 1 para que al sumar
        la fila y la columna sepa de qué color pintar la celda, después tendremos que utilizar j-1 para conocer la
        letra en la que nos encontramos. -->
        
		<% for(int j=1; j<=columnas.length; j++) { 
				if( j==1 ) { %>
                <td class="number"><%=i%></td>
             <% } %>
        
        	<!-- generar el contenido de la celda con la letra y el número de la posición en la que nos encontramos -->
        	<td class="<%=((i+j)%2==0) ? "par" : "impar"%>"><%=columnas[j-1]+i %></td>
           
           	<!-- si nos encontramos en la última columna de la fila, generamos el número de fila -->
   	        <% if( j==columnas.length) { %>
    	    	<td class="number"><%=i%></td>
	        <% } 
   	        } %>
        
    </tr>
<% } %>

<!-- generar la última fila de letras correspondiente a cada columna -->
<tr>    
<td>&nbsp;</td>
	<% for(int jx=0; jx<columnas.length; jx++) {%>
        <td class="number"><%=columnas[jx]%></td>
    <% } %>
    <td>&nbsp;</td>
</tr>

</table>
</body>
</html>