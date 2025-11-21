package com.pack1;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener 
	implements HttpSessionListener,HttpSessionAttributeListener
{
	@Override
	public void sessionCreated(HttpSessionEvent hse)
	{
		System.out.println("---- session created");
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent hse)
	{
		System.out.println("---- session destroyed");
	}
	@Override
	public void attributeAdded(HttpSessionBindingEvent hsbe)
	{
		System.out.println("---- session attribute added");
		System.out.println("====> Attribute Name : "+hsbe.getName());
	}
	@Override
	public void attributeRemoved(HttpSessionBindingEvent hsbe)
	{
		System.out.println("---- session attribute removed");
	}

}
