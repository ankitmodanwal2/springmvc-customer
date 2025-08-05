<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>FashionHub - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f5f5f5;
        }

        header {
            background-color: #333;
            color: white;
            padding: 15px 30px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #444;
            padding: 10px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 25px;
            font-weight: bold;
            font-size: 18px;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .section {
            padding: 30px;
            text-align: center;
        }

        .section h2 {
            margin-bottom: 20px;
        }

        .cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .card {
            background-color: white;
            padding: 20px;
            width: 250px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        .card img {
            width: 100%;
            border-radius: 8px;
        }

        .card button {
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .card button:hover {
            background-color: #388E3C;
        }
    </style>
</head>
<body>
<header>
    <h1>Welcome to FashionHub</h1>
    <p>Hello, ${customerDetails.name}!</p>
</header>

<nav>
    <a href="#men">Men</a>
    <a href="#women">Women</a>
    <a href="#kids">Children</a>
</nav>

<div class="section" id="men">
    <h2>Men's Collection</h2>
    <div class="cards">
        <div class="card">
            <img src="https://via.placeholder.com/200x200?text=Men+Shirt" alt="Men Shirt">
            <p>Classic Shirt - ₹899</p>
            <button>Add to Cart</button>
        </div>
        <!-- Add more cards here -->
    </div>
</div>

<div class="section" id="women">
    <h2>Women's Collection</h2>
    <div class="cards">
        <div class="card">
            <img src="https://via.placeholder.com/200x200?text=Women+Dress" alt="Women Dress">
            <p>Summer Dress - ₹1199</p>
            <button>Add to Cart</button>
        </div>
    </div>
</div>

<div class="section" id="kids">
    <h2>Children's Collection</h2>
    <div class="cards">
        <div class="card">
            <img src="https://via.placeholder.com/200x200?text=Kids+T-Shirt" alt="Kids T-Shirt">
            <p>Cartoon T-Shirt - ₹499</p>
            <button>Add to Cart</button>
        </div>
    </div>
</div>
</body>
</html>
