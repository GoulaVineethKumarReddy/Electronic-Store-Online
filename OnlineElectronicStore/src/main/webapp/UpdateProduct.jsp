<%@ page import="com.pack1.AdminBean" %>
<%@ page import="com.pack1.ProductBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>

	<%
	out.println("<h1><i><u>");
	
	AdminBean abean = (AdminBean) session.getAttribute("abean");
	out.println("Hello "+abean.getA_fname());
	
	out.println("</u></i></h1>");
	
	out.println("<br><br>");	
	
	String data = (String) request.getAttribute("msg");
	
	out.println("<h2>"+data+"</h2>");
	
	out.println("<br><br><hr>");	
	%>
	
	<a href="AddProduct.html">Add Product</a><br><br>
	<a href="view1">View Product</a><br><br>
	<a href="logout">Logout</a><br><br>

</body>
</html>