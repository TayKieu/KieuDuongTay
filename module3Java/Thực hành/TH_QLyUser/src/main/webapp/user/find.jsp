<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/19/2023
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find a user</title>
</head>
<center>
    <h1>Finding User</h1>
    <h2>
        <a href="users?action=users">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Find a User</h2>
            </caption>
            <tr>
                <th>Enter Country:</th>
                <td>
                    <input type="text" placeholder="Enter a country" name="country" id="country" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="OK"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
