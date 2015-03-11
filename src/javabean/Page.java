package javabean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * 定义数据分页操作
 * 
 * 
 */
public class Page {
	private Connection conn = null;	//数据库连接对象
	private Statement stmt = null;	//Statement对象，用于执行不带参数的简单SQL语句
	private ResultSet rs = null;	//结果集
	
	/*数据库查询*/
	public ResultSet selectSql(String sql) throws SQLException{
		//连接数据库
		Connection conn = DBUtil.getConnection();
		try{
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	/*分栏显示*/
	
	/*关闭数据库资源*/
	public void closeAll(){
		if(conn != null && stmt != null && rs != null){
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
