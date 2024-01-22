<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Banking App - Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('${pageContext.request.contextPath}/images/bank.jpg');
            background-size: cover;
            background-position: center;
        }

        .navbar {
            background: rgba(51, 51, 51, 0.7); /* Semi-transparent dark gray */
            color: #fff;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            flex-direction: column; /* Stack child elements vertically */
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 10px; /* Add some bottom margin for spacing */
            align-self: flex-start; /* Align to the start (top) of the container */
        }

        .nav-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .register-text {
            margin-right: 10px;
            font-weight: bold;
            color: #fff;
            text-align: center;
        }

        .nav-item {
            margin-left: auto;
        }

        .nav-link {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .nav-link:hover {
            color: #eb5656;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }

        .login-form {
            background-color: #f97d7d;
            padding: 20px;
            border-radius: 5px;
            margin-top:150px;
        }

        .login-form label {
            display: block;
            margin-bottom: 10px;
        }

        .login-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .login-form button {
            background-color: #eb5656;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-form button:first-child {
            margin-right: 10px;
            background-color: #999;
        }
    </style>
</head>
<body>
    <main class="container">
        <section class="login-form">
            <h2>User Login</h2>
            <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                <c:if test="${not empty error}">
                    <div style="color: red;">${error}</div>
                </c:if>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Login</button>
            </form>
        </section>
    </main>
    <!-- Registration form overlay -->
    <div class="overlay" id="registrationOverlay">
        <!-- Include the registration form content here -->
    </div>

    <script src="${pageContext.request.contextPath}/script.js"></script>
    <script>
        function showRegistrationForm() {
            document.getElementById('registrationOverlay').style.display = 'flex';
        }

        // Other functions and scripts as needed
    </script>
</body>
</html>
