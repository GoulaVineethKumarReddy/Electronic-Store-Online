<%@page import="com.pack1.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ProductBean pb = (ProductBean) request.getAttribute("pbean");
		
	%>
	<center>
		<h1>Details of the products to buy</h1>
		<hr>
		<h3>
			Product Code :: <input type="text" value="<%= pb.getP_code() %>" readonly><br><br>
			Product Name :: <input type="text" value="<%= pb.getP_name() %>" readonly><br><br>
			Product Company :: <input type="text" value="<%= pb.getP_comp() %>" readonly><br><br>
			Product Price :: <input type="text" value="<%= pb.getP_price() %>" readonly><br><br>
			Product Quantity :: <input type="text" value="<%= pb.getP_qty() %>" readonly><br><br>
		</h3>
		<h2>
			<hr>
			<form action="updateProductServlet" method="post">
				Number of products required :: <input type="number" name="requiredQty"><br><br>
				<input type="hidden" value="<%= pb.getP_code() %>" name="pcode"> 
				<input type="submit" value="Buy"><br><br>
			</form>
			
		</h2>
	
</body>
</html>