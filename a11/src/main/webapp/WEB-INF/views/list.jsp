<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 6/30/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/student/create">Thêm mới</a>
<p>${mess}</p>
<table>
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Detail-RequestParam</th>
        <th>Detail2-PathVariable</th>
    </tr>
    <c:forEach items="${studentList}" var="student" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.gender}</td>
            <td>
                <a href="/student/detail?id=${student.id}">Detail</a>
                <a href="/student/detail/${student.id}">Detail</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
