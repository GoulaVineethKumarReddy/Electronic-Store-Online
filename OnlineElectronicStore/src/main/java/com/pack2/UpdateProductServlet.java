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
@WebServlet("/updateProductServlet")
public class UpdateProductServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		System.out.println("UpdateProductServlet.doPost()");
		HttpSession session = req.getSession(false);
		
		if(session==null)
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		else
		{
			String pcode = req.getParameter("pcode");
			System.out.println("Pcode ="+pcode);
			UpdateProductServletDAO updateProductServletDAO = new UpdateProductServletDAO();
			ProductBean pbean = updateProductServletDAO.getupdateProductDetails(pcode);
			Integer availableQty = Integer.parseInt(pbean.getP_qty());
			int productPrice = Integer.parseInt(pbean.getP_price());
			Integer requiredQty = Integer.parseInt(req.getParameter("requiredQty"));
			int newQty = availableQty-requiredQty;
			
			if(newQty>=0)
			{
				int rowCount = updateProductServletDAO.updateProductDetails(pcode,newQty);
				
				if(rowCount>0)
				{
					//updating the product details in arrayList
//					new ViewCustomerProductDAO().getAvailableProducts();
					int productsPrice = requiredQty*productPrice;
					req.setAttribute("productsPrice", (productsPrice));
					req.getRequestDispatcher("OrderConfirmed.jsp").forward(req, res);
				}
				
			}else 
			{
				System.out.println("Enter correct eligible required product quantity");
			}
			
		}
		
	}

}
