package dong.shopping.impl;

import java.io.File;
import java.io.FilenameFilter;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import dong.shopping.action.HibernateSessionFactory;
import dong.shopping.pojo.Forder;
import dong.shopping.pojo.Sorder;
import dong.shopping.pojo.Status;
import dong.shopping.pojo.Users;
import dong.shopping.service.IForder;

public class ForderImpl implements IForder{

	private HibernateTemplate hibernateTemplate;
	
	private int size =5;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	
	
	public void updateForder(final int fid,final int sid) {
		// TODO Auto-generated method stub
		hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				session.createQuery("update Forder set sid=:sid where fid=:fid")
				.setInteger("sid", sid)
				.setInteger("fid", fid)
				.executeUpdate();
				return null;
			}
		});
	}
	
	public Forder addforder(Forder forder,Sorder sorder) {
		boolean isHave=false;
		for(Sorder temp : forder.getSorders())
		{
		  if(temp.getGood().getGid()==sorder.getGood().getGid())
          {
			  temp.setGnumber(temp.getGnumber()+1);
			  isHave=true;
			  break;
		  }
		}
			  if(!isHave){
				sorder.setForder(forder);
				forder.getSorders().add(sorder);	
			  }
		return forder;
	}

	public Forder deleteSorder(Forder forder, int gid) {
		Iterator<Sorder> item=forder.getSorders().iterator();
		while(item.hasNext())
		{
			if(item.next().getGood().getGid()==gid)
			{
				item.remove();
			}
		}
		
		return forder;
	}

	public Double cluMoney(Forder forder) {
		Double xx=0.0;
	  for(Sorder temp:forder.getSorders())
	  {
		  xx+=temp.getGnumber()*temp.getGprice();
	  }
	  return xx;
	}
	
	public Forder updateSorder(Forder forder,Sorder sorder)
	{
		for(Sorder temp:forder.getSorders())
		{
			if(temp.getGood().getGid()==sorder.getGood().getGid())
			{
				temp.setGnumber(sorder.getGnumber());
				break;
			}
		}
		forder.setFtotal(this.cluMoney(forder));
		return forder;
	}
	
	public String[] getBeans(String path){
		File file = new File(path);
		if (file.isDirectory())
			return file.list(new FilenameFilter() {
				public boolean accept(File dir, String name) {
					String ext = name.substring(name.lastIndexOf(".") + 1);
					if (ext.equals("gif") || ext.equals("jpg"))
						return true;
					else
						return false;
				}
			});
		return null;
	}
	public int countGoodNum(Forder forder) {
		// TODO Auto-generated method stub
		int goodNum = 0;
		Set<Sorder> s=(HashSet<Sorder>)forder.getSorders();
      for(int i=0;i<s.size();i++){
   			goodNum+=1;
       }
		return goodNum;
	}
	@SuppressWarnings("unchecked")
	public List<Object> queryForder(final String uname,final Integer fid,final Date fdate,final int currentPage) {
		return (List<Object>)hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String sql="select * from Forder f inner join Users u on u.uid=f.uid inner join status s on s.sid=f.sid where 1=1 ";
				if(uname.length()!=0)
				{
					sql+="and f.uname like "+ "'" +"%"+uname +"%"+"'";
				}
				if(fid!=null)
				{
					sql+="and fid = "+fid;
				}
				if(fdate!=null)
				{
					sql+="and fdate = "+fdate;
				}
				return session.createSQLQuery(sql)
				.addEntity(Forder.class)
				.addEntity(Users.class)
				.addEntity(Status.class)
				.setFirstResult((currentPage - 1) * size)
				.setMaxResults(size)
				.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	public int tatalPag(final String uname,final Integer fid,final Date fdate)
	{
		String sql="select count(*) as num from Forder where 1=1";
		if(uname.length()!=0)
		{
			sql+=" and uname like "+ "'" +"%"+uname +"%"+"'";
		}
		if(fid!=null)
		{
			sql+=" and fid = "+fid;
		}
		if(fdate!=null)
		{
			sql+=" and fdate = "+fdate;
		}
         List num=hibernateTemplate.find(sql);
	     int page=Integer.parseInt(num.get(0).toString());
         return page % size == 0 ? page / size : page / size + 1;
	}
	

	@SuppressWarnings("unchecked")
	public int talPage(final String uname,final Integer fid,final Date fdate)
	{
		String sql="select count(*) as num from Forder where 1=1";
		if(uname.length()!=0)
		{
			sql+=" and uname like "+ "'" +"%"+uname +"%"+"'";
		}
		if(fid!=null)
		{
			sql+=" and fid = "+fid;
		}
		if(fdate!=null)
		{
			sql+=" and fdate ="+fdate;
		}
         List num=hibernateTemplate.find(sql);
	     int page=Integer.parseInt(num.get(0).toString());
         return page;
	}
	
	public void deleteForder(Forder fid)
	{
	  Session session=HibernateSessionFactory.getSession();
	  //System.out.println(fid.getFid()+"的的确确");
	  Transaction ts=session.beginTransaction();
	  try {
		ts.begin();
		  session.delete(fid);
		  ts.commit();
	} catch (HibernateException e) {
		e.printStackTrace();
	}finally{
		if (session!=null) {
			session.close();
		}
	}
	  
	  
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> queryForderBysid(final int fid) {
	return (List<Object>)hibernateTemplate.executeFind(new HibernateCallback() {
    public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
		  return session.createSQLQuery("select * From Sorder s inner join Forder f on f.fid=s.fid inner join Status t on t.sid=f.sid where s.fid =:fid")
				.addEntity(Sorder.class)
				.addEntity(Forder.class)
				.addEntity(Status.class)
				.setInteger("fid", fid)
				.list();
			}
		});
	}
	public Forder saveForder(Forder forder)
	{
	   hibernateTemplate.save(forder);
	  return forder;
	}
	
}
