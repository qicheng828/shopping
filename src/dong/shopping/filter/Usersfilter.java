package dong.shopping.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class Usersfilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse res,
		FilterChain filter) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		if(request.getSession().getAttribute("users")==null)
		{
//			String s=(String)request.getSession().getAttribute("gotoUrl");
//			String goUrl=s;
			String url=request.getRequestURI();
			String goUrl=url.substring(request.getContextPath().length());
			if(request.getQueryString()!=null){
				goUrl+="?"+request.getQueryString();
			}
			request.getSession().setAttribute("goUrl", goUrl);
			request.setAttribute("error", "用户名不能为空");
			request.getRequestDispatcher("/userLogin.jsp").forward(req, res);
		}else
		{
			filter.doFilter(req, res);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
