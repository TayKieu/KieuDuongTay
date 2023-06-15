<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/14/2023
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:url var="urlUpdatePage" value="/NhanVienServlet?action=edit"/>
<a class="btn btn-success" href="/NhanVienServlet?action=create" role="button">Create</a>
<table id="tableNhanVien" class="table table-bordered">
    <thead>
    <tr>
        <th>Mã nhân viên:</th>
        <th>Họ tên</th>
        <th>Ngày sinh</th>
        <th>CMND</th>
        <th>Lương</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Vị trí</th>
        <th>Trình độ</th>
        <th>Bộ phận</th>
        <th>Chức năng</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${DSNhanVien}" var="nv" >
    <tr>
        <td>${nv.maNV}</td>
        <td>${nv.hoTen}</td>
        <td>${nv.date}</td>
        <td>${nv.CMND}</td>
        <td>${nv.luong}</td>
        <td>${nv.sdt}</td>
        <td>${nv.email}</td>
        <td>${nv.diaChi}</td>
        <td>${nv.viTri}</td>
        <td>${nv.trinhDo}</td>
        <td>${nv.boPhan}</td>
        <td><a  href="${urlUpdatePage}&ma=${nv.maNV}">
            <button class="btn btn-primary">Sửa</button>
        </a>
<%--            <button onclick="test('${family.toString()}')"  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--                Xem thanh vien--%>
<%--            </button>--%>
        </td>
    </tr>
    </c:forEach>
</body>
</html>
