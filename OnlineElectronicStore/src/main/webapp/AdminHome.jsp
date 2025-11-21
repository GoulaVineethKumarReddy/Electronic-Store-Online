<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - ElectroStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .dashboard-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 480px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 50px 30px;
            text-align: center;
            color: white;
        }

        .dashboard-header i {
            font-size: 4rem;
            margin-bottom: 15px;
            text-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .dashboard-header h1 {
            font-size: 2.4rem;
            font-weight: 700;
        }

        .welcome-name {
            font-size: 1.6rem;
            margin-top: 10px;
            font-weight: 500;
            opacity: 0.95;
        }

        .dashboard-body {
            padding: 50px 40px;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .menu-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 18px;
            padding: 22px 20px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            text-decoration: none;
            border-radius: 16px;
            font-size: 1.3rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 10px 25px rgba(245, 87, 108, 0.3);
        }

        .menu-btn i {
            font-size: 1.8rem;
        }

        .menu-btn:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(245, 87, 108, 0.4);
        }

        .menu-btn.logout {
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            color: #d6293b;
            font-weight: 700;
        }

        .menu-btn.logout i {
            color: #d6293b;
        }

        .menu-btn.logout:hover {
            background: #ff9a9e;
            color: white;
        }

        .menu-btn.logout:hover i {
            color: white;
        }

        @media (max-width: 480px) {
            .dashboard-header h1 { font-size: 2rem; }
            .welcome-name { font-size: 1.4rem; }
            .dashboard-body { padding: 40px 25px; }
            .menu-btn { font-size: 1.1rem; padding: 18px; }
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
        <div class="dashboard-header">
            <i class="fas fa-crown"></i>
            <h1>Admin Dashboard</h1>
            <div class="welcome-name">
                <%
                    AdminBean abean = (AdminBean) session.getAttribute("abean");
                    if (abean != null) {
                        out.println("Welcome, " + abean.getA_fname() + "!");
                    } else {
                        out.println("Welcome, Admin!");
                    }
                %>
            </div>
        </div>

        <div class="dashboard-body">
            <div class="menu-grid">
                <a href="AddProduct.html" class="menu-btn">
                    <i class="fas fa-plus-circle"></i>
                    Add New Product
                </a>

                <a href="view1" class="menu-btn">
                    <i class="fas fa-th-list"></i>
                    View All Products
                </a>

                <a href="logout" class="menu-btn logout">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </div>
        </div>
    </div>

</body>
</html>