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
            background-image: url('${pageContext.request.contextPath}/images/ok.jpg');
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh; /* Ensure the body takes the full height of the viewport */
        }

        .user-navbar {
            display: flex;
            justify-content: flex-start; /* Align items to the start (left) */
            align-items: center; /* Center items vertically */
            flex-wrap: nowrap; /* Ensure items stay in the same row */
            background: rgba(51, 51, 51, 0.7);
            color: #fff;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 10px;
        }

        .logo img {
            margin-right: 10px; /* Adjust margin as needed */
            vertical-align: middle;
            width: 50px; /* Adjust the width of the animated GIF */
        }

        .nav-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            margin-left:240px;
            align-items: center;
        }

        .user-nav-item {
            margin-left: 40px;
            font-size: 20px;
        }

        .user-nav-item:not(:last-child) {
            margin-right: 20px; /* Add margin to all elements except the last one */
        }

        .user-nav-item a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
            cursor: pointer;
        }

        .user-nav-item a:hover {
            color: #eb5656;
        }

        .jumbotron {
            background: rgba(51, 51, 51, 0.7);
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        /* Add styles for the modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 50px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 10px;
            border: 1px solid #888;
            width: 40%;
            text-align: center;
            border-radius: 5px;
        }

        .close {
            color: ##f00;;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:#f00;,
        .close:focus {
            color: black;
            text-decoration: none;
        }

        /* Add styles for the form and button */
        #emailForm {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #emailForm label {
            margin-bottom: 10px;
        }

        #emailForm input {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #emailForm button {
            background-color: #f96852;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 50%;
            font-size: 16px;
        }

        #emailForm button:hover {
            background-color: #f96852;
        }
        #depositForm {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #depositForm label {
            margin-bottom: 10px;
        }

        #depositForm input {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #depositForm button {
            background-color: #f96852;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 80%; /* Updated width */
            font-size: 16px;
        }

        #depositForm button:hover {
            background-color: #f96852;
        }
        body.modal-open {
            overflow: hidden;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 50px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 0 auto; /* Center horizontally */
            padding: 10px;
            border: 1px solid #888;
            max-width: 60%; /* Adjust the maximum width as needed */
            text-align: center;
            border-radius: 5px;
            position: absolute;
            top: 50%; /* Center vertically */
            left: 50%; /* Center horizontally */
            transform: translate(-50%, -50%); /* Center both horizontally and vertically */
        }
       /* Styles for Withdraw Modal */
       #withdrawModal {
           display: none;
           position: fixed;
           z-index: 1;
           left: 0;
           top: 0;
           width: 100%;
           height: 100%;
           overflow: auto;
           background-color: rgba(0, 0, 0, 0.5);
           padding-top: 50px;
       }

       #withdrawModal .modal-content {
           background-color: #fefefe;
           margin: auto;
           padding: 10px;
           border: 1px solid #888;
           width: 40%;
           text-align: center;
           border-radius: 5px;
           position: absolute;
           top: 50%;
           left: 50%;
           transform: translate(-50%, -50%);
           max-width: 80%; /* Adjust the maximum width as needed */
       }

       #withdrawModal .close {
           color: #f00;
           float: right;
           font-size: 28px;
           font-weight: bold;
           cursor: pointer;
       }

       #withdrawModal .close:focus {
           color: black;
           text-decoration: none;
       }

       #withdrawForm {
           display: flex;
           flex-direction: column;
           align-items: center;
       }

       #withdrawForm label {
           margin-bottom: 10px;
       }

       #withdrawForm input {
           width: 80%;
           padding: 10px;
           margin-bottom: 15px;
           border: 1px solid #ccc;
           border-radius: 4px;
           box-sizing: border-box;
       }

       #withdrawForm button {
           background-color: #f96852;
           color: white;
           padding: 10px;
           border: none;
           border-radius: 4px;
           cursor: pointer;
           width: 80%;
           font-size: 16px;
       }

       #withdrawForm button:hover {
           background-color: #f96852;
       }
        /* Styles for Balance Transfer Modal */
        #balanceTransferModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 50px;
        }

        #balanceTransferModal .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 10px;
            border: 1px solid #888;
            width: 40%;
            text-align: center;
            border-radius: 5px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 80%; /* Adjust the maximum width as needed */
        }

        #balanceTransferModal .close {
            color: #f00;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        #balanceTransferModal .close:focus {
            color: black;
            text-decoration: none;
        }

        #balanceTransferForm {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #balanceTransferForm label {
            margin-bottom: 10px;
        }

        #balanceTransferForm input {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #balanceTransferForm button {
            background-color: #f96852;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 80%;
            font-size: 16px;
        }

        #balanceTransferForm button:hover {
            background-color: #f96852;
        }


    </style>
