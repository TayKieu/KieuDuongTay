<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/25/2023
  Time: 3:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="/static/css/bootstrap.css">
    <title>create new product</title>
</head>
<body>

<form method="post" style="align-content: center">
  <table border="1" cellpadding="5" >
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
      <th> Price:</th>
      <td>
        <input type="text" name="price" id="price" size="45"/>
      </td>
    </tr>
    <tr>
      <th>Quantity:</th>
      <td>
        <input type="text" name="quantity" id="quantity" size="15"/>
      </td>
    </tr>
    <tr>
      <th>Color:</th>
      <td>
        <input type="text" name="color" id="color" size="15"/>
      </td>
    </tr>
    <tr>
      <th>Description:</th>
      <td>
        <input type="text" name="description" id="description" size="15"/>
      </td>
    </tr>
    <tr>
      <th>Category:</th>
      <td>
        <select class="form-control" id="form1Example7" name="categoryId" >
          <option value="1">Phone</option>
          <option value="2">Television</option>
          <option value="3">Ipad</option>
          <option value="4">Laptop</option>
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="2" >
        <button class="btn btn-primary" type="submit">Create</button>
        <a href="ProductServlet?action=ProductServlet">
          <button class="btn btn-dark">Back</button>
        </a>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
