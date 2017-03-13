package dong.shopping.impl;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dong.shopping.pojo.Forder;
import dong.shopping.pojo.Users;
import dong.shopping.service.IUsers;

public class UsersImplTest {

	private static ApplicationContext context=null;
	private static IUsers userImpl=null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		context=new ClassPathXmlApplicationContext("applicationContext-*.xml");
		userImpl=(IUsers)context.getBean("userImpl");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		userImpl=null;
		context=null;
	}

	@Test
	public void testGetUsers() {
		Users users=new Users();
		users.setUlogin("admin1234");
		users.setUpass("admin1234");
		
		System.out.println(userImpl.getUsers(users).getUpass());
//		System.out.println("=====ddd===");
//		System.out.println(userImpl.getUsers(users).getUpass());
		
		
//		if(userImpl.getUsers(users)==null)
//		{
//			System.out.println(userImpl.getUsers(users).getUname()+"sss");
//			ServletActionContext.getRequest().setAttribute("error", "账号或密码错误,请重新输入");
//		
//		}
//		else
//	   {
//			System.out.println(userImpl.getUsers(users));
//		System.out.println(userImpl.getUsers(users).getUpass()+"-"+userImpl.getUsers(users).getUlogin());
//         System.out.println("ok");
//	   }	
	}

}
