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
    <title>Calculator</title>
</head>
<body>
<h1>Calculator</h1>
<br>
<form method="post" action="/calculate">
<input type="text" name="firstOperand">
<input type="text" name="secondOperand">
    <br>
<button type="submit" name="Addition" id="Addition" value="+">Addition</button>
<button type="submit" name="Subtraction" id="Subtraction" value="-">Subtraction</button>
<button type="submit" name="Multiplication" id="Multiplication" value="*">Multiplication</button>
<button type="submit" name="Division" id="Division" value="/">Division</button>
</form>
<h3 style="color: red">${message}</h3>
<h3>Result ${message} : ${result}</h3>
</body>
</html>
