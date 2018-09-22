<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@page import="fast.BeanMinimo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String titulo = "JavaBeans: muestra bean con ámbito request"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=titulo %></title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1><%=titulo %></h1>
<jsp:useBean id="beanPruebaScopeR" class="fast.BeanPruebaScope" scope="request" />
<p>Valores de las propiedades del bean "beanPruebaScopeR":</p>
<ul>
<li><strong>id: </strong><jsp:getProperty name="beanPruebaScopeR" property="id" /></li>
<li><strong>valor: </strong><jsp:getProperty name="beanPruebaScopeR" property="valor" /></li>
</ul>

<hr />
</body>
</html>