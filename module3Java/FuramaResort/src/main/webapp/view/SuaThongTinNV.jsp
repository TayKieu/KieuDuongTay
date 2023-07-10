<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/16/2023
  Time: 6:41 PM
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
                    Sửa nhân viên
                </h2>
            </caption>
            <tr>
                <th>Mã nhân viên: </th>
                <td>
                    <c:if test="${nv != null}">
                        <input type="text" readonly="readonly"  style="background-color: darkgrey"
                               name="maNV" value="<c:out value='${nv.maNV}' />"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Họ và tên nhân viên:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${nv.hoTen}' />"
                    />
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${product.price}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product quantity:</th>
                <td>
                    <input type="text" name="quantity" size="15"
                           value="<c:out value='${product.quantity}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product color:</th>
                <td>
                    <input type="text" name="color" size="15"
                           value="<c:out value='${product.color}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product quantity:</th>
                <td>
                    <input type="text" name="quantity" size="15"
                           value="<c:out value='${product.quantity}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product description:</th>
                <td>
                    <input type="text" name="description" size="15"
                           value="<c:out value='${product.description}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product category:</th>
                <td>
                    <select  name="categoryId" >
                        <option value="1">Phone</option>
                        <option value="2">Television</option>
                        <option value="3">Ipad</option>
                        <option value="4">Laptop</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
