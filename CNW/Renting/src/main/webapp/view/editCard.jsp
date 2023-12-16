<%@ page import="com.example.model.bean.User" %>
<%@ page import="com.example.model.bean.RentDetail" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <title>Post for renting </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">
    <style>
        .container {
            max-width: 960px;
        }

        .lh-condensed {
            line-height: 1.25;
        }
    </style>
</head>

<body class="bg-light">
<%
    User user = (User) request.getSession().getAttribute("User");
    RentDetail rent = (RentDetail) request.getSession().getAttribute("Rent");
%>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg"
             alt="" width="72" height="72">
        <h2>Your New Rent </h2>
        <p class="lead">Chỉnh sửa bài đăng </p>
    </div>
    <hr class="mb-4">
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your Information</span>
                <span class="badge badge-secondary badge-pill">Owner</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <small class="text-muted">Account name: </small>
                        <h6 class="my-0"><%=user.getAccountName()%>
                        </h6>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <small class="text-muted">Email:</small>
                        <h6 class="my-0"><%=user.getEmail()%>
                        </h6>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <small class="text-muted">Phone number:</small>
                        <h6 class="my-0"><%=user.getPhone()%>
                        </h6>
                    </div>
                </li>
            </ul>
            <a class="btn btn-primary" role="button" href="/RentServlet?action=editOwner&userId=<%=user.getId()%>">Edit</a>


        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Your post for renting</h4>
            <form class="needs-validation" novalidate action="/RentServlet?action=editCard&rentDetailId=<%=rent.getRentDetailId()%>&userId=<%=user.getId()%>" method="post" accept-charset="UTF-8">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="area">Area</label>
                        <input type="text" class="form-control" id="area" name="area" placeholder="" value="<%=rent.getArea()%>" required>
                        <div class="invalid-feedback">
                            Valid area is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="" value="<%=rent.getAddress()%>"
                               required>
                        <div class="invalid-feedback">
                            Valid address is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="acreage">Acreage</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">m²</span>
                        </div>
                        <input type="text" class="form-control" id="acreage" name="acreage" placeholder="" value="<%=rent.getAcreage()%>" required>
                        <div class="invalid-feedback" style="width: 100%;">
                            Acreage is required.
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="title">Title for the post</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter title" value="<%=rent.getTitle()%>">
                </div>
                <div class="mb-3">
                    <label for="info">Information</label>
                    <input type="text" class="form-control" id="info" name="info" placeholder="Enter description" value="<%=rent.getInfo()%>">
                    <div class="invalid-feedback">
                        Please enter some informations for customer.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="prices">Prices</label>
                    <input type="text" class="form-control" id="prices" name="prices" placeholder="Price per month" value="<%=rent.getPrices()%>"
                           required>
                    <div class="invalid-feedback">
                        Please enter prices.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="img">Image preview: </label>
                    <input type="text" class="form-control" id="img" name="img" placeholder="Enter link " value="<%=rent.getImg()%>" required>
                    <div class="invalid-feedback">
                        Please enter link to image.
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="rentTypeId">Type: </label>
                        <select class="custom-select d-block w-100" id="rentTypeId" name="rentTypeId" required>
                            <option value="">Choose...</option>
                            <option value="1">Thuê phòng trọ</option>
                            <option value="2">Thuê căn hộ</option>
                            <option value="3">Thuê nhà nguyên căn</option>
                            <option value="4">Ở ghép</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid type.
                        </div>
                    </div>

                </div>
                <input hidden type="text" name="userId" value="<%=user.getId()%>">
                <hr class="mb-4">

                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';

        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');

            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
