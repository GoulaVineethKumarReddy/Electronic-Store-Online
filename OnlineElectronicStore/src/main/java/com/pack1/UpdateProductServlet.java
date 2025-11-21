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
@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("UpdateProductServlet.doPost()");
		HttpSession session = req.getSession(false);
		
		if(session==null)
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		else
		{
			String pcode = req.getParameter("pCode");
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
			pb.setP_price(req.getParameter("pPrice"));
			pb.setP_qty(req.getParameter("pQty"));
			
			UpdateProductDAO updateObj = new UpdateProductDAO();
			int rowCount = updateObj.updateDetails(pb);
			
			if(rowCount>0)
			{
				req.setAttribute("msg", "Product data Updated");
				req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
			}
			else
			{
				req.setAttribute("msg", "Product data NOT Updated");
				req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
			}
			
			
		}
	}
}
