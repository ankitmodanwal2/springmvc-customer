<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
        }

        .form-container {
            background-color: #ffffff;
            max-width: 400px;
            margin: 60px auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .gender-options {
            margin-bottom: 15px;
        }

        .gender-options label {
            display: inline;
            margin-right: 15px;
            font-weight: normal;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Customer Signup</h2>

    <form:form action="savecustomer" modelAttribute="custAtt" method="POST">
        <label>Name:</label>
        <form:input path="name" />

        <label>Username:</label>
        <form:input path="userName" />

        <label>Password:</label>
        <form:password path="password" />

        <label>Gender:</label>
        <div class="gender-options">
            <form:radiobutton path="gender" value="male" /> Male
            <form:radiobutton path="gender" value="female" /> Female
            <form:radiobutton path="gender" value="other" /> Other
        </div>

        <input type="submit" value="Submit" />
    </form:form>
</div>

</body>
</html>
