<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/7/2023
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/choose">
    <h1>Sandwich Condiments</h1>
    <input  name="condiment" value="Lettuce" type="checkbox"> Lettuce
    <input  name="condiment" value="Tomato" type="checkbox"> Tomato
    <input  name="condiment" value="Mustand" type="checkbox"> Mustand
    <input  name="condiment" value="Sprouts" type="checkbox"> Sprouts
    <hr>
    <button type="submit">Save</button>
</form>
</body>
</html>
