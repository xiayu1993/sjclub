package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javabean.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class createClub
 */
@WebServlet("/createClub")
public class createClub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createClub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String account = request.getParameter("account");
		String name= request.getParameter("name");
		String isTopTen = request.getParameter("IsTopTen");
		Connection conn = DBUtil.getConnection();
		String sql = null;
		try{
			//向Users表中插入社团管理员，创建社团管理员账号
			sql = "insert into dbo.T_Users(Id,Name,Account,Password,Isinschool,Status) values(NEWID(),?,?,'111',0,'4f19adf5-fe47-4251-b5bb-8af0afba9d08')";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			ps.setString(2, account);
			ps.executeUpdate();
			ps.close();
			
			//向Club表中插入社团信息，创建社团
			sql = "insert into dbo.T_Club(Id,ClubName,IsTopTen) values(NEWID(),?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, isTopTen);
			ps.executeUpdate();
			ps.close();
			
			//向ClubAndUsers表中添加信息，将社团管理员和社团联系起来
			String UserId = null;	//社团管理员id
			String ClubId = null;	//社团id
			//查找社团管理员id
			sql = "select Id from dbo.T_Users where Account = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,account);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				UserId = rs.getString("Id");
			}
			rs.close();
			ps.close();
			
			//查找社团id
			sql = "select Id from dbo.T_Club where ClubName = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			rs = ps.executeQuery();
			if(rs.next()){
				ClubId = rs.getString("Id");
			}
			rs.close();
			ps.close();
			
			//将社团id和社团管理员id联系起来
			sql = "insert into dbo.T_ClubAndUsers values (NEWID(),?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, UserId);
			ps.setString(2, ClubId);
			ps.executeUpdate();
			ps.close();
			
			//弹出提示信息
			PrintWriter out = response.getWriter();
			out.print("<script>alert(\"社团注册成功\")</script>");
			response.setHeader("refresh", "0;URL=infopage/createClub.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.closeConnection(conn);
		}
	}

}
