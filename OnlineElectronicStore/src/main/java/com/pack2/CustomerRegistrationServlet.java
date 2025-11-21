package com.pack2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/crs")
public class CustomerRegistrationServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("CustomerRegistrationServlet.doPost()");
		CustomerBean cbean = new CustomerBean();
		cbean.setCustomerName(req.getParameter("cName"));
		cbean.setCustomerPassword(req.getParameter("cPwd"));
		cbean.setCustomerFirstName(req.getParameter("cFname"));
		cbean.setCustomerLastName(req.getParameter("cLname"));
		cbean.setCustomerAddress(req.getParameter("cAddr"));
		cbean.setCustomerMailId(req.getParameter("cMail"));
		cbean.setCustomerMobile(req.getParameter("cMobile"));
		
		CustomerRegisterDAO customerRegisterDAO = new CustomerRegisterDAO();
		int rowCount = customerRegisterDAO.registerCustomer(cbean);
		
		if(rowCount==0)
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		else
		{
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		}
	}

}
