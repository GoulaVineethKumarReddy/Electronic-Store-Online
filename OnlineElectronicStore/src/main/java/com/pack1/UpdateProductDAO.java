package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateProductDAO 
{
	public int updateDetails(ProductBean pb)
	{
		System.out.println("UpdateProductDAO.updateDetails()");
		int rowcount = 0;
		try 
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("update product set pprice=?,pqty=? where pcode=?");
			pstmt.setString(1,pb.getP_price());
			pstmt.setString(2,pb.getP_qty());
			pstmt.setString(3,pb.getP_code());
			rowcount=pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return rowcount;
	}

}
