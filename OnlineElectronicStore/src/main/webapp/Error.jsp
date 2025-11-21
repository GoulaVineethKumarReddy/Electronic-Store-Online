<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice - ElectroStore Admin</title>
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
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 560px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        /* Dynamic header based on message type */
        .notice-header {
            padding: 60px 40px;
            text-align: center;
            color: white;
            position: relative;
        }

        .notice-header.error {
            background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        }

        .notice-header.warning {
            background: linear-gradient(135deg, #ffa726 0%, #fb8c00 100%);
        }

        .notice-header.info {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .notice-header .icon {
            font-size: 5.5rem;
            margin-bottom: 20px;
            animation: shake 0.8s ease-in-out;
            display: block;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-10px); }
            20%, 40%, 60%, 80% { transform: translateX(10px); }
        }

        .notice-header h1 {
            font-size: 2.6rem;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .notice-message {
            padding: 40px;
            background: white;
            text-align: center;
            font-size: 1.4rem;
            font-weight: 500;
            color: #333;
            min-height: 140px;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 1.6;
        }

        .notice-body {
            padding: 45px 40px;
            background: white;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .nav-btn {
            padding: 18px;
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
            gap: 14px;
            color: white;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.18);
        }

        .btn-add { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
        .btn-view { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .btn-logout { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }

        .nav-btn:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .nav-btn i { font-size: 1.5rem; }

        @media (max-width: 480px) {
            .notice-header h1 { font-size: 2.1rem; }
            .notice-header .icon { font-size: 4.2rem; }
            .notice-message { font-size: 1.2rem; padding: 30px 20px; }
            .notice-body { padding: 35px 25px; }
            .nav-btn { font-size: 1.1rem; padding: 16px; }
        }
    </style>
</head>
<body>

<%
    String data = (String) request.getAttribute("msg");
    if (data == null || data.trim().isEmpty()) {
        data = "An unexpected action occurred. Please try again.";
    }

    // Auto-detect message type
    String headerClass = "info";
    String icon = "fa-info-circle";

     if (data.toLowerCase().contains("not found") || 
        data.toLowerCase().contains("fail") || 
        data.toLowerCase().contains("invalid") || 
        data.toLowerCase().contains("error")) {
        headerClass = "error";
        icon = "fa-exclamation-triangle";
    } else if (data.toLowerCase().contains("warning") || data.toLowerCase().contains("already")) {
        headerClass = "warning";
        icon = "fa-exclamation-circle";
    }
%>

    <div class="notice-container">
        <div class="notice-header <%= headerClass %>">
            <div class="icon">
                <i class="fas <%= icon %>"></i>
            </div>
            <h1>Attention Required</h1>
        </div>

        <div class="notice-message">
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