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
<form action="/exchange" method="post">
    <input type="text" id="in" name="input" placeholder="input $">
    <button type="submit">Exchange</button>
</form>
<input readonly="readonly" type="text" value="${result}" name="result">
</body>
</html>
