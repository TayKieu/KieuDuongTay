<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/12/2023
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Customer list</h1>
<table class = "table">
    <thead>
    <tr>
        <th>Name</th>
        <th>Birth</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.birth}</td>
            <td>${customer.address}</td>
            <td>
                <img src="/static/img/${customer.image}">
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
