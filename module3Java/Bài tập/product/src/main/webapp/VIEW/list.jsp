<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/2/2023
  Time: 2:39 AM
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
<h1>Product List</h1>
<a class="btn btn-success" href="/ProductServlet?action=create" role="button">Create</a>
<table class="table" id="tableProduct">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Description</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>${product.color}</td>
            <td>${product.description}</td>
            <c:forEach items="${categories}" var="category">
                <c:if test="${product.categoryId == category.id}">
                    <td>${category.name}</td>
                </c:if>
            </c:forEach>
            <td>
                <form action="/ProductServlet?delete&id=${user.id}">
                    <button
                            onclick="showModelDelete('${product.id}','${product.name}')"
                            type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelDelete">Delete
                    </button>
                </form>
                <form action="/ProductServlet?edit&id=${user.id}">
                    <button type="button" class="btn btn-primary">Edit</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<!-- Modal -->
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Ban muon xoa: <span id="productName" style="color: red">no name</span> ?</p>
            </div>
            <form action="/product">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="productId">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<script src="../static/datatables/js/jquery.dataTables.js"></script>
<script src="../static/datatables/js/dataTables.bootstrap4.js"></script>

<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            'pageLength': 3,
            'searching': false
        })
    })

    function showModelDelete(id, name) {
        console.log(id, name);
        document.getElementById("productName").innerText = name;
        document.getElementById("productId").value = id;
    }
</script>
</body>
</html>
