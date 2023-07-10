<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/26/2023
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>

<c:url var="urlDelete" value="/TComplexServlet?action=delete"/>
<a class="btn btn-success" href="/TComplexServlet?action=create" role="button">Create</a>
<br>
<form method="post" action="/TComplexServlet?action=search">
    <p>Loại mặt bằng:</p>
    <select class="form-control" id="form1Example7" name="maLoaiVanPhong" >
        <option value="1">Cho thuê</option>
        <option value="2">Trọn gói</option>
    </select>
    <input type="submit" value="Tìm"/>
</form>

<table id="tableTComPlex" class="table table-bordered" style="text-align: center">
    <thead>
    <tr>
        <th>Mã MB</th>
        <th>Diện tích</th>
        <th>Trạng thái</th>
        <th>Tầng</th>
        <th>Loại văn phòng</th>
        <th>Giá thuê</th>
        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${danhSachMatBang}" var="mb">
        <tr>
            <td>${mb.ma}</td>
            <td>${mb.dienTich}</td>
            <td>${mb.trangThai}</td>
            <td>${mb.tang}</td>
            <td>${mb.tenLoaiVanPhong}</td>
            <td>${mb.giaThue}</td>
            <td>${mb.ngayBatDau}</td>
            <td>${mb.ngayKetThuc}</td>
            <td>
                <a href="/TComplexServlet?action=delete&ma=${mb.ma}">
                    <button type="submit" class="btn btn-danger">Delete</button></a>
            </td>

        </tr>
    </c:forEach>
    </tbody>

</table>
<script>
    $(document).ready(function () {
        $('#tableTComPlex').DataTable({
            'pageLength' : 2,
            pagingType: 'full_numbers',
            'searching':false
        });
    });
</script>
</html>
