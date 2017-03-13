package dong.shopping.util;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dong.shopping.service.ICategory;
import dong.shopping.service.IForder;

public class ShoppingContextListener implements ServletContextListener{

	private ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-*.xml");

	
	private ICategory categoryImpl=null;
	
	private IForder forderImpl=null;
	public void contextDestroyed(ServletContextEvent arg0)
	{	
	}
	public void contextInitialized(ServletContextEvent event) {
		
		categoryImpl=(ICategory)context.getBean("categoryImpl");
		event.getServletContext().setAttribute("categorys", categoryImpl.queryCategory(""));
		
		new Timer().schedule(new ShoppingTimer(event.getServletContext()),0,1000*60*60*24);
		
		forderImpl=(IForder)context.getBean("forderImpl");
        String[] fileName=forderImpl.getBeans(event.getServletContext().getRealPath("/")+"image/logo");
        event.getServletContext().setAttribute("logo", fileName);
	    
	}
	
}
