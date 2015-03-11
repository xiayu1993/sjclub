package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javabean.User;
import javabean.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //账号
    private String Account = null;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取action中的参数，按照action使用不同的方法进行处理
		String action = request.getParameter("action");
		if(action.equals("checkAcc"))
			checkAcc(request, response);
		if(action.equals("checkPas"))
			checkPas(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	/**
	 * @see HttpServlet#checkAcc(HttpServletRequest request, HttpServletResponse response)
	 * 检查账号是否存在
	 */
	protected void checkAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control","no-cache");
		String account = request.getParameter("account");
		if(UserDB.userAccIsExist(account)){
			Account = account;
			out.print("ok");
		}else{
			out.print("notExist");
		}
	}
	
	/**
	 * @see HttpServlet#checkPas(HttpServletRequest request, HttpServletResponse response)
	 * 检查账号所对应的密码是否正确，如果正确则返回首页
	 * 不正确则返回"pasIsError"
	 */
	protected void checkPas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control","no-cache");
		String password = request.getParameter("password");
		//临时使用，登录页面转发到波波的后台页面里
		String page = null;
		page = request.getParameter("page");
		User user = UserDB.login(Account,password);
		if(user != null){
			request.getSession().setAttribute("user", user);
			if(page == null){
				out.print("ok");
			}else{
				out.print("http://sjclub.org/Frame.aspx?uid="+user.getId());
			}
		}else{
			out.print("pasIsError");
		}
	}
	
	

}
