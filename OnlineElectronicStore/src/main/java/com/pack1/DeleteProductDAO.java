package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteProductDAO 
{
	public int deleteProduct(String pcode)
	{
		System.out.println("DeleteProductDAO.deleteProduct()");
		int rowCount = 0;
		
		try
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("delete product where pcode=?");
			pstmt.setString(1, pcode);
			rowCount = pstmt.executeUpdate();
			System.out.println("Deleted the recor of that product");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return rowCount;
	}

}
