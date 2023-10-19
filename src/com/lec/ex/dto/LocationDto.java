package com.lec.ex.dto;

public class LocationDto {
	private int lno;
	private String lname;
	public LocationDto() {	}
	public LocationDto(int lno, String lname) {
		this.lno = lno;
		this.lname = lname;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	@Override
	public String toString() {
		return "LocationDto [lno=" + lno + ", lname=" + lname + "]";
	}
	
}
