package com.board.dto;

public class UserDTO {
	private String userid;
	private String userpwd;
	private String username;
	private String usergender;
	

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	
	@Override
	// 클래스 값을 가지고 있는데 값이 올바르게 담겨있는지 로그를 확인할 때 toString() 오버라이드를 통해서 값을 뽑을 수 있음.
	public String toString() {
		return "UserDTO [userid="+userid+",userpwd=" +userpwd+",username="+username+",usergender="+usergender+"]";
	}
	

}
