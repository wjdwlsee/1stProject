package com.lec.ex.dto;

public class ThemeDto {
	private int tno;
	private String tname;
	public ThemeDto() {	}
	public ThemeDto(int tno, String tname) {
		this.tno = tno;
		this.tname = tname;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	@Override
	public String toString() {
		return "ThemeDto [tno=" + tno + ", tname=" + tname + "]";
	}
	
}
