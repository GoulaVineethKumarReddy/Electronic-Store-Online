package com.pack2;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.pack1.DBconnect;

public class CustomerRegisterDAO 
{
	public int registerCustomer(CustomerBean cbean)
	{
		System.out.println("CustomerRegisterDAO.registerCustomer()");
		int rowCount = 0;
		
		try
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
			pstmt.setString(1, cbean.getCustomerName());
			pstmt.setString(2, cbean.getCustomerPassword());
			pstmt.setString(3, cbean.getCustomerFirstName());
			pstmt.setString(4, cbean.getCustomerLastName());
			pstmt.setString(5, cbean.getCustomerAddress());
			pstmt.setString(6, cbean.getCustomerMailId());
			pstmt.setString(7, cbean.getCustomerMobile());
			rowCount = pstmt.executeUpdate();
			System.out.println("Customer data registered into database");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return rowCount;
	}

}
