<%@page import="com.pack1.AdminBean"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
				out.println("Hello "+abean.getA_fname()+" these are your product details");
				
				out.println("</u></i></h1>");
				
				out.println("<br><br><hr>");
				
				List<ProductBean> list = (List<ProductBean>) session.getAttribute("productlist");
				
				Iterator<ProductBean> i = list.iterator();
				
				out.println("<h2>");
				
				while(i.hasNext())
				{
					ProductBean pbean = i.next(); 
					out.println(pbean.getP_code()+" "+pbean.getP_name()+" "+
								pbean.getP_comp()+" "+pbean.getP_price()+" "+
								pbean.getP_qty()+
								" <a href='edit?pcode="+pbean.getP_code()+"'>Edit</a>"+
								" <a href='delete?pcode="+pbean.getP_code()+"'>Delete</a>"+
								"<br><br>");
				}
				
				out.println("</h2>");
				
				out.println("<h1>");
				
				out.println("<a href='logout'>Logout</a>");
				
				out.println("</h1>");
				
				
			%>		

</body>
</html>