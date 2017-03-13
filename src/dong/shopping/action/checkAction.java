package dong.shopping.action;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;



import com.opensymphony.xwork2.ActionSupport;


import dong.shopping.impl.UsersImpl;
import dong.shopping.pojo.Users;

public class checkAction extends ActionSupport {

	private String name;
	private UsersImpl ui = new UsersImpl();

	
	


	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	@Override
	public String execute() throws Exception {
		System.out.println(name);
        Users user=ui.finaUsers(name);
        PrintWriter out=ServletActionContext.getResponse().getWriter();
        if (user==null) {
			out.print("true");
		}else {
			out.print("false");
		}
        out.flush();
        out.close();
		return NONE;
	}
	}
	

