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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取action中的参数，按照action使用不同的方法进行处理
		String action = request.getParameter("action");
		if(action.equals("checkAcc"))
			checkAcc(request, response);
		if(action.equals("checkName"))
			checkName(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//使用post方法表示提交注册信息
		User user = new User();
		user.setAccount(request.getParameter("account"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		user = UserDB.saveUser(user);
		request.getSession().setAttribute("user",user);
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control","no-cache");
		out.print("regOk");
		
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
			out.print("accExist");
		}else{
			out.print("Ok");
		}
	}
	
	/**
	 * @see HttpServlet#checkName(HttpServletRequest request, HttpServletResponse response)
	 * 检查昵称是否存在
	 */
	protected void checkName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control","no-cache");
		String name = request.getParameter("name");
		if(UserDB.userNameIsExist(name)){
			out.print("nameExist");
		}else{
			out.print("Ok");
		}
	}

}
