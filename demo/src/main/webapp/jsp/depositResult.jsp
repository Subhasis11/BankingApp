<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Result</title>
    <style>
        /* Add your styles for the deposit result page here */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            background-size: contain;
                                background-position: center;
                                background-repeat: no-repeat;
             background-image: url('${pageContext.request.contextPath}/images/ok.jpg');
            padding: 50px;
            height: 100vh;
        }

        .popup {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }

        .close-btn {
            background-color: #f96852;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 50%;
            font-size: 16px;
            margin-top: 20px;
        }

        .close-btn:hover {
            background-color: #eb5656;
        }
    </style>
</head>
<body>

<div class="popup">
    <h2>Deposit Successful</h2>
    <p>Your deposit was successful. Your updated balance is: <strong>${updatedBalance}</strong></p>
    <button class="close-btn" onclick="redirectToHomepage()">Close</button>
</div>

<script>
    function redirectToHomepage() {
        window.location.href = "/back"; // Change the URL to the actual homepage URL
    }
</script>

</body>
</html>
