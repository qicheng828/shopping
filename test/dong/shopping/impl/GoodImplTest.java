package dong.shopping.impl;

import java.util.List;

import org.apache.derby.tools.sysinfo;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dong.shopping.pojo.Good;
import dong.shopping.service.IGoods;

public class GoodImplTest {

	private static ApplicationContext context=null;
	private static IGoods goodsImpl=null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		context=new ClassPathXmlApplicationContext("applicationContext-*.xml");
		goodsImpl=(IGoods)context.getBean("goodsImpl");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		context=null;
		goodsImpl=null;
	}

	@Test
	public void testQueryGood() {
		List<Object> list=goodsImpl.queryGood("",(Integer)null,null, 1);
		System.out.println(list.get(0));
	}

}
