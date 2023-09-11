<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/14/2023
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post" style="align-content: center">
    <table border="1" cellpadding="5" >
        <caption>
            <h2>Thêm nhân viên</h2>
        </caption>
        <tr>
            <th>Mã nhân viên:</th>
            <td>
                <input type="text" name="maNV" id="maNV" size="45"/>
            </td>
        </tr>
        <tr>
            <th>Họ tên nhân viên: </th>
            <td>
                <input type="text" name="ten" id="ten" size="45"/>
            </td>
        </tr>
        <tr>
            <th> Ngày sinh:</th>
            <td>
                <input type="text" name="ngaySinh" id="ngaySinh" size="45"/>
            </td>
        </tr>
        <tr>
            <th>CMND:</th>
            <td>
                <input type="text" name="cmnd" id="cmnd" size="15"/>
            </td>
        </tr>
        <tr>
            <th>Lương:</th>
            <td>
                <input type="text" name="luong" id="luong" size="15"/>
            </td>
        </tr>
        <tr>
            <th>SĐT:</th>
            <td>
                <input type="text" name="sdt" id="sdt" size="15"/>
            </td>
        </tr>
        <tr>
            <th>Email:</th>
            <td>
                <input type="text" name="email" id="email" size="15"/>
            </td>
        </tr>
        <tr>
            <th>Địa chỉ:</th>
            <td>
                <input type="text" name="diaChi" id="diaChi" size="15"/>
            </td>
        </tr>
        <tr>
            <th>Vị Trí:</th>
            <td>
                <select class="form-control"  name="maViTri" >
                    <option value="1">Quản Lý</option>
                    <option value="2">Nhân Viên</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>Trình độ:</th>
            <td>
                <select class="form-control"  name="maTrinhDo" >
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4">Sau Đại Học</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>Bộ phận:</th>
            <td>
                <select class="form-control" id="form1Example7" name="maBoPhan" >
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </select>
            </td>
        </tr>

        <tr>
            <td colspan="2" >
                <button class="btn btn-primary" type="submit">Create</button>
                <a href="NhanVienServlet?action=NhanVienServlet">
                    <button class="btn btn-dark">Back</button>
                </a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
