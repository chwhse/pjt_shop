package com.dgit.domain;

import java.sql.Date;
import java.util.List;

public class OrdersVO {
	private String ocode;
	private int ono;
	private String uid;
	private boolean oisbasket;
	private GoodsVO goods;
	private int oquantity;
	private Date odate;
	private int ototalprice;
	private int ocondition;
	
	
	
	public int getOcondition() {
		return ocondition;
	}
	public String getOcondition2Str() {
		String ocondition2Str = "주문상태";
		switch (getOcondition()) {
		case 1:
			ocondition2Str = "주문완료";
			break;
		case -1:
			ocondition2Str = "주문취소";
			break;
		default:
			ocondition2Str = "주문미완료";
			break;
		}
		return ocondition2Str;
	}
	public void setOcondition(int ocondition) {
		this.ocondition = ocondition;
	}
	public boolean isOisbasket() {
		return oisbasket;
	}
	public void setOisbasket(boolean oisbasket) {
		this.oisbasket = oisbasket;
	}
	public GoodsVO getGoods() {
		return goods;
	}
	public void setGoods(GoodsVO goods) {
		this.goods = goods;
	}
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getOquantity() {
		return oquantity;
	}
	public void setOquantity(int oquantity) {
		this.oquantity = oquantity;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public int getOtotalprice() {
		return ototalprice;
	}
	public void setOtotalprice(int ototalprice) {
		this.ototalprice = ototalprice;
	}
	@Override
	public String toString() {
		String str = "null";
		if(goods!=null){
			str = goods.toString();
		}
		return "OrdersVO [ocode=" + ocode + ", ono=" + ono + ", uid=" + uid + ", oisbasket=" + oisbasket + ", goods="
				+ str + ", oquantity=" + oquantity + ", odate=" + odate + ", ototalprice=" + ototalprice
				+ ", ocondition=" + ocondition + "]";
	}

	
	
}