</head>
<body>

<header>
    <nav class="navbar user-navbar">
        <div class="container">
            <div class="logo-container">
                <h1 class="logo">
                    <img src="${pageContext.request.contextPath}/images/bankv.gif" alt="Animated GIF">
                    BankingApp
                </h1>
            </div>
            <ul class="nav-list">
                <!-- Add the onclick attribute to call the openBalanceModal() function -->
                <li class="user-nav-item"><a onclick="openBalanceModal()">Balance</a></li>
                 <li class="user-nav-item"><a onclick="openBalanceTransferModal()">Balance Transfer</a></li>
                <!-- Add the onclick attribute to call the openDepositModal() function -->
                <li class="user-nav-item"><a onclick="openDepositModal()">Deposit</a></li>

               <li class="user-nav-item"><a onclick="openWithdrawModal()">Withdraw</a></li>

                <li class="user-nav-item"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </div>
    </nav>
</header>

<!-- Add a modal for email input -->
<div id="emailModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeEmailModal()">&times;</span>
        <h2>Enter Email</h2>

     <form id="emailForm" action="${pageContext.request.contextPath}/balance" method="post">
                 <label for="email">Email:</label>
                 <input type="email" id="email" name="email" required>
                 <button type="submit" formaction="${pageContext.request.contextPath}/balance">Submit</button>
             </form>
    </div>
</div>
<div id="depositModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeDepositModal()">&times;</span>
        <h2>Deposit Money</h2>

        <form id="depositForm" action="${pageContext.request.contextPath}/deposit" method="post">
            <label for="depositEmail">Email:</label>
            <input type="email" id="depositEmail" name="email" required>

            <label for="depositAmount">Amount:</label>
            <input type="number" id="depositAmount" name="amount" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>
<!-- Other existing overlays and scripts here -->
<div id="withdrawModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeWithdrawModal()">&times;</span>
        <h2>Withdraw Money</h2>

        <form id="withdrawForm" action="${pageContext.request.contextPath}/withdraw" method="post">
            <label for="withdrawEmail">Email:</label>
            <input type="email" id="withdrawEmail" name="email" required>

            <label for="withdrawAmount">Amount:</label>
            <input type="number" id="withdrawAmount" name="amount" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>
<div id="balanceTransferModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeBalanceTransferModal()">&times;</span>
        <h2>Balance Transfer</h2>

        <form id="balanceTransferForm" action="${pageContext.request.contextPath}/balance-transfer" method="post">
            <label for="senderEmail">Your Email:</label>
            <input type="email" id="senderEmail" name="senderEmail" required>

            <label for="recipientEmail">Recipient's Email:</label>
            <input type="email" id="recipientEmail" name="recipientEmail" required>

            <label for="transferAmount">Amount:</label>
            <input type="number" id="transferAmount" name="amount" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>

<script>
    // JavaScript functions for modal interaction
    function openBalanceModal() {
        document.getElementById('emailModal').style.display = 'block';
    }

    function closeEmailModal() {
        document.getElementById('emailModal').style.display = 'none';
    }

    // Add AJAX call to fetch balance (you can use your existing getBalance() function)
    function getBalance() {
        var email = document.getElementById('email').value;
        // Add your AJAX call here
        // You can close the modal after processing the email
        closeEmailModal();
    }
     function openDepositModal() {
            document.getElementById('depositModal').style.display = 'block';
        }

        function closeDepositModal() {
            document.getElementById('depositModal').style.display = 'none';
        }
  function openWithdrawModal() {
        document.getElementById('withdrawModal').style.display = 'block';
    }

    function closeWithdrawModal() {
        document.getElementById('withdrawModal').style.display = 'none';
    }
      // JavaScript functions for modal interaction
        function openBalanceTransferModal() {
            document.getElementById('balanceTransferModal').style.display = 'block';
        }

        function closeBalanceTransferModal() {
            document.getElementById('balanceTransferModal').style.display = 'none';
        }

        // Call this function when the user clicks on "Balance Transfer" button
        function initiateBalanceTransfer() {
            openBalanceTransferModal();
        }
</script>

</body>
</html>
