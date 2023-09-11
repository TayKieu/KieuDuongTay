<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/26/2023
  Time: 8:03 PM
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
<h1>Các ghi chú</h1>
<a class="btn btn-success" href="/student?action=create" role="button">Create</a>
<table class="table" id="tableNote">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tiêu đề</th>
        <th>Phân loại</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${note}" var="note">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>
                <c:choose>
                    <c:when test="${student.gender == 1}">Male</c:when>
                    <c:when test="${student.gender == 0}">Female</c:when>
                    <c:otherwise>LGBT</c:otherwise>
                </c:choose>
            </td>
            <td>${student.point}</td>
            <td>
                <c:if test="${student.point >= 60}">Pass</c:if>
                <c:if test="${student.point < 60}">Fail</c:if>
            </td>
            <td>
                <img src="/static/img/${student.image}" width="50px">
            </td>
            <td>
                <button
                        onclick="showModelDelete('${student.id}','${student.name}')"
                        type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelDelete">Delete</button>
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
                <p>Ban muon xoa: <span id="studentName" style="color: red">no name</span> ?</p>
            </div>
            <form action="/student">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="studentId">
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
        $('#tableStudent').dataTable({
            'pageLength' : 2,
            'searching' : false
        })
    })

    function showModelDelete(id, name) {
        console.log(id, name);
        document.getElementById("studentName").innerText = name;
        document.getElementById("studentId").value = id;
    }
</script>
</body>
</html>
