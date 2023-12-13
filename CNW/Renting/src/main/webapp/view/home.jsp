<%@ page import="java.util.List" %>
<%@ page import="com.example.model.bean.RentDetail" %>
<%@ page import="com.example.model.bean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/10/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang thuê trọ, căn hộ, chung cư </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <%--    <link rel="stylesheet" href="css/homeStyle.css" type="text/css">--%>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        main {
            text-align: center;
            padding: 20px;
        }

        main > div {
            margin-bottom: 20px;
        }

        .card-container {
            flex: 0 0 calc(25% - 20px);
            margin-bottom: 20px;
        }

        .card {
            width: calc(33.33% - 20px); /* Adjust as needed */
            box-sizing: border-box;
            margin-bottom: 20px; /* Adjust as needed */
            background-color: #f1f1f1;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }


        .card img {
            width: 100%;
            height: auto;
        }

        .card-body {
            padding: 20px;
            text-align: left;
        }

        .card-title {
            color: red;
        }

        .card-prices {
            color: greenyellow;
        }

        .card-acreage {
            color: lightskyblue;
        }

        .card-area {
            color: black;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .card:hover {
            transform: scale(1.05);
        }

        footer {
            margin-top: 20px;
            text-align: center;
            padding: 1rem;
            background-color: #343a40;
            color: #fff;
        }

        .text-muted a {
            color: #fff;
        }

        .text-muted a:hover {
            text-decoration: underline;
        }

        /* Media query for smaller screens */
        @media (max-width: 768px) {
            .card-container {
                flex: 0 0 calc(50% - 20px);
            }
        }

        /* Media query for even smaller screens */
        @media (max-width: 576px) {
            .card-container {
                flex: 0 0 calc(100% - 20px);
            }
        }

        /* Media query for mobile screens */
        @media (max-width: 576px) {
            .card-container {
                flex: 0 0 calc(100% - 20px);
            }
        }
    </style>
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("User");
    if (user == null) {
%>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
            <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap">
                    <image href="#"></image>
                </svg>
            </a>
        </div>

        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2">Cho thuê phòng trọ</a></li>
            <li><a href="#" class="nav-link px-2">Cho thuê nhà ở</a></li>
            <li><a href="#" class="nav-link px-2">Cho thuê căn hộ</a></li>
            <li><a href="#" class="nav-link px-2">Ở ghép</a></li>
        </ul>

        <div class="col-md-3 text-end">
            <a class="btn btn-outline-primary me-2" role="button" href="/UserServlet?action=login">Đăng nhập</a>
            <a class="btn btn-primary" role="button" href="/UserServlet?action=register">Đăng ký</a>
        </div>
    </header>
</div>
<% } else {%>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <div class="col-md-3 mb-2 mb-md-0">
        <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
            <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap">
                <image href="#"></image>
            </svg>
        </a>
    </div>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="#" class="nav-link px-2">Cho thuê phòng trọ</a></li>
        <li><a href="#" class="nav-link px-2">Cho thuê nhà ở</a></li>
        <li><a href="#" class="nav-link px-2">Cho thuê căn hộ</a></li>
        <li><a href="#" class="nav-link px-2">Ở ghép</a></li>
    </ul>

    <div class="col-md-3 text-end">
        <a class="btn btn-outline-primary me-2" role="button" href="/RentServlet?action=createNewPost">Đăng bài </a>
        <a class="btn btn-primary" role="button" href="/UserServlet?action=register"><%=user.getAccountName()%>
        </a>
    </div>
</header>
<%}%>
<main role="main">
    <div>
        <h1>Cho Thuê Phòng Trọ, Thuê Nhà Trọ Giá Rẻ, Chính Chủ</h1>
        <small>Cho thuê phòng trọ, nhà trọ giá rẻ hàng đầu Việt Nam - Cập nhật thông tin cho thuê phòng trọ nhanh chóng,
            chính xác, thông tin xác thực.</small>
    </div>
    <% List<RentDetail> rentCards = (List<RentDetail>) request.getAttribute("rentCards");
        for (RentDetail r : rentCards) {
    %>
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col">
                <div class="card-container">
                    <div class="card" style="width: 18rem">
                        <img src="<%=r.getImg()%>" class="card-img-top" alt="Image">
                        <div class="card-body">
                            <h5 class="card-title"><%=r.getTitle()%>
                            </h5>
                            <h5 class="card-prices"><%=r.getPrices()%>/Tháng</h5>
                            <h5 class="card-acreage">Diện tích: <%=r.getAcreage()%>m2</h5>
                            <h5 class="card-area">Khu vực: <%=r.getArea()%>
                            </h5>
                            <a href="#" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</main>
<footer class="text-muted">
    <div class="container">
        <p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting
            started guide</a>.</p>
    </div>
</footer>
</body>
</html>
