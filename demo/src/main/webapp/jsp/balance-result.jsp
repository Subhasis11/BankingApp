<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <title>Balance Result</title>
    <style>
        /* Add your custom CSS for the popup here */
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
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- Display the result in a popup -->
<div id="balancePopup" class="popup">
    <span class="close" onclick="closePopup()">&times;</span>
    <h2>Balance Result</h2>
    <p>Balance: ${balance}</p>
</div>

<script>
    // JavaScript function to display the popup
    function displayPopup() {
        document.getElementById('balancePopup').style.display = 'block';
    }

    // JavaScript function to close the popup and redirect to the user's homepage
    function closePopup() {
        document.getElementById('balancePopup').style.display = 'none';
        // Redirect to the user's homepage, adjust the URL accordingly
        window.location.href = "${pageContext.request.contextPath}/Userhomepage1";
    }

    // Call the displayPopup function when the page loads
    window.onload = function () {
        displayPopup();
    };
</script>

</body>
</html>
