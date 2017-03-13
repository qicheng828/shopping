package dong.shopping.impl;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import dong.shopping.pojo.Category;
import dong.shopping.service.ICategory;

public class CategoryImpl implements ICategory{

	private HibernateTemplate hibernateTemplate;
	

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	public String saveCategory(Category category) {
		hibernateTemplate.save(category);
	return "";
	}
	@SuppressWarnings("unchecked")
	public boolean CheckCtype(final String ctype)
	{
		List category=(List)hibernateTemplate.execute(new HibernateCallback() {
		public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
		return 	session.createQuery("FROM Category WHERE ctype=:ctype")
				.setString("ctype",ctype )
				.list();
			}
		});
		return category.size()!=0?true:false;
	}
	public String deleteCategory(final int cid) {
		hibernateTemplate.execute(new HibernateCallback()
		{
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				  session.createQuery("delete Category where cid =:cid")
				.setInteger("cid",cid)
				.executeUpdate();
				  return null;
			}
			
		});
      return null;
	}
	@SuppressWarnings("unchecked")
	public List<Category> queryCategory(final String ctype) {
		return (List<Category>)hibernateTemplate.execute(new HibernateCallback()
		{
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return 	session.createQuery("FROM Category WHERE ctype like:ctype")
				.setString("ctype", "%"+ ctype +"%")
				.list();
			}
		});
		
	}
	public String updateCategory( final Category category) {
		hibernateTemplate.execute(new HibernateCallback() 
		{
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				session.createQuery("update Category set ctype=:ctype,chot=:chot where cid=:cid")
			.setString("ctype", category.getCtype())
			.setBoolean("chot", category.getChot())
			.setInteger("cid", category.getCid())
			.executeUpdate();
				return null;
			}
		});
		return null;
	}
	public String updateChot(final Category category)
	{
		hibernateTemplate.execute(new HibernateCallback() 
	{
		public Object doInHibernate(Session session) throws HibernateException,
				SQLException {
			session.createQuery("update Category set chot=:chot where cid=:cid")
		.setBoolean("chot", category.getChot())
		.setInteger("cid", category.getCid())
		.executeUpdate();
			return null;
		}
	});
	return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> queryCategory(final boolean chot)
	{
		String sql="FROM Category WHERE chot=:chot";
		return hibernateTemplate.findByNamedParam(sql, "chot", chot);
		

	}
}
