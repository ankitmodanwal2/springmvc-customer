<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Customer</title></head>
<body>
<h2>Customer details</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Username</th>
        <th>Password</th>
        <th>Gender</th>
    </tr>
    <tr>
        <td>${customerDetails.name}</td>
        <td>${customerDetails.userName}</td>
        <td>${customerDetails.password}</td>
        <td>${customerDetails.gender}</td>
    </tr>
</table>

</body>
</html>
