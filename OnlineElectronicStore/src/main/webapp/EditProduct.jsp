<%@ page import="com.pack1.AdminBean" %>
<%@ page import="com.pack1.ProductBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product - ElectroStore Admin</title>
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

        .update-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
            width: 100%;
            max-width: 580px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .update-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 45px 30px;
            text-align: center;
            color: white;
        }

        .update-header .icon {
            font-size: 4.2rem;
            margin-bottom: 15px;
            text-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .update-header h1 {
            font-size: 2.4rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .admin-name {
            font-size: 1.3rem;
            opacity: 0.95;
            font-weight: 500;
        }

        .product-info {
            background: #f8f9fa;
            padding: 25px 40px;
            border-bottom: 1px solid #eee;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            font-size: 1.1rem;
            color: #444;
        }

        .info-label {
            font-weight: 600;
            color: #333;
        }

        .info-value {
            font-weight: 500;
            color: #555;
        }

        .update-body {
            padding: 45px 50px;
        }

        .form-group {
            margin-bottom: 28px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: 600;
            font-size: 1.1rem;
        }

        .form-group input {
            width: 100%;
            padding: 16px 50px;
            border: 2px solid #e0e0e0;
            border-radius: 14px;
            font-size: 1.2rem;
            background: white;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 5px rgba(102, 126, 234, 0.25);
        }

        .form-group i {
            position: absolute;
            left: 18px;
            top: 48px;
            color: #667eea;
            font-size: 1.3rem;
        }

        .btn-update {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 14px;
            font-size: 1.35rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.45);
        }

        .btn-update:hover {
            transform: translateY(-6px);
            box-shadow: 0 22px 45px rgba(102, 126, 234, 0.55);
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .update-header h1 { font-size: 2rem; }
            .update-header .icon { font-size: 3.5rem; }
            .update-body { padding: 35px 30px; }
            .product-info { padding: 20px 25px; }
        }
    </style>
</head>
<body>

<%
    AdminBean abean = (AdminBean) session.getAttribute("abean");
    ProductBean pbean = (ProductBean) request.getAttribute("pbean");

    if (abean == null || pbean == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }
%>

    <div class="update-container">
        <div class="update-header">
            <div class="icon">
                <i class="fas fa-edit"></i>
            </div>
            <h1>Update Product</h1>
            <p class="admin-name">Hello, <%= abean.getA_fname() %>!</p>
        </div>

        <div class="product-info">
            <div class="info-row">
                <span class="info-label">Product Code:</span>
                <span class="info-value"><%= pbean.getP_code() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Product Name:</span>
                <span class="info-value"><%= pbean.getP_name() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Company:</span>
                <span class="info-value"><%= pbean.getP_comp() %></span>
            </div>
        </div>

        <div class="update-body">
            <form action="update" method="post">
                <div class="form-group">
                    <label for="pPrice">Update Price (₹)</label>
                    <i class="fas fa-rupee-sign"></i>
                    <input type="number" step="0.01" id="pPrice" name="pPrice" 
                           value="<%= pbean.getP_price() %>" required placeholder="Enter new price">
                </div>

                <div class="form-group">
                    <label for="pQty">Update Quantity</label>
                    <i class="fas fa-cubes"></i>
                    <input type="number" id="pQty" name="pQty" 
                           value="<%= pbean.getP_qty() %>" required min="0" placeholder="Enter new quantity">
                </div>

                <input type="hidden" name="pCode" value="<%= pbean.getP_code() %>">

                <button type="submit" class="btn-update">
                    <i class="fas fa-save"></i> Update Product Details
                </button>
            </form>

            <div class="back-link">
                <a href="view1">
                    <i class="fas fa-arrow-left"></i> Back to Product List
                </a>
            </div>
        </div>
    </div>

</body>
</html>