package com.pack2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack1.ProductBean;

@SuppressWarnings("serial")
@WebServlet("/view2")
public class ViewCustomerProductsServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("ViewCustomerProductsServlet.doGet()");
		HttpSession session = req.getSession();
		CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");
		
		if(cbean==null)
		{
			req.setAttribute("msg", "login again");
		}
		else
		{
			ViewCustomerProductDAO viewCustomerProductDAO = new ViewCustomerProductDAO();
			List<ProductBean> list = viewCustomerProductDAO.getAvailableProducts();
			session.setAttribute("customerproductlist", list);
			req.getRequestDispatcher("ViewCustomerProduct.jsp").forward(req, res);
		}
		
	}
}
