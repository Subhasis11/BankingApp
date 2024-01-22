<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Result</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .withdraw-result {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .success-img {
            max-width: 100px;
            margin-bottom: 20px;
        }

        h2 {
            color: #4CAF50;
        }

        p {
            color: #333;
        }

        button {
            background-color: #f96852;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #f96852;
        }
    </style>
</head>
<body>

<div class="withdraw-result">

    <h2>Withdrawal Successful</h2>
    <p>Your withdrawal was successful. Your updated balance is: ${updatedBalance}</p>
    <button onclick="closeWithdrawResult()">Close</button>
</div>

<script>
    function closeWithdrawResult() {

                window.location.href = "${pageContext.request.contextPath}/Userhomepage1";
    }
</script>

</body>
</html>
