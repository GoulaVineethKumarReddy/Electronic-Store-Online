package com.pack2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pack1.DBconnect;
import com.pack1.ProductBean;

public class BuyProductServletDAO 
{

	public ProductBean getProductDetails(String pcode) 
	{
		System.out.println("BuyProductServletDAO.getProductDetails()");
		ProductBean pbean = null;
		
		try 
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("select * from product where pcode=?");
			pstmt.setString(1, pcode);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("returned the products from database");
			
			if(rs.next())
			{
				pbean = new ProductBean();
				
				pbean.setP_code(rs.getString(1));
				pbean.setP_name(rs.getString(2));
				pbean.setP_comp(rs.getString(3));
				pbean.setP_price(rs.getString(4));
				pbean.setP_qty(rs.getString(5));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return pbean;
	}
	

}
