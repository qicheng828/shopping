package dong.shopping.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import dong.shopping.pojo.Category;
import dong.shopping.pojo.Forder;
import dong.shopping.pojo.Good;
import dong.shopping.service.IGoods;

public class GoodImpl implements IGoods {

	private HibernateTemplate hibernateTemplate;
	private final int size = 5;

	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public String deleteGoods(Good good) {
		hibernateTemplate.delete(good);
		return null;
	}

	@SuppressWarnings("unchecked")
	public int tatalPag(final String gname) {
		String sql = "SELECT count(*) as num from Good where gname like :gname";
		List object = (List) hibernateTemplate.findByNamedParam(sql, "gname",
				"%" + gname + "%");

		int page = Integer.parseInt(object.get(0).toString());
		return page % size == 0 ? page / size : page / size + 1;
	}

	public void updateGisopen(final Good good)
	{
		hibernateTemplate.execute(new HibernateCallback() 
	{
		public Object doInHibernate(Session session) throws HibernateException,
				SQLException {
			session.createQuery("update Good set gisopen=:gisopen where gid=:gid")
		.setBoolean("gisopen", good.getGisopen())
		.setInteger("gid", good.getGid())
		.executeUpdate();
			return null;
		}
	});
	}
	
	public void updateGiscommend(final Good good)
	{
		hibernateTemplate.execute(new HibernateCallback() 
	{
		public Object doInHibernate(Session session) throws HibernateException,
				SQLException {
			session.createQuery("update Good set giscommend=:giscommend where gid=:gid")
		.setBoolean("giscommend", good.getGiscommend())
		.setInteger("gid", good.getGid())
		.executeUpdate();
			
			return null;
		}
	});
	}
	
	public String saveGoods(Good good) {
		hibernateTemplate.save(good);
		return null;
	}

	public void updateGoods(Good good) {
		hibernateTemplate.update(good);
	}

	public String newName(String fileName) {
		int point = fileName.lastIndexOf(".");
		String ext = fileName.substring(point + 1);
		return UUID.randomUUID().toString() + "." + ext;
	}

	public void upfile(File file, String path) throws Exception {
		int size = 5 * 1024;
		BufferedInputStream inputStream = new BufferedInputStream(
				new FileInputStream(file), size);
		BufferedOutputStream outputStream = new BufferedOutputStream(
				new FileOutputStream(path), size);
		byte[] data = new byte[size];
		while (inputStream.read(data) > 0) {
			outputStream.write(data);
		}
		outputStream.close();
	}
   @SuppressWarnings("unchecked")
public List queryGiscommend(final int cid)
   {
        return (List)hibernateTemplate.execute(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return 	session.createSQLQuery("select * from Good g inner join Category c on c.cid=g.cid where giscommend=true and gisopen=true and g.cid=:cid")
				.addEntity(Good.class)
				.addEntity(Category.class)
				.setInteger("cid",cid )
				.list();
			}
		});   
   }
	@SuppressWarnings("unchecked")
	public List<Object> queryGood(final String gname,final int gid,final Integer cid,final int currentPage) {
		return (List<Object>)hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String sql="select * from Good g inner join Category c on g.cid=c.cid where 1=1";
				if(gname!=null)
				{
					sql+=" and gname like "+ "'" +"%"+gname +"%"+"'";
				}
				if(gid!=0)
				{
					sql+=" and gid = "+gid;
				}
				if(cid!=null)
				{
					sql+=" and g.cid = "+cid;
				}
				return session.createSQLQuery(sql)
				.addEntity(Good.class)
				.addEntity(Category.class)
				.setFirstResult((currentPage - 1) * size)
				.setMaxResults(size)
				.list();
			}
		});
	}
	@SuppressWarnings("unchecked")
	public int tatalPag(final String gname,final int gid,final Integer cid)
	{
		String sql="select count(*) as num from Good where 1=1";
		if(gname!=null)
		{
			sql+=" and gname like "+ "'" +"%"+gname +"%"+"'";
		}
		if(gid!=0)
		{
			sql+=" and gid = "+gid;
		}
		if(cid!=null)
		{
			sql+=" and cid = "+cid;
		}
         List num=hibernateTemplate.find(sql);
	     int page=Integer.parseInt(num.get(0).toString());
         return page % size == 0 ? page / size : page / size + 1;
	}
	@SuppressWarnings("unchecked")
	public int talPage(final String gname,final int gid,final Integer cid)
	{
		String sql="select count(*) as num from Good where 1=1";
		if(gname!=null)
		{
			sql+=" and gname like "+ "'" +"%"+gname +"%"+"'";
		}
		if(gid!=0)
		{
			sql+=" and gid = "+gid;
		}
		if(cid!=null)
		{
			sql+=" and cid = "+cid;
		}
         List num=hibernateTemplate.find(sql);
	     int page=Integer.parseInt(num.get(0).toString());
         return page;
	}
	public Forder saveForder(Forder forder)
	{
	   hibernateTemplate.save(forder);
	  return forder;
	}

	@SuppressWarnings("unchecked")
	public List<Good> querybyGoodname(final String name) {
		// TODO Auto-generated method stub
		return (List<Good>)hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				return session.createQuery("From Good where gname like :gname")
				.setString("gname","%"+ name+"%")
				.list();
			}
		});
	}

	public Good queryByGoodid(final int id) {
		// TODO Auto-generated method stub
		return (Good)hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				return session.createQuery("From Good where gid=:gid")
				.setInteger("gid", id)
				.list().get(0);
			}
		});
	}
}
