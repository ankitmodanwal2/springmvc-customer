<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Customer Signup</title>
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
            margin-bottom: 10px;
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

        input[type="submit"]:disabled {
            background-color: #ccc;
            cursor: not-allowed;
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

        input[type="submit"]:hover:enabled {
            background-color: #218838;
        }

        #usernameMsg {
            font-size: 13px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Customer Signup</h2>

    <form:form action="savecustomer" modelAttribute="custAtt" method="POST" id="signupForm">
        <label>Name:</label>
        <form:input path="name" id="name" onkeyup="validateForm()" />

        <label>Username:</label>
        <form:input path="userName" id="userName" onblur="checkUsername()" onkeyup="validateForm()" />
        <div id="usernameMsg"></div>

        <label>Password:</label>
        <form:password path="password" id="password" onkeyup="validateForm()" />

        <label>Gender:</label>
        <div class="gender-options">
            <form:radiobutton path="gender" id="male" value="male" onclick="validateForm()" /> Male
            <form:radiobutton path="gender" id="female" value="female" onclick="validateForm()" /> Female
            <form:radiobutton path="gender" id="other" value="other" onclick="validateForm()" /> Other
        </div>

        <input type="submit" id="submitBtn" value="Submit" disabled />
    </form:form>
</div>

<script>
    let usernameAvailable = false;

    function checkUsername() {
        const userName = document.getElementById("userName").value.trim();
        const msg = document.getElementById("usernameMsg");
        const submitBtn = document.getElementById("submitBtn");

        if (userName === "") {
            msg.innerHTML = "";
            usernameAvailable = false;
            validateForm();
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open("GET", "checkUsername?userName=" + encodeURIComponent(userName), true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (xhr.responseText === "taken") {
                    msg.innerHTML = "<span style='color:red;'>Username already taken</span>";
                    usernameAvailable = false;
                } else {
                    msg.innerHTML = "<span style='color:green;'>Username is available</span>";
                    usernameAvailable = true;
                }
                validateForm(); // Re-validate form after response
            }
        };
        xhr.send();
    }

    function validateForm() {
        const name = document.getElementById("name").value.trim();
        const userName = document.getElementById("userName").value.trim();
        const password = document.getElementById("password").value.trim();
        const genderSelected = document.getElementById("male").checked || document.getElementById("female").checked || document.getElementById("other").checked;
        const submitBtn = document.getElementById("submitBtn");

        if (name !== "" && userName !== "" && password !== "" && genderSelected && usernameAvailable) {
            submitBtn.disabled = false;
        } else {
            submitBtn.disabled = true;
        }
    }

    // On load: keep submit button disabled
    window.onload = function () {
        document.getElementById("submitBtn").disabled = true;
    };
</script>

</body>
</html>
