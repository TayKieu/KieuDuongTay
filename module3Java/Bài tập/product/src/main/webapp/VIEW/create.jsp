<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/5/2023
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <h2>
        <a href="ProductServlet?action=ProductServlet">List All Users</a>
    </h2>
</head>
<body>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Product</h2>
            </caption>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Product Price:</th>
                <td>
                    <input type="text" name="email" id="price" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Product quantity</th>
                <td>
                    <input type="text" name="country" id="quantity" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Product color</th>
                <td>
                    <input type="text" name="country" id="color" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Product description</th>
                <td>
                    <input type="text" name="country" id="description" size="15"/>
                </td>
            </tr>
            <div class="form-outline mb-4">
                <label class="form-label" for="form1Example7">Category</label>
                <select class="form-control" id="form1Example7" name="categoryId" >
                    <option value="1">Phone</option>
                    <option value="2">Television</option>
                    <option value="3">Ipad</option>
                    <option value="4">Laptop</option>
                </select>
            </div>
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
