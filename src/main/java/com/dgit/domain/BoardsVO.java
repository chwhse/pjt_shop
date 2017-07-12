package com.dgit.domain;

import java.sql.Date;

public class BoardsVO {
	private int bno;
	private String btitle;
	private String bcontent;
	private String uid;
	private Date bregdate;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
	private int breadcnt;
	
	
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getBregdate() {
		return bregdate;
	}
	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
	public int getBreadcnt() {
		return breadcnt;
	}
	public void setBreadcnt(int breadcnt) {
		this.breadcnt = breadcnt;
	}
	@Override
	public String toString() {
		return "BoardsVO [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", uid=" + uid + ", bregdate="
				+ bregdate + ", breadcnt=" + breadcnt + "]";
	}

	
}
