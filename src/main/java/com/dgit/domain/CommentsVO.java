package com.dgit.domain;

import java.sql.Date;

public class CommentsVO {
	private int cno;
	private int rno;
	private String ccontent;
	private Date cdate;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	@Override
	public String toString() {
		return "CommentsVO [cno=" + cno + ", rno=" + rno + ", ccontent=" + ccontent + ", cdate=" + cdate + "]";
	}
	
	
}
