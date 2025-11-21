package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/aps")
public class AddProductServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		try
		{
			System.out.println("AddProductServlet.doPost()");
			HttpSession session = req.getSession();
			
			if(session == null) 
			{
				req.getRequestDispatcher("AdminLogin.html").forward(req, res);
			}
			else
			{
				ProductBean pbean = new ProductBean();
				
				pbean.setP_code(req.getParameter("pcode"));
				pbean.setP_name(req.getParameter("pname"));
				pbean.setP_comp(req.getParameter("pcomp"));
				pbean.setP_price(req.getParameter("pprice"));
				pbean.setP_qty(req.getParameter("pqty"));
				
				AddProductDAO addProductDAO = new AddProductDAO();
				
				int rowCount = addProductDAO.insertProductDetails(pbean);
				
//				if(rowCount==0)
//				{
//					req.setAttribute("msg","Product details not added");
//					req.getRequestDispatcher("AdminLogin.html").forward(req, res);
//				}
				if(rowCount>0)
				{
					req.setAttribute("msg","Product details added sucessfully");
					req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
				}
			}
		}
		catch(Exception e)
		{
			req.setAttribute("msg", "Duplicate Product Id's are NOT allowed");
			req.getRequestDispatcher("Error.jsp").forward(req, res);
		}
	}
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse res)
////			throws ServletException,IOException,Exception
//			throws Exception
//	{
//		System.out.println("AddProductServlet.doPost()");
//		HttpSession session = req.getSession();
//		
//		if(session == null) 
//		{
//			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
//		}
//		else
//		{
//			ProductBean pbean = new ProductBean();
//			
//			pbean.setP_code(req.getParameter("pcode"));
//			pbean.setP_name(req.getParameter("pname"));
//			pbean.setP_comp(req.getParameter("pcomp"));
//			pbean.setP_price(req.getParameter("pprice"));
//			pbean.setP_qty(req.getParameter("pqty"));
//			
//			AddProductDAO addProductDAO = new AddProductDAO();
//			
//			int rowCount = addProductDAO.insertProductDetails(pbean);
//			
////			if(rowCount==0)
////			{
////				req.setAttribute("msg","Product details not added");
////				req.getRequestDispatcher("AdminLogin.html").forward(req, res);
////			}
//			if(rowCount>0)
//			{
//				req.setAttribute("msg","Product details added sucessfully");
//				req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
//			}
//			
//		}
		
}
