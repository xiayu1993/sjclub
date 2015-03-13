package javabean;

//import java.util.HashMap;

/**
 * 统计表格类
 * 
 * 
 * @author XIAYU
 *
 */
public class CountTable {
	private String id;			//统计表Id
	private String userId;		//创建者Id
	private String tableName;	//统计表名称
	private String startTime;	//创建时间
	private String endTime;		//截止时间
	private String explain;		//表说明
	//private HashMap<String,String> countExample;	//示例列及示例
	
	/*各个参数的set与get方法*/
	//id
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return id;
	}
	//userId
	public void setUserId(String userId){
		this.userId = userId;
	}
	public String getUserId(){
		return userId;
	}
	//tableName
	public void setTableName(String tableName){
		this.tableName = tableName;
	}
	public String getTabelName(){
		return tableName;
	}
	//startTime
	public void setStartTime(String StartTime){
		this.startTime = StartTime;
	}
	public String getStartTime(){
		return startTime;
	}
	//endTime
	public void setEndTime(String setEndTime){
		this.endTime = setEndTime;
	}
	public String getEndTime(){
		return endTime;
	}
	//explain
	public void setExplain(String explain){
		this.explain = explain;
	}
	public String getExpalin(){
		return explain;
	}
	//countExample
}
