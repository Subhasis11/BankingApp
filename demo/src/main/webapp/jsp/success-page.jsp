<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balance Transfer Success</title>
    <!-- Add your stylesheets, scripts, or any other metadata here -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .background-image {
            background-image: url('${pageContext.request.contextPath}/images/ok.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
        }

        .success-container {
            background-color: rgba(255, 255, 255, 0.8);
            border: 1px solid #d6e9c6;
            border-radius: 4px;
            padding: 20px;
            max-width: 400px;
            text-align: center;
            position: relative;
            top: 50%; /* Move the container up by 50% of its height */
            left: 50%; /* Move the container left by 50% of its width */
            transform: translate(-50%, -50%); /* Center the container */
        }

        .close-icon {
            color: #f00;
            font-size: 30px;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>

<div class="background-image">
    <div class="success-container">
        <h1>Balance Transfer Successful</h1>

        <p>Your balance transfer was successful!</p>

        <div>
            <h2>Your Updated Account Balance:</h2>
            <p>${senderAccountBalance}</p>
        </div>

        <span class="close-icon" onclick="closeSuccessPage()">&times;</span>
    </div>
</div>

<!-- Add your scripts or any other bottom-of-the-page elements here -->
<script>
    function closeSuccessPage() {
        window.location.href = "${pageContext.request.contextPath}/Userhomepage1";
    }
</script>
</body>
</html>
