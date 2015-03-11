package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * 数据库连接与关闭操作
 * 
 */
public class DBUtil {
	/*
	 * 数据库连接
	 */
	public static Connection getConnection(){
		Connection conn = null;
		try{
			//加载驱动
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//数据库连接URL
			String connUrl = "jdbc:sqlserver://sjclub.org:1433;databaseName=Club;";
			conn = DriverManager.getConnection(connUrl,"sa","xiayu1010");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("数据库连接异常！");
		}
		return conn;
	}
	
	/**
	 * 关闭数据库连接
	 */
	public static void closeConnection(Connection conn){
		//判断conn是否为空
		if(conn != null){
			try{
				//关闭数据库连接
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("数据库未能正确关闭！");
			}
		}
	}
}
