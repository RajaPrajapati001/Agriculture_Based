<%--
    Document   : inputotp
    Created on : Aug 6, 2024, 1:02:15 PM
    Author     : raja
--%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f0f0f0;
                background-image: repeating-linear-gradient(68deg, rgb(22, 108, 14) 0%, rgb(144, 239, 136) 50%, rgb(212, 172, 98) 50%, rgb(210, 201, 185) 100%);
                border-radius: 10px;
            }

            .container {
                background-color: white;
                border-radius: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width: 300px;
                text-align: center;
            }

            .container img {
                width: 100px;
                height: 90px;
                margin-bottom: 20px;
            }

            .container p {
                margin-bottom: 20px;
            }

            .otp-input {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 20px;
            }

            .otp-input label {
                font-size: 16px;
                margin-bottom: 10px;
            }

            .otp-input input {
                width: 80%;
                height: 40px;
                text-align: center;
                font-size: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .btn {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #28a745;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }

            .btn:hover {
                background-color: #218838;
            }

            .resend-link {
                display: inline;
                margin-top: 10px;
                font-size: 14px;
            }

            .resend-container {
                margin-top: 20px;
            }
        </style>
    </head>

    <body>
        <% String email = (String) session.getAttribute("mail"); %>
        <div class="container">
            <img src="logoemail.jpg" alt="Email Icon">
            <p>Please check your email</p>
            <p>We've sent a code to <%= email %></p>
            <p>OTP Will Be Expire After 5 Minutes</p>
            <form action="createAcLogic.jsp" method="post">
                <div class="otp-input">
                    <label for="otp">Enter OTP:</label>
                    <input type="number" id="otp" name="inputotp" min="1000" max="9999" required>
                </div>
                <input type="submit" class="btn" value="Verify">
            </form>
            <div class="resend-container">
                Didn't get the OTP? <a href="resend.jsp" class="resend-link">Click to resend</a>
            </div>
        </div>
    </body>

</html>
