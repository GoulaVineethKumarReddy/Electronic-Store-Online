<%@page import="com.pack2.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully! - ElectroStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .success-container {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 600px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        .success-header {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            padding: 60px 40px;
            text-align: center;
            color: white;
        }

        .success-header .icon {
            font-size: 6.5rem;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
            text-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-30px); }
            60% { transform: translateY(-15px); }
        }

        .success-header h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .greeting {
            font-size: 1.6rem;
            opacity: 0.95;
            margin-bottom: 10px;
        }

        .success-body {
            padding: 50px 40px;
            text-align: center;
            background: white;
        }

        .order-details {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 30px;
            border-radius: 18px;
            margin: 25px 0;
            font-size: 1.5rem;
            color: #333;
        }

        .amount {
            font-size: 2.4rem;
            font-weight: 800;
            color: #2d8f5f;
            margin: 15px 0;
            text-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .thank-you {
            font-size: 1.8rem;
            color: #2c3e50;
            margin: 20px 0;
            font-weight: 600;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 40px;
        }

        .btn {
            padding: 18px 30px;
            font-size: 1.3rem;
            font-weight: 600;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            color: white;
            transition: all 0.4s ease;
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }

        .btn-shop {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .btn-logout {
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
        }

        .btn:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .btn i {
            font-size: 1.6rem;
        }

        .footer-note {
            margin-top: 40px;
            color: #777;
            font-size: 1rem;
        }

        @media (max-width: 480px) {
            .success-header h1 { font-size: 2.4rem; }
            .success-header .icon { font-size: 5rem; }
            .greeting { font-size: 1.4rem; }
            .amount { font-size: 2rem; }
            .thank-you { font-size: 1.5rem; }
            .success-body { padding: 40px 25px; }
            .btn { font-size: 1.1rem; padding: 16px 25px; }
        }
    </style>
</head>
<body>

<%
    Integer productsPrice = (Integer) request.getAttribute("productsPrice");
    CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");
    
    if (cbean == null || productsPrice == null) {
        response.sendRedirect("CustomerLogin.html");
        return;
    }
    
    String customerName = cbean.getCustomerFirstName();
    int totalAmount = productsPrice;
%>

    <div class="success-container">
        <div class="success-header">
            <div class="icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1>Order Confirmed!</h1>
            <p class="greeting">Thank you, <strong><%= customerName %>!</strong></p>
        </div>

        <div class="success-body">
            <div class="order-details">
                <div class="amount">
                    ₹<%= String.format("%,d", totalAmount) %>
                </div>
                <div class="thank-you">
                    Your order has been placed successfully!
                </div>
                <p>We’ve received your payment and your items are being prepared for shipping.</p>
            </div>

            <div class="action-buttons">
                <a href="view2" class="btn btn-shop">
                    <i class="fas fa-shopping-bag"></i>
                    Continue Shopping
                </a>
                
                <a href="logout" class="btn btn-logout">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </div>

            <p class="footer-note">
                You’ll receive an order confirmation email shortly at your registered email.
            </p>
        </div>
    </div>

</body>
</html>