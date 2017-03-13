package dong.shopping.imp;

import com.opensymphony.xwork2.ActionSupport;

//注意：本界面为二次开发

public class DeleteOrder extends ActionSupport{
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String execute() throws Exception {
		
		System.out.println(id+"aaaa");
		return SUCCESS;
	}
	

}
