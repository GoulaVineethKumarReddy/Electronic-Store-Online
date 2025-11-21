<%@ page import="com.pack1.AdminBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Notice - ElectroStore</title>
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

        .notice-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 24px;
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 560px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .notice-header {
            padding: 60px 40px;
            text-align: center;
            color: white;
            position: relative;
        }

        /* Smart color detection */
        .success { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }
        .error   { background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%); }
        .info    { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }

        .notice-header .icon {
            font-size: 5.8rem;
            margin-bottom: 20px;
            animation: bounceIn 1.2s ease-out;
        }

        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            50% { transform: scale(1.1); }
            70% { transform: scale(0.9); }
            100% { transform: scale(1); opacity: 1; }
        }

        .notice-header h1 {
            font-size: 2.7rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .admin-greeting {
            font-size: 1.5rem;
            opacity: 0.95;
            font-weight: 500;
        }

        .main-message {
            padding: 45px 40px;
            background: white;
            text-align: center;
            font-size: 1.6rem;
            font-weight: 600;
            color: #222;
            min-height: 130px;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 1.7;
        }

        .notice-body {
            padding: 50px 40px;
            background: white;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .nav-btn {
            padding: 18px;
            font-size: 1.25rem;
            font-weight: 600;
            border: none;
            border-radius: 16px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 14px;
            color: white;
            transition: all 0.4s ease;
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }

        .btn-add    { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
        .btn-view   { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .btn-logout { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }

        .nav-btn:hover {
            transform: translateY(-8px);
            box-shadow: 0 22px 45px rgba(0,0,0,0.35);
        }

        .nav-btn i { font-size: 1.6rem; }

        @media (max-width: 480px) {
            .notice-header h1 { font-size: 2.2rem; }
            .notice-header .icon { font-size: 4.5rem; }
            .admin-greeting { font-size: 1.3rem; }
            .main-message { font-size: 1.35rem; padding: 35px 25px; }
            .notice-body { padding: 40px 25px; }
        }
    </style>
</head>
<body>

<%
    AdminBean abean = (AdminBean) session.getAttribute("abean");
    String data = (String) request.getAttribute("msg");

    if (abean == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }
    if (data == null || data.trim().isEmpty()) {
        data = "Action completed.";
    }

    // Auto-detect message type for color & icon
    String headerClass = "info";
    String icon = "fa-info-circle";

    String lowerMsg = data.toLowerCase();
    if (lowerMsg.contains("success") || lowerMsg.contains("updated") || lowerMsg.contains("added") || lowerMsg.contains("deleted")) {
        headerClass = "success";
        icon = "fa-check-circle";
    } else if (lowerMsg.contains("fail") || lowerMsg.contains("invalid") || lowerMsg.contains("error") || lowerMsg.contains("not found")) {
        headerClass = "error";
        icon = "fa-exclamation-triangle";
    }
%>

    <div class="notice-container">
        <div class="notice-header <%= headerClass %>">
            <div class="icon">
                <i class="fas <%= icon %>"></i>
            </div>
            <h1>Hello, <%= abean.getA_fname() %>!</h1>
            <p class="admin-greeting">Admin Dashboard</p>
        </div>

        <div class="main-message">
            <strong><%= data %></strong>
        </div>

        <div class="notice-body">
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