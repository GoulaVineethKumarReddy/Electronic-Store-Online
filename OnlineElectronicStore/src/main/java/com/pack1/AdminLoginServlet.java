package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/alog")
public class AdminLoginServlet extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("AdminLoginServlet.doPost()");
		String userName = (String) req.getParameter("aname");
		String password = (String) req.getParameter("apwd");
		
		System.out.println("\nAdmin user Name ====> "+userName);
		System.out.println("Admin password ====> "+password+"\n");
		
		AdminLoginDAO adminLoginDAO = new AdminLoginDAO();
		AdminBean abean = adminLoginDAO.checkAdminBean(userName, password);
		
		if(abean==null)
		{
			req.setAttribute("msg", "Inavalid Admin Credentials");
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
			
		}
		else
		{
			HttpSession session = req.getSession();
			session.setAttribute("abean", abean);
			req.getRequestDispatcher("AdminHome.jsp").forward(req, res);
		}
		
	}

}
