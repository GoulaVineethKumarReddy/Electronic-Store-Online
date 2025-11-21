package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class DeleteProductServlet extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("DeleteProductServlet.doGet()");
		
		HttpSession session = req.getSession(false);
		
		if(session==null)
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		else
		{
			String pCode = req.getParameter("pcode");
			DeleteProductDAO deleteProductDAO = new DeleteProductDAO();
			int rowCount = deleteProductDAO.deleteProduct(pCode);
			
			if(rowCount>0)
			{
				req.setAttribute("msg", "Product Deleted!!!");
				req.getRequestDispatcher("DeleteProduct.jsp").forward(req, res);
			}
			else
			{
				req.setAttribute("msg", "Product NOT Deleted!!!");
				req.getRequestDispatcher("DeleteProduct.jsp").forward(req, res);
			}
		}
	}

}
