package com.dgit.domain;

import java.sql.Date;
import java.util.List;

public class OrdersVO {
	private String ocode;
	private String ono;
	private String uid;
	private String oisbasket;
	private List<GoodsVO> goods;
	private int oquantity;
	private Date odate;
	private int ototalprice;
	private List<OrdersVO> ordersVOList;
	
	
	
	public List<OrdersVO> getOrdersVOList() {
		return ordersVOList;
	}
	public void setOrdersVOList(List<OrdersVO> ordersVOList) {
		this.ordersVOList = ordersVOList;
	}
	
	
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getOisbasket() {
		return oisbasket;
	}
	public void setOisbasket(String oisbasket) {
		this.oisbasket = oisbasket;
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
	
	public List<GoodsVO> getGoods() {
		return goods;
	}
	public void setGoods(List<GoodsVO> goods) {
		this.goods = goods;
	}
	@Override
	public String toString() {
		return "OrdersVO [ocode=" + ocode + ", ono=" + ono + ", uid=" + uid + ", oisbasket="
				+ oisbasket + ", goods=" + goods.toString() + ", oquantity=" + oquantity + ", odate=" + odate + ", ototalprice="
				+ ototalprice + "]";
	}
	
	
}
