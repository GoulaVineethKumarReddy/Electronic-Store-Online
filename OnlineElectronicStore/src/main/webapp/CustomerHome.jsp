<%@page import="com.pack2.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
</head>
<body><center>
	<h1>
		<%
			CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");
			out.println("Welcome : "+cbean.getCustomerFirstName());
		%>
	</h1>
		
	<a href="view2">View Product</a><br><br>
	<a href="logout">Logout</a><br><br>

</body>
</html>