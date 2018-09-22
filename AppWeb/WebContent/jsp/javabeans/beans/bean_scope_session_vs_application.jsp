<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="java.util.Date"%>
<%@page import="fast.BeanMinimo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String titulo = "JavaBeans: uso de un bean con distintos ámbitos: session y application";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<p>Cuando se usa un bean con ámbito <code>session</code>, se utiliza el mismo bean
durante toda la sesión del usuario en todas las páginas. 
</p>
<p>Cuando se usa un bean con ámbito <code>application</code>, el bean es compartido
en todas las páginas y en todas las sesiones.
</p>
<p>
Se van a usar beans de la clase <code>fast.BeanPruebaScope</code> que automáticamente asigna
un ID único a cada instancia de objeto (comparando el ID se puede saber cuando se ha creado
un objeto nuevo o es el mismo). Además tiene una propiedad <code>valor</code> que puede almacenar
una cadena de texto (por defecto vale "No asignado").
</p>
<p>
En este ejemplo se crea el bean <code>beanPruebaScopeS</code> con ámbito <code>session</code>
y el bean <code>beanPruebaScopeA</code> con ámbito <code>application</code>. A continuación se
incluyen las páginas <code>mostrarBeanSession.jsp</code> y <code>mostrarBeanApplication.jsp</code>.
</p>
<p>
Recarge la página y compruebe como NO se crean nuevos objetos en cada petición.
Acceda a esta página desde otro navegador y compruebe que el bean de sesión cambia, pero
no cambia el bean de aplicación.
</p>
<p>Puede forzar a cerrar la sesión (y crear una nueva), haciendo click en el siguiente botón:</p>
<form action="cerrar_sesion.jsp"><input type="submit" name="cerrar" value="Cerrar sesión"/></form>
<jsp:useBean id="beanPruebaScopeS" class="fast.BeanPruebaScope" scope="session" />
<jsp:setProperty name="beanPruebaScopeS" property="valor" 
	value="Bean con ámbito SESSION."/>
<jsp:useBean id="beanPruebaScopeA" class="fast.BeanPruebaScope" scope="application" />
<jsp:setProperty name="beanPruebaScopeA" property="valor" 
	value="Bean con ámbito APPLICATION."/>

<p>Valores de las propiedades del bean <code>beanPruebaScopeS</code>:</p>
<ul>
<li><strong>id: </strong><jsp:getProperty name="beanPruebaScopeS" property="id" /></li>
<li><strong>valor: </strong><jsp:getProperty name="beanPruebaScopeS" property="valor" /></li>
</ul>
<p>Valores de las propiedades del bean <code>beanPruebaScopeA</code>:</p>
<ul>
<li><strong>id: </strong><jsp:getProperty name="beanPruebaScopeA" property="id" /></li>
<li><strong>valor: </strong><jsp:getProperty name="beanPruebaScopeA" property="valor" /></li>
</ul>
<hr />
<p>Importamos <a href="mostrar_bean_session.jsp"><code>mostrar_bean_session.jsp</code> </a>
(el ID del bean debe cambiar usando distintos navegadores)</p>
<jsp:include page="mostrar_bean_session.jsp" />
<p>Importamos <a href="mostrar_bean_application.jsp"><code>mostrar_bean_application.jsp</code></a>
 (el ID del bean no debe cambiar)</p>
<jsp:include page="mostrar_bean_application.jsp" />
<p>
<a href="../index.jsp">Volver al índice</a>
</p>
</body>
</html>