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

    <link href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>
<body>
<c:url var="urlUpdatePage" value="/FamilyServlet?action=edit"/>
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
            <td><a  href="${urlUpdatePage}&ma=${family.ma}">
                <button class="btn btn-primary">Sửa</button>
            </a>
                <button onclick="test('${family.toString()}')"  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xem thanh vien
                </button>
            </td>
        </tr>
    </c:forEach>
<%--Modal--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                List Thanh Vien :
                    <div id="tbdMember">aaa</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    </tbody>
</table>

<script>
    function test(val){
        console.log(val);
        tbdMember.innerHTML   = val;
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableFamily').DataTable({
            'pageLength' : 2,
            pagingType: 'full_numbers',
            'searching':false
        });
    });
</script>
</body>
</html>
