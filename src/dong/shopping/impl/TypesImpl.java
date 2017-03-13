package dong.shopping.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



import dong.shopping.action.HibernateSessionFactory;
import dong.shopping.pojo.Good;

public class TypesImpl {
	public List<Good> lisGoods(int id){
		Session session=HibernateSessionFactory.getSession();
		List<Good> list=null;
		try {
			session.getTransaction().begin();
			String hql="from Good where cid=?";
			Query query=session.createQuery(hql);
			query.setInteger(0, id);
			list=query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
