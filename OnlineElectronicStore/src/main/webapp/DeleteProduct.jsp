<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Message - ElectroStore</title>
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

        .message-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
            width: 100%;
            max-width: 540px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .message-header {
            padding: 50px 30px;
            text-align: center;
            color: white;
        }

        /* Dynamic header color based on message type */
        .success { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }
        .error   { background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%); }
        .info    { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }

        .message-header .icon {
            font-size: 4.8rem;
            margin-bottom: 15px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .message-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .welcome-msg {
            font-size: 1.4rem;
            opacity: 0.95;
            font-weight: 500;
        }

        .main-message {
            padding: 35px 40px;
            text-align: center;
            background: #f8f9fa;
            font-size: 1.5rem;
            font-weight: 600;
            color: #333;
            min-height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .message-body {
            padding: 40px 35px;
            background: white;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .nav-btn {
            padding: 16px 20px;
            font-size: 1.15rem;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            color: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .btn-add { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
        .btn-view { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .btn-logout { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }

        .nav-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 18px 35px rgba(0, 0, 0, 0.25);
        }

        .nav-btn i { font-size: 1.4rem; }

        @media (max-width: 480px) {
            .message-header h1 { font-size: 2rem; }
            .message-header .icon { font-size: 3.8rem; }
            .main-message { font-size: 1.3rem; padding: 30px 20px; }
            .message-body { padding: 35px 25px; }
        }
    </style>
</head>
<body>

<%
    AdminBean abean = (AdminBean) session.getAttribute("abean");
    String data = (String) request.getAttribute("msg");
    
    // Default values if something is missing
    if (abean == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }
    if (data == null) data = "Welcome back to the dashboard!";
    
    // Auto-detect message type for header color
    String headerClass = "info";
    String icon = "fa-info-circle";
    
    if (data.toLowerCase().contains("success") || data.toLowerCase().contains("added") || data.toLowerCase().contains("updated")) {
        headerClass = "success";
        icon = "fa-check-circle";
    } else if (data.toLowerCase().contains("fail") || data.toLowerCase().contains("invalid") || data.toLowerCase().contains("error")) {
        headerClass = "error";
        icon = "fa-exclamation-triangle";
    }
%>

    <div class="message-container">
        <div class="message-header <%= headerClass %>">
            <div class="icon">
                <i class="fas <%= icon %>"></i>
            </div>
            <h1>Hello, <%= abean.getA_fname() %>!</h1>
            <p class="welcome-msg">Admin Dashboard</p>
        </div>

        <div class="main-message">
            <%= data %>
        </div>

        <div class="message-body">
            <div class="nav-links">
                <a href="AddProduct.html" class="nav-btn btn-add">
                    <i class="fas fa-plus-circle"></i>
                    Add New Product
                </a>
                
                <a href="view1" class="nav-btn btn-view">
                    <i class="fas fa-eye"></i>
                    View All Products
                </a>
                
                <a href="logout" class="nav-btn btn-logout">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </div>
        </div>
    </div>

</body>
</html>