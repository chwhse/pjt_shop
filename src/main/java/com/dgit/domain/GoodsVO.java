package com.dgit.domain;

import java.sql.Date;
import java.util.List;

public class GoodsVO {
	private String gcode;
	private String gname;
	private String gcategory;
	private String gthumb;
	private int gprice;
	private Date gdate;
	private boolean gisexist;
	
	private String gdesc;
	private List<String> gdetailimg;
	private int gstock;
	
	
	
	public Date getGdate() {
		return gdate;
	}
	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}
	public String getGdesc() {
		return gdesc;
	}
	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}
	public List<String> getGdetailimg() {
		return gdetailimg;
	}
	public void setGdetailimg(List<String> gdetailimg) {
		this.gdetailimg = gdetailimg;
	}
	public int getGstock() {
		return gstock;
	}
	public void setGstock(int gstock) {
		this.gstock = gstock;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGcategory() {
		return gcategory;
	}
	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
	public String getGthumb() {
		return gthumb;
	}
	public void setGthumb(String gthumb) {
		this.gthumb = gthumb;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public boolean isGisexist() {
		return gisexist;
	}
	public void setGisexist(boolean gisexist) {
		this.gisexist = gisexist;
	}
	@Override
	public String toString() {
		return "GoodsVO [gcode=" + gcode + ", gname=" + gname + ", gcategory=" + gcategory + ", gthumb=" + gthumb
				+ ", gprice=" + gprice + ", gdate=" + gdate + ", gisexist=" + gisexist + ", gdesc=" + gdesc
				+ ", gdetailimg=" + gdetailimg + ", gstock=" + gstock + "]";
	}
	
	
	
	
	
}
