<%@page import="com.pack1.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - ElectroStore</title>
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

        .product-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.35);
            width: 100%;
            max-width: 600px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .product-header {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            padding: 40px 30px;
            text-align: center;
            color: white;
        }

        .product-header i {
            font-size: 4rem;
            margin-bottom: 15px;
            text-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .product-header h1 {
            font-size: 2.4rem;
            font-weight: 700;
        }

        .product-header p {
            opacity: 0.9;
            margin-top: 8px;
            font-size: 1.1rem;
        }

        .product-body {
            padding: 40px 45px;
        }

        .detail-row {
            display: flex;
            align-items: center;
            padding: 16px 0;
            border-bottom: 1px solid #eee;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-row i {
            font-size: 1.5rem;
            color: #f5576c;
            width: 50px;
            text-align: center;
        }

        .detail-label {
            font-weight: 600;
            color: #333;
            width: 180px;
            flex-shrink: 0;
        }

        .detail-value {
            background: #f8f9fa;
            padding: 12px 16px;
            border-radius: 10px;
            border: 2px solid #e0e0e0;
            flex: 1;
            font-weight: 500;
            color: #222;
        }

        .price-highlight {
            font-size: 1.4rem;
            font-weight: 700;
            color: #e91e63;
            background: #ffebee !important;
            border-color: #f8bbd0 !important;
        }

        .buy-section {
            margin-top: 35px;
            padding: 30px;
            background: linear-gradient(135deg, #f9f9f9 0%, #f1f3f8 100%);
            border-radius: 15px;
            text-align: center;
        }

        .buy-section h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.6rem;
        }

        .qty-input {
            width: 100%;
            max-width: 200px;
            padding: 14px 16px;
            font-size: 1.2rem;
            text-align: center;
            border: 2px solid #ddd;
            border-radius: 12px;
            margin: 15px auto;
            display: block;
        }

        .btn-buy {
            padding: 16px 40px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 1.3rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 25px rgba(245, 87, 108, 0.4);
        }

        .btn-buy:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(245, 87, 108, 0.5);
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            color: #f5576c;
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .detail-row {
                flex-direction: column;
                text-align: center;
            }
            .detail-label, .detail-value {
                width: 100%;
            }
            .detail-label {
                margin-bottom: 8px;
            }
            .product-body {
                padding: 30px 25px;
            }
        }
    </style>
</head>
<body>

<%
    ProductBean pb = (ProductBean) request.getAttribute("pbean");
    if (pb == null) {
        out.println("<h2 style='color:red; text-align:center;'>Product not found!</h2>");
        return;
    }
%>

    <div class="product-container">
        <div class="product-header">
            <i class="fas fa-shopping-bag"></i>
            <h1>Product Details</h1>
            <p>Review and place your order</p>
        </div>

        <div class="product-body">
            <div class="detail-row">
                <i class="fas fa-barcode"></i>
                <span class="detail-label">Product Code</span>
                <div class="detail-value"><%= pb.getP_code() %></div>
            </div>

            <div class="detail-row">
                <i class="fas fa-tag"></i>
                <span class="detail-label">Product Name</span>
                <div class="detail-value"><%= pb.getP_name() %></div>
            </div>

            <div class="detail-row">
                <i class="fas fa-building"></i>
                <span class="detail-label">Company</span>
                <div class="detail-value"><%= pb.getP_comp() %></div>
            </div>

            <div class="detail-row">
                <i class="fas fa-rupee-sign"></i>
                <span class="detail-label">Price</span>
                <div class="detail-value price-highlight">₹<%= pb.getP_price() %></div>
            </div>

            <div class="detail-row">
                <i class="fas fa-cubes"></i>
                <span class="detail-label">Available Qty</span>
                <div class="detail-value"><%= pb.getP_qty() %> units</div>
            </div>

            <div class="buy-section">
                <h2>Place Your Order</h2>
                <form action="updateProductServlet" method="post">
                    <input type="number" name="requiredQty" class="qty-input" 
                           min="1" max="<%= pb.getP_qty() %>" placeholder="Quantity" required>
                    <input type="hidden" name="pcode" value="<%= pb.getP_code() %>">
                    <button type="submit" class="btn-buy">
                        <i class="fas fa-cart-plus"></i> Buy Now
                    </button>
                </form>
            </div>

            <div class="back-link">
                <a href="view2">
                    <i class="fas fa-arrow-left"></i> Back to Products
                </a>
            </div>
        </div>
    </div>

</body>
</html>