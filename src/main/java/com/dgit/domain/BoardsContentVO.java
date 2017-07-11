package com.dgit.domain;

public class BoardsContentVO {
	private int bno;
	private String bcontent;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	@Override
	public String toString() {
		return "BoardsContentVO [bno=" + bno + ", bcontent=" + bcontent + "]";
	}
	
	
}	
