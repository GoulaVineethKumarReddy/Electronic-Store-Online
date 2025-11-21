package com.pack2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/clog")
public class CustomerLoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("CustomerLoginServlet.doPost()");
		String customerName = req.getParameter("cname");
		String customerPasssword = req.getParameter("cpwd");
		
		
		CustomerLoginDAO customerLoginDAO = new CustomerLoginDAO();

		CustomerBean cBean = customerLoginDAO.getCustomerDetails(customerName, customerPasssword);
		
		if(cBean==null)
		{
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		}
		else
		{
			HttpSession session = req.getSession();
			session.setAttribute("cbean", cBean);
			req.getRequestDispatcher("CustomerHome.jsp").forward(req, res);
		}
		
	}

}
