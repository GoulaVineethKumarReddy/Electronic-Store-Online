<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - ElectroStore Admin</title>
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

        .success-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.35);
            width: 100%;
            max-width: 520px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .success-header {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            padding: 50px 30px;
            text-align: center;
            color: white;
        }

        .success-header .icon {
            font-size: 4.5rem;
            margin-bottom: 15px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-20px); }
            60% { transform: translateY(-10px); }
        }

        .success-header h1 {
            font-size: 2.3rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .success-message {
            font-size: 1.2rem;
            opacity: 0.95;
            font-weight: 500;
        }

        .success-body {
            padding: 40px 35px;
            text-align: center;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 18px;
            margin-top: 20px;
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
            transform: translateY(-4px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
        }

        .nav-btn i { font-size: 1.3rem; }

        @media (max-width: 480px) {
            .success-header h1 { font-size: 1.9rem; }
            .success-header .icon { font-size: 3.8rem; }
            .success-body { padding: 30px 25px; }
        }
    </style>
</head>
<body>

    <div class="success-container">
        <div class="success-header">
            <div class="icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1>Success!</h1>
            <p class="success-message">
                <%
                    AdminBean abean = (AdminBean) session.getAttribute("abean");
                    String data = (String) request.getAttribute("msg");
                    if (abean != null && data != null) {
                        out.println("<strong>" + abean.getA_fname() + "</strong>, " + data);
                    } else {
                        out.println("Action completed successfully!");
                    }
                %>
            </p>
        </div>

        <div class="success-body">
            <div class="nav-links">
                <a href="AddProduct.html" class="nav-btn btn-add">
                    <i class="fas fa-plus-circle"></i>
                    Add Another Product
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