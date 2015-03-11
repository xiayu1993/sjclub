package filter;

import java.io.IOException;

import javabean.User;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/************************************************
 * 检验用户是否登录的过滤器
 * 进入后台管理系统要求登录
 * 如果没有登录则要求登录，如果登录则进入页面
 * 
 * Servlet Filter implementation class UserIsLogin
 ************************************************/
//对所有的jsp页面进行过滤
//不能对所有请求都进行过滤，否则js和css文件加载起来也有问题
@WebFilter(filterName = "/UserIsLogin", 
			urlPatterns = {"*.jsp"}
			)
public class UserIsLogin implements Filter {

    /**
     * Default constructor. 
     */
    public UserIsLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest request = (HttpServletRequest)sRequest;
		HttpServletResponse response = (HttpServletResponse)sResponse;
		//获取用户请求的uri
		String uri = request.getRequestURI();
		//获取session中的用户信息
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//如果uri属于后台管理页面，则进行登录检查
		if((uri.indexOf("manager") != -1) || (uri.indexOf("count") != -1)){
			//如果用户未登录
			if(user == null){
				//跳转到登录页面
				response.sendRedirect("../infopage/login.jsp");
			}else{
				// pass the request along the filter chain
				chain.doFilter(request, response);
			}
		}else{
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
