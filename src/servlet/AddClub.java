package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javabean.DBUtil;
import javabean.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddClub
 */
@WebServlet("/AddClub")
public class AddClub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control","no-cache");
		//获取用户Id以及社团Id
		String userId = request.getParameter("userId");
		String clubId = request.getParameter("clubId");
		//检查用户是否是社团的会员，并返回已经参加的社团数目
		int club = UserDB.userIsClub(userId, clubId);
		if(club == -1){
			//如果用户已经是社团的成员了
			out.print("userIsClub");
		}else if(club > 3){
			//如果用户参加的社团数目大于3，则不允许其再参加社团
			out.print("refuse");
		}else{
			//如果用户既不是此社团成员，参加的社团又不多于3个，则加入社团中
			UserDB.addClub(userId, clubId);
			out.print("ok");
		}
	}

}
