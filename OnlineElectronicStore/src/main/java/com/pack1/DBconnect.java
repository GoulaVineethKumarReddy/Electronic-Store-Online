package com.pack1;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect 
{
	
	public static Connection getCon()
	{
		System.out.println("DBconnect.getCon()");
		Connection con = null;
		try
		{
			Class.forName(DBinfo.driver);
			con = DriverManager.getConnection(DBinfo.dbUrl,DBinfo.dbUser,DBinfo.dbPwd);
			System.out.println("Connection created");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

}
