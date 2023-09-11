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
<h3 style="color:red">${message}</h3>

<a role="button" class="btn btn-primary" href="/views/create"> Create new Word</a>
<form action="/views/search" method="post">
    <input id="inputWord" name="word" placeholder="input word">
    <button>Search</button>
</form>
<c:forEach items="${map}" varStatus="status" var="map">
        ${map.key}
       ${map.value}
</c:forEach>
</body>
</html>
