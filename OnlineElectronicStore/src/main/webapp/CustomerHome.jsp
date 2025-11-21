<%@page import="com.pack2.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - ElectroStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .customer-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
            width: 100%;
            max-width: 520px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .customer-header {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            padding: 50px 30px;
            text-align: center;
            color: white;
        }

        .customer-header .avatar {
            width: 110px;
            height: 110px;
            background: rgba(255, 255, 255, 0.25);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 3.5rem;
            backdrop-filter: blur(10px);
            border: 4px solid rgba(255, 255, 255, 0.3);
        }

        .customer-header h1 {
            font-size: 2.4rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .welcome-text {
            font-size: 1.3rem;
            opacity: 0.95;
            font-weight: 500;
        }

        .customer-body {
            padding: 50px 40px;
            text-align: center;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 20px;
        }

        .btn {
            padding: 18px 25px;
            font-size: 1.2rem;
            font-weight: 600;
            border: none;
            border-radius: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            color: white;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .btn-shop {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .btn-logout {
            background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);
        }

        .btn:hover {
            transform: translateY(-6px);
            box-shadow: 0 18px 35px rgba(0, 0, 0, 0.25);
        }

        .btn i {
            font-size: 1.5rem;
        }

        .footer-note {
            margin-top: 40px;
            color: #888;
            font-size: 0.95rem;
        }

        @media (max-width: 480px) {
            .customer-header h1 { font-size: 2rem; }
            .welcome-text { font-size: 1.1rem; }
            .customer-body { padding: 40px 30px; }
            .btn { font-size: 1.1rem; padding: 16px 20px; }
        }
    </style>
</head>
<body>

<%
    CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");
    if (cbean == null) {
        response.sendRedirect("CustomerLogin.html");
        return;
    }
%>

    <div class="customer-container">
        <div class="customer-header">
            <div class="avatar">
                <i class="fas fa-user-circle"></i>
            </div>
            <h1>Welcome Back!</h1>
            <p class="welcome-text">
                Hello, <strong><%= cbean.getCustomerFirstName() %></strong>
            </p>
        </div>

        <div class="customer-body">
            <div class="action-buttons">
                <a href="view2" class="btn btn-shop">
                    <i class="fas fa-store"></i>
                    Browse & Shop Products
                </a>

                <a href="logout" class="btn btn-logout">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </div>

            <p class="footer-note">
                Happy Shopping! Explore the latest electronics at the best prices.
            </p>
        </div>
    </div>

</body>
</html>