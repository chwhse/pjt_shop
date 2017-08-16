package com.dgit.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
public class GoodsVO {
	private String gcode;
	private String gname;
	private String gtitleimg;
	private int gprice;
	private int gsupprice;
	private Date gregdate;
	private boolean gisdisplay;
	
	private String gcategory;
	
	private String gdesc;
	private List<String> gdetailimg;

	private int gstock;
	
	
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
	public String getGtitleimg() {
		return gtitleimg;
	}
	public void setGtitleimg(String gtitleimg) {
		this.gtitleimg = gtitleimg;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public int getGsupprice() {
		return gsupprice;
	}
	public void setGsupprice(int gsupprice) {
		this.gsupprice = gsupprice;
	}
	public Date getGregdate() {
		return gregdate;
	}
	public void setGregdate(Date gregdate) {
		this.gregdate = gregdate;
	}
	public boolean isGisdisplay() {
		return gisdisplay;
	}
	public void setGisdisplay(boolean gisdisplay) {
		this.gisdisplay = gisdisplay;
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
	@Override
	public String toString() {
		int size = 0;
		if(gdetailimg!=null){
			size = gdetailimg.size();
		}
		return "GoodsVO [gcode=" + gcode + ", gname=" + gname + ", gcategory=" + gcategory + ", gtitleimg size=" + size
				+ ", gprice=" + gprice + ", gsupprice=" + gsupprice + ", gregdate=" + gregdate + ", gisdisplay="
				+ gisdisplay + ", gdesc=" + gdesc + ", gstock=" + gstock + "]";
	}

	
	

}
