<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2023
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/datatables/css/dataTables.bootstrap4.css">
</head>
<body>
<c:url var="urlUpdatePage" value="/FamilyServlet?action=edit"/>
<a class="btn btn-success" href="/FamilyServlet?action=create" role="button">Create</a>
<br>
<table id="tableFamily" class="table table-bordered">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã hộ khẩu:</th>
        <th>Tên chủ hộ</th>
        <th>Số lượng thành viên</th>
        <th>Ngày lập hộ khẩu</th>
        <th>Địa chỉ nhà</th>
        <th>Chức năng</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${danhSachHoKhau}" var="family" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${family.ma}</td>
            <td>${family.tenChuHo}</td>
            <td>${family.soLuongTV}</td>
            <td>${family.ngayLapHoKhau}</td>
            <td>${family.diaChi}</td>
            <td><a href="${urlUpdatePage}&id=${family.ma}">
                <button class="btn btn-primary">Sửa</button>
            </a>
            <a href="/ProductServlet?action=watch&id=${family.ma}">
                <button type="submit" class="btn btn-success">Xem số lượng thành viên</button></a>
            </td>

        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
