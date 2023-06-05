<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product discount calculator</title>

</head>
<body>
<h2>Product price</h2>
<form method="post" action="/calculate">
    <label>Product discription: </label><br/>
    <input type="text" name="discription" placeholder="Description" /><br/>
    <label>List price: </label><br/>
    <input type="text" name="price" placeholder="VNG" value="0"/><br/>
    <label>Discount percent: </label><br/>
    <input type="text" name="percent" placeholder="%" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Calculate"/>
</form>
</body>
</html>