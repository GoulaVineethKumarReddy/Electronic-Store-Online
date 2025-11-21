<%@page import="com.pack1.AdminBean"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products - ElectroStore Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }

        .header h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
            text-shadow: 0 4px 20px rgba(0,0,0,0.4);
        }

        .header p {
            font-size: 1.5rem;
            opacity: 0.95;
        }

        .search-container {
            max-width: 600px;
            margin: 25px auto;
            position: relative;
        }

        #searchInput {
            width: 100%;
            padding: 18px 65px 18px 25px;
            font-size: 1.2rem;
            border: none;
            border-radius: 50px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.25);
            outline: none;
            background: white;
        }

        .search-container i {
            position: absolute;
            right: 25px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.5rem;
            color: #667eea;
        }

        .table-container {
            max-width: 1400px;
            margin: 30px auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 1.1rem;
        }

        td {
            padding: 18px 15px;
            border-bottom: 1px solid #eee;
            transition: all 0.3s ease;
        }

        tr:hover {
            background: #f8f9ff;
            transform: scale(1.01);
            box-shadow: 0 8px 25px rgba(102,126,234,0.1);
        }

        .code { font-weight: 700; color: #333; }
        .name { font-weight: 600; color: #222; font-size: 1.1rem; }
        .company { color: #667eea; font-weight: 500; }
        .price { font-size: 1.4rem; font-weight: 800; color: #e91e63; }
        .qty { font-weight: 600; }

        .stock-high { color: #43e97b; }
        .stock-low { color: #ffa726; }
        .stock-out { color: #ff6b6b; }

        .action-btn {
            padding: 10px 16px;
            margin: 0 6px;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            font-size: 0.95rem;
        }

        .btn-edit {
            background: #4facfe;
            color: white;
        }

        .btn-delete {
            background: #ff6b6b;
            color: white;
        }

        .action-btn:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .btn-add-product {
            display: block;
            width: 280px;
            margin: 40px auto;
            padding: 18px;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            text-align: center;
            font-size: 1.4rem;
            font-weight: 700;
            border-radius: 50px;
            text-decoration: none;
            box-shadow: 0 15px 35px rgba(79,172,254,0.4);
            transition: all 0.4s ease;
        }

        .btn-add-product:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 50px rgba(79,172,254,0.5);
        }

        .logout-container {
            text-align: center;
            margin: 50px 0;
        }

        .logout-btn {
            padding: 16px 40px;
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: white;
            font-size: 1.3rem;
            font-weight: 600;
            border-radius: 50px;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 12px 30px rgba(250,112,154,0.4);
            transition: all 0.4s ease;
        }

        .logout-btn:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 40px rgba(250,112,154,0.5);
        }

        .no-products {
            text-align: center;
            padding: 80px 20px;
            color: white;
            font-size: 2rem;
        }

        @media (max-width: 992px) {
            table { font-size: 0.95rem; }
            th, td { padding: 12px 10px; }
            .header h1 { font-size: 2.4rem; }
        }

        @media (max-width: 768px) {
            .header h1 { font-size: 2rem; }
            table { display: block; overflow-x: auto; white-space: nowrap; }
        }
    </style>
</head>
<body>

<%
    AdminBean abean = (AdminBean) session.getAttribute("abean");
    if (abean == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }

    @SuppressWarnings("unchecked")
    List<ProductBean> list = (List<ProductBean>) session.getAttribute("productlist");
    if (list == null || list.isEmpty()) {
%>
        <div class="no-products">
            <h1>No products found in inventory</h1>
            <p><a href="AddProduct.html" style="color:#4facfe; text-decoration:underline;">Add your first product now!</a></p>
        </div>
<%
        return;
    }
%>

<div class="header">
    <h1>Hello, <%= abean.getA_fname() %>!</h1>
    <p>Manage your product inventory</p>
</div>

<div class="search-container">
    <input type="text" id="searchInput" placeholder="Search by product name or code..." onkeyup="searchTable()">
    <i class="fas fa-search"></i>
</div>

<div class="table-container">
    <table id="productTable">
        <thead>
            <tr>
                <th>Code</th>
                <th>Product Name</th>
                <th>Company</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (ProductBean pbean : list) {
                    String stockClass = "stock-high";
                    if (Integer.parseInt(pbean.getP_qty()) == 0) stockClass = "stock-out";
                    else if (Integer.parseInt(pbean.getP_qty()) <= 5) stockClass = "stock-low";
            %>
            <tr>
                <td class="code"><%= pbean.getP_code() %></td>
                <td class="name"><%= pbean.getP_name() %></td>
                <td class="company"><%= pbean.getP_comp() %></td>
                <td class="price">₹<%= pbean.getP_price() %></td>
                <td class="qty <%= stockClass %>">
                    <%= pbean.getP_qty() %> <%= Integer.parseInt(pbean.getP_qty()) == 1 ? "unit" : "units" %>
                    <%= Integer.parseInt(pbean.getP_qty()) == 0 ? "(Out of stock)" : Integer.parseInt(pbean.getP_qty()) <= 5 ? "(Low stock!)" : "" %>
                </td>
                <td>
                    <a href="edit?pcode=<%= pbean.getP_code() %>" class="action-btn btn-edit">
                        Edit
                    </a>
                    <a href="delete?pcode=<%= pbean.getP_code() %>" class="action-btn btn-delete"
                       onclick="return confirm('Are you sure you want to delete <%= pbean.getP_name() %>?')">
                        Delete
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<a href="AddProduct.html" class="btn-add-product">
    Add New Product
</a>

<div class="logout-container">
    <a href="logout" class="logout-btn">
        Logout
    </a>
</div>

<script>
    function searchTable() {
        let input = document.getElementById("searchInput").value.toLowerCase();
        let tr = document.getElementById("productTable").getElementsByTagName("tr");

        for (let i = 1; i < tr.length; i++) {
            let rowText = tr[i].textContent.toLowerCase();
            tr[i].style.display = rowText.includes(input) ? "" : "none";
        }
    }
</script>

</body>
</html>