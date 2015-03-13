package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 统计工具中的数据库操作方法
 * 
 * @author XIAYU
 *
 */
public class CountDB {
	private Connection conn = null;	//数据库连接对象
	private PreparedStatement ps = null;	//PreparedStatement对象
	private ResultSet rs = null;	//结果集
	
	/*数据库查询*/
	public ResultSet selectSql(String sql, String userId) throws SQLException{
		//连接数据库
		Connection conn = DBUtil.getConnection();
		try{
			ps = conn.prepareStatement(sql);
			ps.setString(1,userId);
			rs = ps.executeQuery();
		}catch (SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	/*关闭数据库资源*/
	public void closeAll(){
		if(conn != null && ps != null && rs != null){
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
