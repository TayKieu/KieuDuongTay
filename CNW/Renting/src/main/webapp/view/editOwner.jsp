<%@ page import="com.example.model.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/10/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <title>Post for renting </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("User");
%>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg"
             alt="" width="72" height="72">
        <h2>Editing information </h2>
        <p class="lead">Edit the contact information of user, the owner </p>
    </div>
<form class="needs-validation" novalidate action="/RentServlet?action=editOwner&userId=<%=user.getId()%>" method="post" accept-charset="UTF-8">
        <div class="col-md-6 mb-3">
            <label for="accountName">Account name:</label>
            <input type="text" class="form-control" id="accountName" name="accountName" placeholder="Enter account name" value="" required>
            <div class="invalid-feedback">
                Valid account name is required.
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@gmail.com" value=""
                   required>
            <div class="invalid-feedback">
                Valid email is required.
            </div>
        </div>
    <div class="col-md-6 mb-3">
        <label for="phone">Phone number</label>
        <input type="text" class="form-control" id="phone" name="phone" placeholder="" value=""
               required>
        <div class="invalid-feedback">
            Valid phone number is required.
        </div>
    </div>

    <input hidden type="text" name="userId" value="<%=user.getId()%>">
    <hr class="mb-4">

    <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
</form>
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
