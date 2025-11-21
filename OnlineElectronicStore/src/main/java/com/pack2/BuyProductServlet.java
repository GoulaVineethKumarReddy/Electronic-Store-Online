package com.pack2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.ProductBean;

@SuppressWarnings("serial")
@WebServlet("/buy")
public class BuyProductServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("BuyProductServlet.doGet()");
		HttpSession session = req.getSession(false);
		
		if(session==null)
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		else
		{
			String pcode = req.getParameter("pcode");
			BuyProductServletDAO buyProductServletDAO = new BuyProductServletDAO();
			ProductBean pb = buyProductServletDAO.getProductDetails(pcode);
			req.setAttribute("pbean", pb);
			req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
		}
	}
}
