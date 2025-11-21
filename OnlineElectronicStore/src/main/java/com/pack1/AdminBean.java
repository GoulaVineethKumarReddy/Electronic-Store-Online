package com.pack1;

import java.io.Serializable;

@SuppressWarnings("serial")
public class AdminBean implements Serializable
{
	private String a_name,a_pwd,a_fname,a_lname,a_addr,a_mid,a_phno;

	public AdminBean() {
		System.out.println("AdminBean.AdminBean()");
	}
	
	public String getA_name() {
		System.out.println("AdminBean.getA_name()");
		return a_name;
	}

	public void setA_name(String a_name) {
		System.out.println("AdminBean.setA_name()");
		this.a_name = a_name;
	}

	public String getA_pwd() {
		System.out.println("AdminBean.getA_pwd()");
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		System.out.println("AdminBean.setA_pwd()");
		this.a_pwd = a_pwd;
	}

	public String getA_fname() {
		System.out.println("AdminBean.getA_fname()");
		return a_fname;
	}

	public void setA_fname(String a_fname) {
		System.out.println("AdminBean.setA_fname()");
		this.a_fname = a_fname;
	}

	public String getA_lname() {
		System.out.println("AdminBean.getA_lname()");
		return a_lname;
	}

	public void setA_lname(String a_lname) {
		System.out.println("AdminBean.setA_lname()");
		this.a_lname = a_lname;
	}

	public String getA_addr() {
		System.out.println("AdminBean.getA_addr()");
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		System.out.println("AdminBean.setA_addr()");
		this.a_addr = a_addr;
	}

	public String getA_mid() {
		System.out.println("AdminBean.getA_mid()");
		return a_mid;
	}

	public void setA_mid(String a_mid) {
		System.out.println("AdminBean.setA_mid()");
		this.a_mid = a_mid;
	}

	public String getA_phno() {
		System.out.println("AdminBean.getA_phno()");
		return a_phno;
	}

	public void setA_phno(String a_phno) {
		System.out.println("AdminBean.setA_phno()");
		this.a_phno = a_phno;
	}

}
