package dong.shopping.impl;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import dong.shopping.pojo.Account;
import dong.shopping.service.IAccount;

public class AccoutImpl implements IAccount{

	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	public Account getAccoutByName(Account account) {
		String SQL="From Account where alogin=:alogin and apass=:apass and agrade=:agrade";
		String[] name={"alogin","apass","agrade"};
		Object[] value={account.getAlogin(),account.getApass(),account.getAgrade()};
		List  s=hibernateTemplate.findByNamedParam(SQL, name, value);
		return s.size()==0?null:(Account)s.get(0);
	}


	
}
