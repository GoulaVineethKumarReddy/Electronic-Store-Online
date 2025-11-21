<%@page import="com.pack2.CustomerBean"%>
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
		Integer productsPrice = (int)request.getAttribute("productsPrice");
		CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");
		String customerName = cbean.getCustomerFirstName();
		
	%>
	<center>
		<h1>
			Hello <%= customerName %>
			<br><br><hr>
			
			You have charged <%= productsPrice %> rs
			<br><br>
			Your order has been placed Successfully !!!
			<br><br>
			
			<h2>
			<a href="view2">View Product</a><br><br>
			<a href="logout">Logout</a><br><br> 
			</h2>
		</h1>
		
		
</body>
</html>