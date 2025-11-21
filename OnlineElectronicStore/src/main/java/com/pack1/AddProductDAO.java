package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddProductDAO 
{
	public int insertProductDetails(ProductBean pbean) throws Exception
	{
		System.out.println("AddProductDAO.insertProductDetails()");
		int rowCount = 0;
		
		try
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("insert into product values(?,?,?,?,?)");
			pstmt.setString(1, pbean.getP_code());
			pstmt.setString(2, pbean.getP_name());
			pstmt.setString(3, pbean.getP_comp());
			pstmt.setString(4, pbean.getP_price());
			pstmt.setString(5, pbean.getP_qty());
			rowCount = pstmt.executeUpdate();
			System.out.println("Product info inserted into database");
		}
		catch(Exception e)
		{
//			e.printStackTrace();
			throw e;
		}
		
		return rowCount;
	}

}
