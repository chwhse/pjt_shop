package com.dgit.domain;

import java.util.Date;

public class ReviewsVO {
	private Integer rno;
	private String gcode;
	private String uid;
	private String rtitle;
	private String rcontent;
	private Date rregdate;
	private String ocode;
	private String rcname;
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRregdate() {
		return rregdate;
	}
	public void setRregdate(Date rregdate) {
		this.rregdate = rregdate;
	}
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getRcname() {
		return rcname;
	}
	public void setRcname(String rcname) {
		this.rcname = rcname;
	}
	@Override
	public String toString() {
		return "ReviewsVO [rno=" + rno + ", gcode=" + gcode + ", uid=" + uid + ", rtitle=" + rtitle + ", rcontent="
				+ rcontent + ", rregdate=" + rregdate + ", ocode=" + ocode + ", rcname=" + rcname + "]";
	}

	
	
}
