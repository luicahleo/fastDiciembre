<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.BeanMinimo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String titulo = "JavaBeans: uso de un bean con distintos ámbitos: page y request"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<p>Cuando se usa un bean con ámbito <code>page</code>, cada vez que se procesa una página,
se crea un nuevo bean.
</p>
<p>Cuando se usa un bean con ámbito <code>request</code>, cada vez que se procesa una petición,
se crea un nuevo bean. Una petición puede ser procesada por varias páginas.
</p>
<p>
Se van a usar beans de la clase <code>fast.BeanPruebaScope</code> que automáticamente asigna
un ID único a cada instancia de objeto (comparando el ID se puede saber cuando se ha creado
un objeto nuevo o es el mismo). Además tiene una propiedad <code>valor</code> que puede almacenar
una cadena de texto (por defecto vale "No asignado").
</p>
<p>
En este ejemplo se crea el bean <code>beanPruebaScopeP</code> con ámbito <code>page</code>
y el bean <code>beanPruebaScopeP</code> con ámbito <code>request</code>. A continuación se
incluyen las páginas <code>mostrarBeanPage.jsp</code> y <code>mostrarBeanRequest.jsp</code>.
Compruebe como el bean con ámbito <code>request</code> es compartido también por las 
páginas incluidas.
</p>
<p>
Recarge la página y compruebe como se crean nuevos objetos en cada petición.
</p>
<jsp:useBean id="beanPruebaScopeP" class="fast.BeanPruebaScope" scope="page" />
<jsp:setProperty name="beanPruebaScopeP" property="valor" 
	value="Bean con ámbito PAGE."/>
<jsp:useBean id="beanPruebaScopeR" class="fast.BeanPruebaScope" scope="request" />
<jsp:setProperty name="beanPruebaScopeR" property="valor" 
	value="Bean con ámbito REQUEST."/>

<p>Valores de las propiedades del bean <code>beanPruebaScopeP</code>:</p>
<ul>
<li><strong>id: </strong><jsp:getProperty name="beanPruebaScopeP" property="id" /></li>
<li><strong>valor: </strong><jsp:getProperty name="beanPruebaScopeP" property="valor" /></li>
</ul>
<p>Valores de las propiedades del bean <code>beanPruebaScopeR</code>:</p>
<ul>
<li><strong>id: </strong><jsp:getProperty name="beanPruebaScopeR" property="id" /></li>
<li><strong>valor: </strong><jsp:getProperty name="beanPruebaScopeR" property="valor" /></li>
</ul>
<hr />
<p>Importamos <code>mostrar_bean_page.jsp</code> (verifique que el ID es distinto)</p>
<jsp:include page="mostrar_bean_page.jsp" />
<p>Importamos <code>mostrar_bean_request.jsp</code> (verifique que el ID es el mismo)</p>
<jsp:include page="mostrar_bean_request.jsp" />
<p>
<a href="../index.jsp">Volver al índice</a>
</p>
</body>
</html>