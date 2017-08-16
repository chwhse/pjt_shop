package com.dgit.domain;

import java.util.Date;

public class ReviewsVO {
	private int rno;
	private GoodsVO goods;
	private int ono;
	private String uid;
	private String rtitle;
	private String rcontent;
	private Date rregdate;

	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public GoodsVO getGoods() {
		return goods;
	}
	public void setGoods(GoodsVO goods) {
		this.goods = goods;
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
	@Override
	public String toString() {
		String str = "null";
		if(goods!=null){
			str = goods.toString();
		}
		return "ReviewsVO [rno=" + rno + ", ono=" + ono + ", goods=" + str + ", uid=" + uid + ", rtitle=" + rtitle + ", rcontent="
				+ rcontent + ", rregdate=" + rregdate + "]";
	}
	
	

	
	
}
