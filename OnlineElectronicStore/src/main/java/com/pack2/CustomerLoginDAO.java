package com.pack2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pack1.DBconnect;

public class CustomerLoginDAO 
{
	public CustomerBean getCustomerDetails(String customerName, String customerPassword)
	{
		System.out.println("CustomerLoginDAO.getCustomerDetails()");
		CustomerBean cbean = null;
		
		try
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("select * from customer where uname=? and pword=?");
			pstmt.setString(1, customerName);
			pstmt.setString(2, customerPassword);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				cbean = new CustomerBean();
				cbean.setCustomerName(rs.getString(1));
				cbean.setCustomerPassword(rs.getString(2));
				cbean.setCustomerFirstName(rs.getString(3));
				cbean.setCustomerLastName(rs.getString(4));
				cbean.setCustomerAddress(rs.getString(5));
				cbean.setCustomerMailId(rs.getString(6));
				cbean.setCustomerMobile(rs.getString(7));
				System.out.println("Retrieved the customer details from database");
			}
			else
			{
				cbean = null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return cbean;
	}

}
