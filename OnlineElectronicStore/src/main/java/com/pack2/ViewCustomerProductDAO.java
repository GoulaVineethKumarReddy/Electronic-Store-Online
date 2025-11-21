package com.pack2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pack1.DBconnect;
import com.pack1.ProductBean;

public class ViewCustomerProductDAO 
{
	
	public List<ProductBean> getAvailableProducts()
	{
		System.out.println("ViewCustomerProductDAO.getAvailableProducts()");
		List<ProductBean> list = new ArrayList<>();
		
		try 
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("select * from product");
			ResultSet rs = pstmt.executeQuery();
			System.out.println("returned all products from database");
			
			while(rs.next())
			{
				ProductBean pbean = new ProductBean();
				
				pbean.setP_code(rs.getString(1));
				pbean.setP_name(rs.getString(2));
				pbean.setP_comp(rs.getString(3));
				pbean.setP_price(rs.getString(4));
				pbean.setP_qty(rs.getString(5));
				
				list.add(pbean);
				
				System.out.println("one product added to list");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list;
	}

}
