package javabean;

/**
 * 用户实体对象的封装以及各个属性的get和set方法
 * id;			//标识
 * name;		//用户名
 * account;		//账号
 * password;	//密码
 * 
 * @author XIAYU
 *
 */
public class User {
	private String id;			//标识
	private String name;		//用户名
	private String account;		//账号
	private String password;	//密码
	private int rank;			//身份标识
	private String type;		//身份
	
	/*属性的get和set方法*/
	//id
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return id;
	}
	//name
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return name;
	}
	//account
	public void setAccount(String account){
		this.account = account;
	}
	public String getAccount(){
		return account;
	}
	//password
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return password;
	}
	//rank
	public void setRank(int rank){
		this.rank = rank;
	}
	public int getRank(){
		return rank;
	}
	//type
	public void setType(String type){
		this.type = type;
	}public String getType(){
		return type;
	}
}
