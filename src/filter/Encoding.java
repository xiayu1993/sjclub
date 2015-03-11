package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/*********************************************
 * 字符编码过滤器
 * 
 * Servlet Filter implementation class Encoding
 **********************************************/
@WebFilter(filterName = "/Encoding"
	, urlPatterns = {"/*"}
	, initParams = {
	@WebInitParam(name="encoding", value="utf-8")

})
public class Encoding implements Filter {

    /**
     * Default constructor. 
     */
	//字符编码（初始化参数）
	protected String encoding = null;
	//FilterConfig对象
	protected FilterConfig fConfig = null;
	
    public Encoding() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		//释放资源
		this.encoding = null;
		this.fConfig = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// place your code here
		//判断字符编码是否有效
		if(encoding != null){
			//设置request字符编码
			request.setCharacterEncoding(encoding);
			//设置response字符编码
			response.setContentType("text/html;charset="+encoding);
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		//对filterConfig赋值
		this.fConfig = fConfig;
		//对初始化参数赋值
		this.encoding = fConfig.getInitParameter("encoding");
	}

}
