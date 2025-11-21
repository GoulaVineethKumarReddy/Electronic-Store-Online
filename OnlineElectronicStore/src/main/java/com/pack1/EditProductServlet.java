package com.pack1;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/edit")
public class EditProductServlet extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("EditProductServlet.doGet()");
		HttpSession session = req.getSession(false);
//		AdminBean abean = (AdminBean)session.getAttribute("abean");
		
		if(session==null) 
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		else
		{
			String pcode = req.getParameter("pcode");
			List<ProductBean> list = (List<ProductBean>) session.getAttribute("productlist");
			ProductBean pb = null;
			Iterator<ProductBean> i = list.iterator();
			
			while(i.hasNext())
			{
				pb=i.next();
				if(pcode.equals(pb.getP_code()))
				{
					break;
				}
			}
			req.setAttribute("pbean", pb);
			req.getRequestDispatcher("EditProduct.jsp").forward(req, res);
		}
		
		
	}

}
