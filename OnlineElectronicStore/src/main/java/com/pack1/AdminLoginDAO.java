package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO 
{
	public AdminBean checkAdminBean(String aname,String apwd)
	{
		System.out.println("AdminLoginDAO.checkAdminBean()");
		AdminBean abean = null;
		
		try 
		{
			Connection con = DBconnect.getCon();
			PreparedStatement pstmt = con.prepareStatement("select * from admin where uname=? and pword=?");
			pstmt.setString(1, aname);
			pstmt.setString(2, apwd);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("Query executed");
			if(rs.next())
			{
				abean = new AdminBean();
				abean.setA_name(rs.getString(1));
				abean.setA_pwd(rs.getString(2));
				abean.setA_fname(rs.getString(3));
				abean.setA_lname(rs.getString(4));
				abean.setA_addr(rs.getString(5));
				abean.setA_mid(rs.getString(6));
				abean.setA_phno(rs.getString(7));
				System.out.println(abean.getA_name()+" "+abean.getA_pwd()
									+" "+abean.getA_fname()+" "+abean.getA_lname()
									+" "+abean.getA_mid()+" "+abean.getA_addr()+" "+abean.getA_phno());
			}
			else 
			{
				System.out.println("wrong username or password");
				
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return abean;
	}

}
