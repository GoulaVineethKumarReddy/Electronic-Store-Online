package com.pack1;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/view1")
public class ViewProductServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("ViewProductServlet.doGet()");
		HttpSession session = req.getSession();
		AdminBean abean = (AdminBean) session.getAttribute("abean");
		
		if(abean==null)
		{
			req.setAttribute("msg", "login again");
		}
		else
		{
//			res.sendRedirect("https://www.google.com/");
			
			ViewProductDAO viewProductDAO = new ViewProductDAO();
			List<ProductBean> list = viewProductDAO.getAvailableProducts();
			session.setAttribute("productlist", list);
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
		}
		
		
	}
}
