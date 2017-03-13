package dong.shopping.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dong.shopping.impl.TypesImpl;
import dong.shopping.pojo.Good;

public class TypeAction extends ActionSupport {
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String LookType() {
		ActionContext context=ActionContext.getContext();
		TypesImpl typesImpl=new TypesImpl();
		List<Good> goods=typesImpl.lisGoods(id);
		context.getSession().put("goodlist", goods);
		if (id==4) {
			return SUCCESS;
		}
		if (id==5) {
			return "xiezi";
		}
		if (id==6) {
			return "shipin";
		}
		if (id==7) {
			return "huazhuang";
		}
		if (id==8) {
			return "maorong";
		}
		else {
			return SUCCESS;
		}
	}

}
