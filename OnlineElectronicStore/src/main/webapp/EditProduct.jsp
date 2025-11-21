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
		AdminBean abean = (AdminBean) session.getAttribute("abean");
		ProductBean pbean = (ProductBean) request.getAttribute("pbean");
	
		out.println("<h1><i><u>");
		
		out.println("Hello "+abean.getA_fname()+" please edit");
		out.println("</u></i></h1>");
		out.println("<br><br><hr>");
		
		
		
		//out.println("<h2>");
		//out.println("Product Price :: <input type='text' placeholder='"+pbean.getP_price()+"' name='' >");
		//out.println("Product Quantity :: <input type='text' placeholder='"+pbean.getP_qty()+"' name='' >");
		//out.println("</h2>");
		
	%>
	
	<h2>
		<form action="update" method="post">
			Product Price :: <input type="text" value="<%= pbean.getP_price() %>" name="pPrice"><br><br>
			Product Quantity :: <input type="text" value="<%= pbean.getP_qty() %>" name="pQty"><br><br>
			<input type="hidden" name="pCode" value="<%= pbean.getP_code()%>">
			<input type="submit" value="Update Details">
		</form>
	</h2>
</body>
</html>