<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/7/2023
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Sửa hộ khẩu
                </h2>
            </caption>
            <tr>
                <th>Mã hộ khẩu: </th>
                <td>
                    <c:if test="${hokhau != null}">
                        <input type="text" readonly="readonly"  style="background-color: darkgrey"
                               name="ma" value="<c:out value='${hokhau.ma}' />"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Tên chủ hộ: </th>
                <td>
                    <input type="text" name="tenChuHo" size="45"
                           value="<c:out value='${hokhau.tenChuHo}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Số lượng thành viên: </th>
                <td>
                    <input type="text" readonly="readonly" style="background-color: darkgrey"
                           name="soLuong" size="15"
                           value="<c:out value='${hokhau.soLuongTV}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Ngày lập hộ khẩu: </th>
                <td>
                    <div class="input-group date" data-provide="datepicker">
                        <input type="date" class="form-control" name="ngayLap"
                               value="<c:out value='${hokhau.ngayLapHoKhau}'/>"/>
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-th"></span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ nhà: </th>
                <td>
                    <input type="text" name="diaChi" size="15"
                           value="<c:out value='${hokhau.diaChi}' />"
                    />
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Sửa"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
