<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ece9e6, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-form {
            background-color: #f9f9f9;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 350px;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-field {
            margin-bottom: 20px;
        }

        .form-field label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-field input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .form-field input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .form-field input[type="submit"]:hover:enabled {
            background-color: #45a049;
        }

        .form-field input[type="submit"]:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .error {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
        }

        .signup-link {
            text-align: center;
            margin-top: 15px;
        }

        .signup-link a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-form">
    <h2>Customer Login</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form:form action="authentication" modelAttribute="custAtt" method="POST" id="loginForm">
        <div class="form-field">
            <label>Username:</label>
            <form:input path="userName" id="userName" onkeyup="validateForm()" />
        </div>
        <div class="form-field">
            <label>Password:</label>
            <form:password path="password" id="password" onkeyup="validateForm()" />
        </div>
        <div class="form-field">
            <input type="submit" id="loginBtn" value="Login" disabled />
        </div>
    </form:form>

    <div class="signup-link">
        Don't have an account? <a href="signup">Sign up here</a>
    </div>
</div>

<script>
    function validateForm() {
        var userName = document.getElementById("userName").value.trim();
        var password = document.getElementById("password").value.trim();
        var loginBtn = document.getElementById("loginBtn");

        loginBtn.disabled = !(userName && password);
    }

    window.onload = function () {
        document.getElementById("loginBtn").disabled = true;
    };
</script>
</body>
</html>
