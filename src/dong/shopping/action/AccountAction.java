package dong.shopping.action;

import org.apache.struts2.ServletActionContext;

import dong.shopping.pojo.Account;
import dong.shopping.service.IAccount;

public class AccountAction {

	private IAccount accountImpl;
	
	private Account account;

	//验证客服登陆信息
	public String AccoutLogin()
	{
		
		account=accountImpl.getAccoutByName(account);
		if(account==null)
		{
			ServletActionContext.getRequest().setAttribute("error", "账号或密码错误,请重新输入");
			return "alogin";
		}else
		{
			if(account.getAgrade()==0||account.getAgrade()==1){
				ServletActionContext.getRequest().getSession().setAttribute("account", account);
				return "aindex";
			}
			else
			{
				ServletActionContext.getRequest().setAttribute("error", "你好!当前你不是管理员或客服");
				return "alogin";
			}
		}
		
	}
	
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public void setAccountImpl(IAccount accountImpl) {
		this.accountImpl = accountImpl;
	}
}
