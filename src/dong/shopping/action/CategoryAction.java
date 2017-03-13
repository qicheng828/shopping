package dong.shopping.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dong.shopping.pojo.Account;
import dong.shopping.pojo.Category;
import dong.shopping.service.ICategory;

public class CategoryAction extends ActionSupport{
	private Integer cid;
	
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}

	private String ctype;
	private Boolean chot;
	
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public Boolean getChot() {
		return chot;
	}
	public void setChot(Boolean chot) {
		this.chot = chot;
	}

	private ICategory ca = null;

	private Category category = null;

	//添加商品类型
	public String saveCategory() {
		Category cat=null;
		//System.out.println("我进来啦,哈哈哈哈"+ctype+chot);
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try {
			ts.begin();
			Account account=(Account) session.get(Account.class,1);
			cat=new Category();
			cat.setCtype(ctype);
			cat.setChot(chot);
			cat.setAccount(account);
			session.save(cat);
			ts.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("添加失败");
		}finally{
			if (session!=null) {
				session.close();
			}
		}
		
		return "main";
	}
	public String execute() throws Exception {
		ActionContext context=ActionContext.getContext();
		System.out.println("5555555");
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		ts.begin();
		String Hql="from Category";
		Query query=session.createQuery(Hql);
		List<Category> cList=query.list();
		context.getSession().put("category", cList);
		ts.commit();
		return SUCCESS;
	}
	public void CheckCtype() throws IOException {
		boolean isHave = ca.CheckCtype(category.getCtype());
		
		HttpServletResponse response = ServletActionContext.getResponse();
		if (isHave) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
    //��ѯ���
	public String queryCategory() {
		
		ServletActionContext.getServletContext().setAttribute("categorys",ca.queryCategory(""));
		return "query";
	}

	//根据ID删除
	public String deleteCategory() {
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try {
			ts.begin();
			Category category=(Category) session.get(Category.class, cid);
			session.delete(category);
			ts.commit();
			//System.out.println("删除成功啦啦啦");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (session!=null) {
				session.close();
			}
		}
		return "query";
	}

	//修改分类
	public String updateCategory() {
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try {
			
			System.out.println(ctype);
			ts.begin();
			Category category=(Category) session.get(Category.class, cid);
			category.setChot(chot);
			category.setCtype(ctype);
			session.update(category);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (session!=null) {
				session.close();
			}
		}
		
		return "query";
	}
	//修改分类是否热点
	public String updateChot()
	{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try {
			ts.begin();
			Category category=(Category) session.get(Category.class, cid);
			category.setChot(chot);
			session.update(category);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (session!=null) {
				session.close();
			}
		}
		return "query";
	}
	
	public void setCa(ICategory ca) {
		this.ca = ca;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}


}
