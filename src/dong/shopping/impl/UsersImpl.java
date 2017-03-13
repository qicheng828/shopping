package dong.shopping.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import dong.shopping.action.HibernateSessionFactory;
import dong.shopping.pojo.Users;
import dong.shopping.service.IUsers;
import dong.shopping.util.DigestUtil;

public class UsersImpl implements IUsers{

	private HibernateTemplate hibernateTemplate;
	
	private int size=5;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public String saveUsers(Users user) {
		hibernateTemplate.save(user);
	   return null;
	}
    @SuppressWarnings("unchecked")
	public Users getUsers(Users user)
    {
    	System.out.println("-->" +user.getUpass());
    	user.setUpass(DigestUtil.hmacSign(user.getUpass(), "users"));
    	System.out.println(user.getUpass());
    	String[] param={"ulogin","upass"};
    	String[] value={user.getUlogin(),user.getUpass()};
    	String sql="From Users where ulogin=:ulogin and upass=:upass";
        List userss= hibernateTemplate.findByNamedParam(sql, param, value);
        return userss.size()==0?null:(Users)userss.get(0);
    }
    
	@SuppressWarnings("unchecked")
	public List<Users> queryUsers(final String ulogin,final String uphone,final String uemail,final int currentPage) {
		return (List<Users>)hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String sql="select * from Users where 1=1";
				if(ulogin.length()!=0)
				{
					sql+=" and ulogin like "+ "'" +"%"+ulogin +"%"+"'";
				}
				if(uphone.length()!=0)
				{
					sql+=" and uphone like "+ "'" +"%"+ uphone +"%"+ "'";
				}
				if(uemail.length()!=0)
				{
					sql+=" and uemail like "+ "'" +"%" + uemail + "%"+"'";
				}
				return session.createSQLQuery(sql)
				.addEntity(Users.class)
				.setFirstResult((currentPage - 1) * size)
				.setMaxResults(size)
				.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	public int tatalPag(final String ulogin,final String uphone,final String uemail)
	{
		String sql="select count(*) as num from Users where 1=1";
		if(ulogin.length()!=0)
		{
			sql+=" and ulogin like "+ "'" +"%"+ulogin +"%"+"'";
		}
		if(uphone.length()!=0)
		{
			sql+=" and uphone like "+ "'" + uphone + "'";
		}
		if(uemail.length()!=0)
		{
			sql+=" and uemail like "+ "'" + uemail + "'";
		}
         List num=hibernateTemplate.find(sql);
	     int page=Integer.parseInt(num.get(0).toString());
         return page % size == 0 ? page / size : page / size + 1;
	}
	

	@SuppressWarnings("unchecked")
	public int talPage(final String ulogin,final String uphone,final String uemail)
	{
		String sql="select count(*) as num from Users where 1=1 ";
		if(ulogin.length()!=0)
		{
			sql+=" and ulogin like "+ "'" +"%"+ulogin +"%"+"'";
		}
		if(uphone.length()!=0)
		{
			sql+=" and uphone like "+ "'" + uphone + "'";
		}
		if(uemail.length()!=0)
		{
			sql+=" and uemail like "+ "'" + uemail + "'";
		}
         List num=hibernateTemplate.find(sql);
	     int page=Integer.parseInt(num.get(0).toString());
         return page;
	}

	public void deleteUser(final int uid) {
		// TODO Auto-generated method stub
		hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				session.createQuery("delete Users where uid=:uid")
				.setInteger("uid", uid)
				.executeUpdate();
				return null;
			}
		});
	}
	//修改用户信息
	public Integer upuser(Users users){
		Session session=HibernateSessionFactory.getSession();
		try {
			session.getTransaction().begin();
			Users us=(Users) session.get(Users.class, users.getUid());
			us.setUname(users.getUname());
			us.setUaddress(users.getUaddress());
			us.setUemail(users.getUemail());
			us.setUphone(users.getUphone());
			us.setUpost(users.getUpost());
			session.update(us);
			session.getTransaction().commit();
			return 3;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return 0;
		}
		
		
	}
	//用户名注册判断
	public Users finaUsers(String name){
		Users user=null;
		Session session=null;
		try {
			session=HibernateSessionFactory.getSession();
			Query query=session.createQuery("from Users where ulogin=?");
			query.setString(0, name);
			user=(Users) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (session!=null) {
				session.close();
			}
		}
		return user;
	}
	
	//查询密码正确性
	public Users LookPassword(String password){	
		Session session=HibernateSessionFactory.getSession();
		String Hql="from Users where upass=?";
		Users users=null;
		try {
			Query query=session.createQuery(Hql);
			query.setString(0, password);
			users=(Users) query.uniqueResult();
			if (users!=null) {
				System.out.println("取到东西了");
			}else {
				System.out.println("空的不解释");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return users;
	}
	//修改密码

	public Integer UpPassword(String password, Integer uid) {
		String sql="from Users upass=?";
		return null;
	}
	
}
