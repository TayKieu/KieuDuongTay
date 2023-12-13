<%@ page import="com.example.model.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/10/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("User");
    if (user == null) {
%>
<table>
    <tr>
        <th>Area:</th>
        <td><input type="text" name="area"></td>
    </tr>
    <tr>
        <th>address:</th>
        <td><input type="text" name="address"></td>
    </tr>
    <tr>
        <th>Acreage:</th>
        <td><input type="text" name="acreage"></td>
    </tr>
    <tr>
        <th>Info:</th>
        <td><input type="text" name="info"></td>
    </tr>
    <tr>
        <th>Prices:</th>
        <td><input type="text" name="prices"></td>
    </tr>
    <tr>
        <th>Title/th>
        <td><input type="text" name="title"></td>
    </tr>
    <tr>
        <th>Area:</th>
        <td><input type="text" name="area"></td>
    </tr>
    <tr>
        <th>Img:</th>
        <td><input type="text" name="img"></td>
    </tr>
    <tr>
        <th>Rent type:</th>
        <td>
            <select>
                <option value="1">Thuê phòng trọ</option>
                <option value="2">Thuê căn hộ</option>
                <option value="3">Thuê nhà nguyên căn</option>
                <option value="4">Ở ghép</option>
            </select>
        </td>
    </tr>
    <th>
        <th>Owner name:</th>
        <td></td>
    </th>
</table>
</body>
</html>
