package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * 用户数据库操作方法
 * static boolean userAccIsExist(String account) 			查询指定用户账号是否在数据库中存在
 * static boolean userNameIsExist(String name) 				查询指定用户昵称是否在数据库中存在
 * static boolean userIsClub(String userId, String clubId) 	查询用户是否是社团的会员
 * static void addClub(String userId, String clubId) 		用户加入社团
 * static User saveUser(User user) 							用户注册
 * static User login(String account,String password) 		用户登录
 * 
 * @author XIAYU
 *
 */
public class UserDB {
	/**
	 * 查询指定用户账号是否在数据库中存在
	 */
	public static boolean userAccIsExist(String account){
		boolean mark = false;
		//获取数据库连接Connection对象
		Connection conn = DBUtil.getConnection();
		//根据指定用户账号查询用户信息
		String sql = "select * from dbo.T_Users where Account = ?";
		try{
			//获取PreparedStatement对象
			PreparedStatement ps = conn.prepareStatement(sql);
			//对用户对象属性赋值
			ps.setString(1, account);
			//执行查询获取结果集
			ResultSet rs = ps.executeQuery();
			//判断结果集是否有效
			if(rs.next()){
				//如果存在账号则返回true
				mark = true;
			}
			//释放此ResultSet对象的数据库和JDBC资源
			rs.close();
			//释放此PreParedStatement对象的数据库和JDBC资源
			ps.close();
		}
		catch(SQLException e){
			e.printStackTrace();
			System.out.print("UserDB.userIsExist error!");
		}
		finally{
			//关闭数据库连接
			DBUtil.closeConnection(conn);
		}
		return mark;
	}
	
	/**
	 * 查询指定用户昵称是否在数据库中存在
	 */
	public static boolean userNameIsExist(String name){
		boolean mark = false;
		//获取数据库连接Connection对象
		Connection conn = DBUtil.getConnection();
		//根据指定用户昵称查询用户信息
		String sql = "select * from dbo.T_Users where Name = ?";
		try{
			//获取PreparedStatement对象
			PreparedStatement ps = conn.prepareStatement(sql);
			//对用户对象属性赋值
			ps.setString(1, name);
			//执行查询获取结果集
			ResultSet rs = ps.executeQuery();
			//判断结果集是否有效
			if(rs.next()){
				//如果存在昵称则返回true
				mark = true;
			}
			//释放此ResultSet对象的数据库和JDBC资源
			rs.close();
			//释放此PreParedStatement对象的数据库和JDBC资源
			ps.close();
		}
		catch(SQLException e){
			e.printStackTrace();
			System.out.print("UserDB.userNameIsExist error!");
		}
		finally{
			//关闭数据库连接
			DBUtil.closeConnection(conn);
		}
		return mark;
	}
	
	/**
	 * 查询用户是否是社团的会员,并且同时参加的社团最多为三个
	 * mark为-1时表示已经是本社团的成员
	 * mark为0时表示不是本社团成员，其他数目则表示已经参加的社团数目
	 */
	public static int userIsClub(String userId, String clubId){
		int mark = 0;
		Connection conn = DBUtil.getConnection();
		String sql = "select * from dbo.T_ClubAndUsers where Users = ?";
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString("Club").equals(clubId)){
					//如果用户已经参加了此社团，返回-1
					mark = -1;
					break;
				}else{
					//如果没有参加社团，则返回参加了社团的数目
					mark++;
				}
			}
			rs.close();
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.closeConnection(conn);
		}
		return mark;
	}
	
	/**
	 * 用户加入社团
	 */
	public static void addClub(String userId, String clubId){
		Connection conn = DBUtil.getConnection();
		String sql = "insert into dbo.T_ClubAndUsers values (NEWID(),?,?)";
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, clubId);
			ps.executeUpdate();
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.closeConnection(conn);
		}
	}
	
	/**
	 * 用户注册
	 */
	public static User saveUser(User user){
		//将用户的身份标识从Users表里的Status转化为Status表里的Rank
		String status = null;
		//获取数据库连接Connection对象
		Connection conn = DBUtil.getConnection();
		//插入用户注册信息的SQL语句
		String sql = "insert into dbo.T_Users(Id,Name,Account,Password,Isinschool,Status) values(NEWID(),?,?,?,0,'7D9F9097-7E0A-433A-B951-544C65AB400E')";
		try{
			//获取PreparedStatement对象
			PreparedStatement ps = conn.prepareStatement(sql);
			//对SQL语句的占位符参数进行动态赋值
			ps.setString(1,user.getName());
			ps.setString(2,user.getAccount());
			ps.setString(3,user.getPassword());
			//执行更新操作
			ps.executeUpdate();
			//释放此PreparedStatement对象的数据库和JDBC资源
			ps.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		//获得新注册用户的id值，并保存在用户对象中
		try{
			sql = "select * from dbo.T_Users where Account = ?";
			//获取PreparedStatement对象
			PreparedStatement ps = conn.prepareStatement(sql);
			//对用户对象属性赋值
			ps.setString(1, user.getAccount());
			//执行查询获取结果集
			ResultSet rs = ps.executeQuery();
			//判断结果集是否有效
			if(rs.next()){
				//如果存在账号则将用户Id保存到用户对象中
				user.setId(rs.getString("Id"));
				//获取用户的Status值
				status = rs.getString("Status");
			}
			//释放此ResultSet对象的数据库和JDBC资源
			rs.close();
			//释放此PreParedStatement对象的数据库和JDBC资源
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		//将用户的身份标识从Users表里的Status转化为Status表里的Rank
		try{
			sql = "select * from dbo.T_Status where Id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				user.setRank(rs.getInt("Rank"));
				user.setType(rs.getString("Type"));
			}
			rs.close();
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			//关闭数据库连接
			DBUtil.closeConnection(conn);
		}
		return user;
	}
	
	/**
	 * 用户登录
	 * 查询用户名和密码，如果信息匹配则登录成功
	 */
	public static User login(String account,String password){
		//将用户的身份标识从Users表里的Status转化为Status表里的Rank
		String status = null;
		User user = null;
		Connection conn = DBUtil.getConnection();
		//根据账号和密码查询用户信息
		String sql = "select * from dbo.T_Users where Account = ? and Password = ?";
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,account);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			//判断结果集是否有效
			if(rs.next()){
				//实例化一个用户对象
				user = new User();
				//对用户对象属性赋值
				user.setId(rs.getString("Id"));
				user.setName(rs.getString("Name"));
				user.setAccount(rs.getString("Account"));
				user.setPassword(rs.getString("Password"));
				status = rs.getString("Status");
			}
			rs.close();
			ps.close();
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.print("UserDB.login error!");
		}
		//将用户的身份标识从Users表里的Status转化为Status表里的Rank
		try{
			sql = "select * from dbo.T_Status where Id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				user.setRank(rs.getInt("Rank"));
				user.setType(rs.getString("Type"));
			}
			rs.close();
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DBUtil.closeConnection(conn);
		}
		return user;
	}
}
