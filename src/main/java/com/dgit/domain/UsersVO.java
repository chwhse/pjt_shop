package com.dgit.domain;

public class UsersVO {
	private String uid;
	private String upw;
	private String uname;
	private String uemail;
	private String uaddr;
	private String uphone;
	private Boolean ugrade;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUaddr() {
		return uaddr;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public Boolean getUgrade() {
		return ugrade;
	}
	public void setUgrade(Boolean ugrade) {
		this.ugrade = ugrade;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uemail=" + uemail + ", uaddr=" + uaddr
				+ ", uphone=" + uphone + ", ugrade=" + ugrade + "]";
	}
	
	
}
