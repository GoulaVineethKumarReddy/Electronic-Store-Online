package com.pack1;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ProductBean implements Serializable
{
	private String p_code,p_name,p_comp,p_price,p_qty;
	
	public ProductBean() {
		super();
		System.out.println("ProductBean.ProductBean()");
	}

	public String getP_code() {
		System.out.println("ProductBean.getP_code()");
		return p_code;
	}

	public void setP_code(String p_code) {
		System.out.println("ProductBean.setP_code()");
		this.p_code = p_code;
	}

	public String getP_name() {
		System.out.println("ProductBean.getP_name()");
		return p_name;
	}

	public void setP_name(String p_name) {
		System.out.println("ProductBean.setP_name()");
		this.p_name = p_name;
	}

	public String getP_comp() {
		System.out.println("ProductBean.getP_comp()");
		return p_comp;
	}

	public void setP_comp(String p_comp) {
		System.out.println("ProductBean.setP_comp()");
		this.p_comp = p_comp;
	}

	public String getP_price() {
		System.out.println("ProductBean.getP_price()");
		return p_price;
	}

	public void setP_price(String p_price) {
		System.out.println("ProductBean.setP_price()");
		this.p_price = p_price;
	}

	public String getP_qty() {
		System.out.println("ProductBean.getP_qty()");
		return p_qty;
	}

	public void setP_qty(String p_qty) {
		System.out.println("ProductBean.setP_qty()");
		this.p_qty = p_qty;
	}

}
