<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/26/2023
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="/static/css/bootstrap.css">
    <title>Title</title>
</head>
<form method="post" style="align-content: center">
  <table border="1" cellpadding="5" >
    <caption>
      <h2>Thêm mặt bằng</h2>
    </caption>
    <tr>
      <th>Mã mặt bằng</th>
      <td>
        <input type="text" name="ma" id="ma" size="45"/>
      </td>
    </tr>
    <tr>
      <th> Diện tích:</th>
      <td>
        <input type="text" name="dienTich" id="dienTich" size="45"/>
        <small style="display: none" id="inputPrice" class="form-text text-danger">
          Price must be inputed
        </small>
      </td>
    </tr>
    <tr>
      <th>Trạng thái:</th>
      <td>
        <input type="text" name="trangThai" id="trangThai" size="15"/>
        <small style="display: none" id="inputQuantity" class="form-text text-danger">
          Quantity must be inputed
        </small>
      </td>
    </tr>
    <tr>
      <th>Tầng:</th>
      <td>
        <input type="text" name="tang" id="tang" size="15"/>
        <small style="display: none" id="inputColor" class="form-text text-danger">
          Color must be inputed
        </small>
      </td>
    </tr>
    <tr>
      <th>Loại văn phòng:</th>
      <td>
        <select class="form-control" id="form1Example7" name="maLoaiVanPhong" >
          <option value="1">Cho thuê</option>
          <option value="2">Trọn gói</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>Giá thuê:</th>
      <td>
        <input type="text" name="giaThue" id="giaThue" size="15"/>
      </td>
    </tr>
    <tr>
      <th>Ngày bắt đầu:</th>
      <td>
        <input type="date" name="ngayBatDau" id="ngayBatDau" size="15"/>
      </td>
    </tr>
    <tr>
      <th>Ngày kết thúc:</th>
      <td>
        <input type="date" name="ngayKetThuc" id="ngayKetThuc" size="15"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" >
        <button class="btn btn-primary" onclick="validForm(event)" type="submit">Create</button>
        <a href="/TComplexServlet">
          <button class="btn btn-dark">Back</button>
        </a>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
