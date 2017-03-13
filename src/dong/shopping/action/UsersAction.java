package dong.shopping.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import dong.shopping.pojo.Forder;
import dong.shopping.pojo.Users;
import dong.shopping.service.IUsers;
import dong.shopping.util.DigestUtil;

public class UsersAction {

	private int currentPage;

	private IUsers userImpl;

	private String goUrl = null;

	private Users users;
	private String selectp;
	private String selectc;
	private Integer uid;
	private String password;
	private String newpass;

	// 验证用户登陆信息
	public String getUserss() {
		Users user = userImpl.getUsers(users);
		if (user == null) {
			ServletActionContext.getRequest().setAttribute("error",
					"账号或密码错误,请重新输入");
			return "login";
		} else {
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			session.setAttribute("users", user);
			session.setAttribute("forder", new Forder());
			session.setAttribute("goodnum", 0);
			if (session.getAttribute("goUrl") == null)
				return "show";
			else {
				goUrl = session.getAttribute("goUrl").toString();
				return "goUrl";
			}
		}
	}

	public String saveUsers() {
		users.setUpass(DigestUtil.hmacSign(users.getUpass(), "users"));
		userImpl.saveUsers(users);
		ServletActionContext.getRequest().getSession().setAttribute("users",
				users);
		return "success";
	}

	// 退出用户 跳转到首页
	public String exit() {
		ServletActionContext.getRequest().getSession().removeAttribute("users");
		ServletActionContext.getRequest().getSession().removeAttribute("goUrl");
		ServletActionContext.getRequest().getSession().setAttribute("goodnum",
				0);
		ServletActionContext.getRequest().setAttribute("info",
				"登陆取消成功!!!! 将跳转到购物网的首页");
		ServletActionContext.getRequest().setAttribute("url",
				"/shopping/index.jsp");
		return "goto";
	}

	// 查询用户信息
	public String queryUser() {
		List<Users> user = userImpl.queryUsers(users.getUlogin(), users
				.getUphone(), users.getUemail(), 1);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("ulogin", users.getUlogin());
		session.setAttribute("uphone", users.getUphone());
		session.setAttribute("uemail", users.getUemail());
		session.setAttribute("currentPage", 1);
		ServletActionContext.getRequest().setAttribute("usersList", user);
		return "query";
	}

	// 修改用户信息
	public String UpUser() {
		ActionContext context = ActionContext.getContext();
		users.setUaddress(selectp + selectc + users.getUaddress());
		Integer cc = userImpl.upuser(users);
		context.getSession().put("users", users);
		System.out.println(cc);
		return "main";
	}

	// 验证密码正确性
	public String LookPassword() throws IOException {
		System.out.println(password);
		setPassword(DigestUtil.hmacSign(getPassword(), "users"));
		System.out.println(password  +"加密后是");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		Users users = userImpl.LookPassword(password);
		if (users!=null) {
			System.out.println("成功,密码是对的");
			out.print("true");
		} else {
			System.out.println("失败，密码是错误的");
			out.print("false");
		}
		out.flush();
		out.close();

		return null;

	}

	// 修改密码
	public String UpPassword() {

		System.out.println(uid + "aaa");

		return "main";

	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getGoUrl() {
		return goUrl;
	}

	public void setUserImpl(IUsers userImpl) {
		this.userImpl = userImpl;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getSelectp() {
		return selectp;
	}

	public void setSelectp(String selectp) {
		this.selectp = selectp;
	}

	public String getSelectc() {
		return selectc;
	}

	public void setSelectc(String selectc) {
		this.selectc = selectc;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
