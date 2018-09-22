<?xml version="1.0" encoding="UTF-8" ?>
<%--/*FJFJ*/--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Página a ser incluida</title>
<link href="../estilo.css" rel="stylesheet" type="text/css"/>
<style>
#incluido {
	border: 2px dotted green;
	text-align: center;
	max-width: 400px;
}
</style>
</head>
<body>
<div id="incluido">
<p>Atributo <code>fast.uno</code>=<%=pageContext.findAttribute("fast.uno") %></p>
<p>Atributo <code>fast.dos</code>=<%=pageContext.findAttribute("fast.dos") %></p>
<p>Atributo <code>fast.tres</code>=<%=pageContext.findAttribute("fast.tres") %></p>
</div>
</body>
</html>