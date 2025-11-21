package com.pack2;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CustomerBean implements Serializable
{
	private String customerName;
	private String customerPassword;
	private String customerFirstName;
	private String customerLastName;
	private String customerAddress;
	private String customerMailId;
	private String customerMobile;
	
	public CustomerBean(){
		super();
		System.out.println("CustomerBean.CustomerBean()");
	}
	
	public String getCustomerName() {
		System.out.println("CustomerBean.getCustomerName()");
		return customerName;
	}
	public void setCustomerName(String customerName) {
		System.out.println("CustomerBean.setCustomerName()");
		this.customerName = customerName;
	}
	public String getCustomerPassword() {
		System.out.println("CustomerBean.getCustomerPassword()");
		return customerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		System.out.println("CustomerBean.setCustomerPassword()");
		this.customerPassword = customerPassword;
	}
	public String getCustomerFirstName() {
		System.out.println("CustomerBean.getCustomerFirstName()");
		return customerFirstName;
	}
	public void setCustomerFirstName(String customerFirstName) {
		System.out.println("CustomerBean.setCustomerFirstName()");
		this.customerFirstName = customerFirstName;
	}
	public String getCustomerLastName() {
		System.out.println("CustomerBean.getCustomerLastName()");
		return customerLastName;
	}
	public void setCustomerLastName(String customerLastName) {
		System.out.println("CustomerBean.setCustomerLastName()");
		this.customerLastName = customerLastName;
	}
	public String getCustomerAddress() {
		System.out.println("CustomerBean.getCustomerAddress()");
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		System.out.println("CustomerBean.setCustomerAddress()");
		this.customerAddress = customerAddress;
	}
	public String getCustomerMailId() {
		System.out.println("CustomerBean.getCustomerMailId()");
		return customerMailId;
	}
	public void setCustomerMailId(String customerMailId) {
		System.out.println("CustomerBean.setCustomerMailId()");
		this.customerMailId = customerMailId;
	}
	public String getCustomerMobile() {
		System.out.println("CustomerBean.getCustomerMobile()");
		return customerMobile;
	}
	public void setCustomerMobile(String customerMobile) {
		System.out.println("CustomerBean.setCustomerMobile()");
		this.customerMobile = customerMobile;
	}
	

}
