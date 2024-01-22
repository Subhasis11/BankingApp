<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Center the overlay */
         <style>
            body {
                       font-family: 'Arial', sans-serif;
                       margin: 0;
                       padding: 0;
                       background-image: url('${pageContext.request.contextPath}/images/ok.jpg');
                       background-size: contain;
                       background-position: center;
                       background-repeat: no-repeat;
                       height: 100vh; /* Ensure the body takes the full height of the viewport */
                   }
        .overlay {
            display: flex;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }

        /* Style the registration form */
        .registration-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }

        .registration-form h2 {
            color: #333;
        }

        .registration-form p {
            color: #666;
        }

        .registration-form button {
            background-color: #eb5656;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .registration-form button:first-child {
            margin-right: 10px;
            background-color: #999;
        }
    </style>
</head>
<body>

<!-- Registration success overlay -->
<div class="overlay" id="registrationSuccessOverlay">
    <div class="registration-form">
        <h2>Registration Successful</h2>
        <p>Your account number: ${accountNumber}</p>
        <p>You can now log in.</p>
        <button type="button" onclick="hideRegistrationSuccessOverlay()">Close</button>
        <button onclick="redirectToLogin()">Log In</button>
    </div>
</div>

<!-- Include the registration success popup script -->
<!-- Include the registration success popup script -->
<script src="${pageContext.request.contextPath}/script.js"></script>
<script>
    // Show the registration success overlay
    document.getElementById('registrationSuccessOverlay');

    // Function to hide the registration success overlay and redirect to homepage
    function hideRegistrationSuccessOverlay() {
        document.getElementById('registrationSuccessOverlay').style.display = 'none';
        redirect('/register'); // Redirect to the homepage
    }

    // Function to redirect to the login page
    function redirect(url) {
        window.location.href = url;
    }
     function redirectToLogin() {
                       document.getElementById('registrationSuccessOverlay').style.display = 'none';
                       redirect('/login1'); // Redirect to the homepage
                   }
</script>


</body>
</html>
