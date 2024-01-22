<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Banking App</title>
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

        .registration-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
        }

        .registration-form label {
            display: block;
            margin-bottom: 10px;
        }

        .registration-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .registration-form button {
            background-color: #eb5656;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .registration-form button:first-child {
            margin-right: 10px;
            background-color: #999;
        }

        .jumbotron {
            background: rgba(51, 51, 51, 0.7);
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        .jumbotron button {
            background-color: #eb5656;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
        }

    </style>
</head>
<body>

<header>
    <nav class="navbar">
        <div class="container">
            <h1 class="logo">BankingApp</h1>
            <h1>Welcome to Our Banking App</h1>
            <ul class="nav-list">
                <p class="register-text">Are you a new user? Kindly register</p>
                <li class="nav-item">
                    <button id="loginButton3" onclick="showRegistrationForm()">Register</button>
                </li>
            </ul>
        </div>
    </nav>
</header>

<main class="container">
    <section class="jumbotron">
        <p>Manage your accounts and transactions with ease.</p>
         <button id="loginButton" onclick="redirectToLogin()">Log In</button>


    </section>
</main>

<!-- Registration form overlay -->
<div class="overlay" id="registrationOverlay">
    <div class="registration-form">
        <h2>User Registration</h2>


       <form id="registrationForm" action="${pageContext.request.contextPath}/register1" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

          <label for="mobileNumber">Mobile Number:</label>
          <input type="tel" id="mobile" name="mobileNumber" required>


            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="govtId">Government ID:</label>
            <input type="text" id="govtId" name="govtId" required>

            <!-- Add more fields as needed -->

            <button type="button" onclick="hideRegistrationForm()">Close</button>
        <button  type="submit">Submit</button>
        </form>
    </div>
</div>
<div th:if="${registrationSuccess}" class="overlay" id="registrationSuccessOverlay">
    <div class="registration-form">
        <h2>Registration Successful</h2>
        <p>You can now log in.</p>
        <button type="button" onclick="hideRegistrationSuccessOverlay()">Close</button>
        <button id="loginButton" onclick="redirectToLogin()">Log In</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/script.js"></script>
<script>
     function showRegistrationForm() {
           document.getElementById('registrationOverlay').style.display = 'flex';
           // Hide the success overlay when showing the registration form
           document.getElementById('registrationSuccessOverlay').style.display = 'none';
       }

       function hideRegistrationForm() {
           document.getElementById('registrationOverlay').style.display = 'none';
       }

       function hideRegistrationSuccessOverlay() {
           document.getElementById('registrationSuccessOverlay').style.display = 'none';
       }

       function redirect(url) {
           window.location.href = url;
       }

       function submitRegistrationForm() {
           var form = document.getElementById('registrationForm');
           var formData = new FormData(form);

           fetch(form.action, {
               method: 'POST',
               body: formData
           })
           .then(response => response.json())  // assuming your server returns JSON
           .then(data => {
               if (data.registrationSuccess) {
                   // If registration is successful, show the success overlay
                   document.getElementById('registrationSuccessOverlay').style.display = 'flex';
               } else {
                   // Handle other cases if needed
                   console.error('Registration failed');
               }
           })
           .catch(error => {
               console.error('Error submitting registration form:', error);
           });
       }

            function redirectToLogin() {
                   document.getElementById('registrationSuccessOverlay').style.display = 'none';
                   redirect('/login1'); // Redirect to the homepage
               }
</script>


</body>
</html>
