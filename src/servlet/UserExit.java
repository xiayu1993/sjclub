package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.User;

/**
 * Servlet implementation class UserExit
 * 对用户退出请求进行操作
 * 将存放在Session中的User对象逐出
 */
@WebServlet("/UserExit")
public class UserExit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserExit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		//获取用户对象
		User user = (User)session.getAttribute("user");
		//判断用户是否有效
		if(user != null){
			//将用户对象逐出Session
			session.removeAttribute("user");
			response.setHeader("refresh", "0;URL=sjclub/index.jsp");
		}
	}

}
