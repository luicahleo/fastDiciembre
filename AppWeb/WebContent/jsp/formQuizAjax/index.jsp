<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>formQuiz</title>
<link rel="stylesheet" href="style.css" type="text/css" />
<script type="text/javascript" language="javascript" src="formQuizAjax.js"></script>
</head>
<body onload="inicioFormQuiz();">
<div id="principal">
	<div id="logo"></div>
    <div id="top-menu">
    	<form action="" method="post" id="form">
    	<ul>
        	<li>
            	<select id="tipo" name="tipo">
	                <option value="0">-Selecciona un elemento-</option>
                	<option value="1">Campo de texto</option>
                	<option value="2">Grupo de botones de opción</option>
                	<option value="3">Checkbox</option>
                	<option value="4">Lista desplegable</option>
                	<option value="5">Submit</option>  
                	<option value="6">Botón</option>                                                                               
                </select>
            </li>
            <li>
            	<label for="nombre">Etiqueta del campo</label>
            	<input type="text" id="nombre" name="nombre" size="30" />
            </li>            
            <!-- El siguiente elemento de lista sólo aparecerá cuando se seleccione un grupo de botones de opción o una lista desplegable -->
            <li id="numero-elementos">
            	<label for="numElementos">Nº de elementos</label>
            	<input type="text" id="numElementos" name="numElementos" value="1" />
            </li>                       
            <li>
            	<br />
            	<input type="button" id="generar" value="Generar elemento" />
            </li>
            <li>
            	<a href="reset.jsp">Resetear formulario</a>
            </li>
        </ul>            
        </form>
        
    </div>

</div>

<div id="contenido">
	<div id="code">
       	<h1>Formulario generado</h1>
		<div id="source-code">
			<h2>Código fuente</h2>
	        <textarea id="textoCodigoFuente" rows="10" readonly="readonly">
<!-- Aquí aparecerá el código fuente -->
	        </textarea>
	        <h2>Vista previa</h2>
	        <hr />
	        <br />
	        <!-- DatosForm en HTML -->
	        <div id="vistaPrevia">
	        <!-- Aquí aparecerá la vista previa -->
	        </div>
        </div>
    </div>    
</div>
</body>
</html>