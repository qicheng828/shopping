package dong.shopping.util;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dong.shopping.pojo.Category;
import dong.shopping.service.ICategory;
import dong.shopping.service.IGoods;

public class ShoppingTimer extends TimerTask 
{
	private ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-*.xml");

	private ICategory categoryImpl=null;

	private IGoods goodsImpl=null;
	
	private ServletContext application=null;
	
	
	
	public ShoppingTimer(ServletContext application) {
		this.application=application;
	}
	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		categoryImpl=(ICategory)context.getBean("categoryImpl");
		goodsImpl=(IGoods)context.getBean("goodsImpl");
		List<List> goodlist=new ArrayList<List>();
		 for(Category category : categoryImpl.queryCategory(true))
		 {
			 goodlist.add(goodsImpl.queryGiscommend(category.getCid())); 
		 }
		 System.out.println(goodlist.get(0)+"aaaaa");
		
		 application.setAttribute("goodlist", goodlist);
	}
}
