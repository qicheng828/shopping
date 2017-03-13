package dong.shopping.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import dong.shopping.pojo.Forder;
import dong.shopping.pojo.Sorder;
import dong.shopping.pojo.Users;
import dong.shopping.service.IForder;

public class ForderAction {

	private IForder forderImpl;

	private Forder forder;
	private Users users;
	private Sorder sorder;

	private int currentPage;
	
	//添加购物车和购物项
	public String addSorder() {	
		HttpSession session = ServletActionContext.getRequest().getSession();
		Forder forder = (Forder) session.getAttribute("forder");
		forder = forderImpl.addforder(forder, sorder);
		//在结算总价
		forder.setFtotal(forderImpl.cluMoney(forder));
		//每买一件商品记录在goodnum中
	    session.setAttribute("goodnum",forderImpl.countGoodNum(forder));
		session.setAttribute("forder", forder);
		return "showcar";

	}
	//清空购物项
	public String ToFtotal() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("forder", new Forder());
		return "showcar";

	}
	//删除购物项
	public String deleteSorder() {

		HttpSession session = ServletActionContext.getRequest().getSession();
		Forder fordre = (Forder) session.getAttribute("forder");
		forder = forderImpl.deleteSorder(fordre, sorder.getGood().getGid());
		forder.setFtotal(forderImpl.cluMoney(fordre));
		session.setAttribute("forder", forder);
		return "showcar";
	}
	 //更新价格
	public void updateSorder() throws IOException {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Forder forder = (Forder) session.getAttribute("forder");
		forder = forderImpl.updateSorder(forder, sorder);
		session.setAttribute("forder", forder);
		ServletActionContext.getResponse().getWriter().write(
				forder.getFtotal() + " ");
	}
	//删除购物车
	public String deleteForder()
	{
		forderImpl.deleteForder(forder);
		System.out.println("我的的确确进来了");
		return "query";
	}
	//把订单添加到数据库
	public String savefoder() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Forder buycar = (Forder) session.getAttribute("forder");
//		forder.setFtotal(buycar.getFtotal());
//		for (Sorder temp : buycar.getSorders()) {
//			temp.setForder(forder);
//		}
//		//先添加主订单在添加子订单
//		forder.setSorders(buycar.getSorders());
//		forder = forderImpl.saveForder(forder);
//		//把记录商品的goodnum清零
//		session.setAttribute("goodnum",0);
//		ServletActionContext.getRequest().setAttribute("forder", forder);
		buycar.setUname(forder.getUname());
		buycar.setUname(forder.getUname());
		buycar.setUaddress(forder.getUaddress());
		buycar.setUphone(forder.getUphone());
		buycar.setUemail(forder.getUemail());
		buycar.setUpost(forder.getUpost());
		buycar.setFremark(forder.getFremark());
		buycar.setUsers((Users) session.getAttribute("users"));
		forder = forderImpl.saveForder(buycar);
		session.setAttribute("goodnum",0);
		session.setAttribute("payForder", forder);
		return "onlinePay";
	}
	//查询订单 和分页
	public String queryForder() throws Exception
	{
		List<Object> forders=forderImpl.queryForder(forder.getUname(),forder.getFid(),forder.getFdate(),1);
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("uname",forder.getUname());
		session.setAttribute("fid",forder.getFid());
		session.setAttribute("fdate",forder.getFdate());
		session.setAttribute("currentPage",1);
		session.setAttribute("page",forderImpl.tatalPag(forder.getUname(),forder.getFid(),forder.getFdate()));
		session.setAttribute("pages",forderImpl.talPage(forder.getUname(), forder.getFid(), forder.getFdate()));
		ServletActionContext.getRequest().setAttribute("forders",forders);
		return "query";
	}
	//查询的页数
	public String splitPage()
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("currentPage", currentPage);
		List<Object> forders=forderImpl.queryForder(session.getAttribute("uname").toString(),(Integer)session.getAttribute("fid"),(Date)session.getAttribute("fdate"), currentPage);
		ServletActionContext.getRequest().setAttribute("forders", forders);
	    return "query";
	}
	//查看详细的订单信息
	public String queryBySorder()
	{
      ServletActionContext.getRequest().setAttribute("sorders",forderImpl.queryForderBysid(sorder.getForder().getFid()));
	  return "querySorder";	
	}
	
	
	
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public void setForderImpl(IForder forderImpl) {
		this.forderImpl = forderImpl;
	}

	public Forder getForder() {
		return forder;
	}

	public void setForder(Forder forder) {
		this.forder = forder;
	}

	public Sorder getSorder() {
		return sorder;
	}

	public void setSorder(Sorder sorder) {
		this.sorder = sorder;
	}
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
}
