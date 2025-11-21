<%@page import="com.pack2.CustomerBean"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Products - ElectroStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px 15px;
        }

        .header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }

        .header h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
            text-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .header p {
            font-size: 1.4rem;
            opacity: 0.95;
        }

        /* Search Bar */
        .search-container {
            max-width: 600px;
            margin: 20px auto;
            position: relative;
        }

        #searchInput {
            width: 100%;
            padding: 16px 60px 16px 20px;
            font-size: 1.1rem;
            border: none;
            border-radius: 50px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            outline: none;
        }

        .search-container i {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.4rem;
            color: #667eea;
        }

        /* Product Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            max-width: 1300px;
            margin: 40px auto;
            padding: 0 15px;
        }

        .product-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
            transition: all 0.4s ease;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 25px 50px rgba(0,0,0,0.3);
        }

        .product-image {
            height: 200px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 4rem;
        }

        .product-info {
            padding: 25px;
        }

        .product-code {
            font-size: 0.9rem;
            color: #888;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .product-name {
            font-size: 1.5rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }

        .product-company {
            color: #667eea;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .price-stock {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .price {
            font-size: 1.8rem;
            font-weight: 800;
            color: #e91e63;
        }

        .stock {
            font-size: 1rem;
            color: #43e97b;
            font-weight: 600;
        }

        .stock.low { color: #ffa726; }
        .stock.out { color: #ff6b6b; }

        .buy-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.2rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .buy-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(245, 87, 108, 0.4);
        }

        .buy-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        .logout-link {
            text-align: center;
            margin: 50px 0;
        }

        .logout-link a {
            color: white;
            font-size: 1.3rem;
            font-weight: 600;
            text-decoration: none;
            padding: 14px 40px;
            background: rgba(255,255,255,0.2);
            border-radius: 50px;
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .logout-link a:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-5px);
        }

        .no-products {
            text-align: center;
            color: white;
            font-size: 1.8rem;
            margin: 80px 0;
        }

        @media (max-width: 768px) {
            .header h1 { font-size: 2.4rem; }
            .products-grid { grid-template-columns: 1fr; }
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

    @SuppressWarnings("unchecked")
    List<ProductBean> list = (List<ProductBean>) session.getAttribute("customerproductlist");
    if (list == null || list.isEmpty()) {
%>
        <div class="no-products">
            <h1>No products available at the moment.</h1>
            <p>Please check back later!</p>
        </div>
<%
        return;
    }
%>

<div class="header">
    <h1>Welcome back, <%= cbean.getCustomerFirstName() %>!</h1>
    <p>Explore our latest electronics collection</p>
</div>

<div class="search-container">
    <input type="text" id="searchInput" placeholder="Search products by name or code..." onkeyup="searchProducts()">
    <i class="fas fa-search"></i>
</div>

<div class="products-grid" id="productsGrid">
    <%
        for (ProductBean pbean : list) {
            String stockClass = "";
            String stockText = pbean.getP_qty() + " in stock";
            boolean inStock = Integer.parseInt(pbean.getP_qty()) > 0;

            if (Integer.parseInt(pbean.getP_qty()) == 0) {
                stockClass = "out";
                stockText = "Out of Stock";
            } else if (Integer.parseInt(pbean.getP_qty()) <= 5) {
                stockClass = "low";
                stockText = "Only " + pbean.getP_qty() + " left!";
            }
    %>
        <div class="product-card">
            <div class="product-image">
                <i class="fas fa-laptop"></i>
            </div>
            <div class="product-info">
                <div class="product-code">Code: <%= pbean.getP_code() %></div>
                <div class="product-name"><%= pbean.getP_name() %></div>
                <div class="product-company"><%= pbean.getP_comp() %></div>

                <div class="price-stock">
                    <div class="price">₹<%= pbean.getP_price() %></div>
                    <div class="stock <%= stockClass %>"><%= stockText %></div>
                </div>

                <a href="buy?pcode=<%= pbean.getP_code() %>" 
                   class="buy-btn" 
                   <%= !inStock ? "style='opacity:0.6; pointer-events:none;' onclick='return false;'" : "" %>>
                    <i class="fas fa-cart-plus"></i>
                    <%= inStock ? "Buy Now" : "Out of Stock" %>
                </a>
            </div>
        </div>
    <%
        }
    %>
</div>

<div class="logout-link">
    <a href="logout">
        <i class="fas fa-sign-out-alt"></i> Logout
    </a>
</div>

<script>
    function searchProducts() {
        let input = document.getElementById('searchInput').value.toLowerCase();
        let cards = document.getElementsByClassName('product-card');

        for (let i = 0; i < cards.length; i++) {
            let name = cards[i].querySelector('.product-name').textContent.toLowerCase();
            let code = cards[i].querySelector('.product-code').textContent.toLowerCase();
            if (name.includes(input) || code.includes(input)) {
                cards[i].style.display = "";
            } else {
                cards[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>