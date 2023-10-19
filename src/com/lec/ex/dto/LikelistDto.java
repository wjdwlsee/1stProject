package com.lec.ex.dto;

public class LikelistDto {
	private int no;
	private String ititle;
	private String icontent;
	private String ifilename;
	private String mid;
	private int iid;
	public LikelistDto() {}
	public LikelistDto(int no, String ititle, String icontent, String ifilename, String mid, int iid) {
		super();
		this.no = no;
		this.ititle = ititle;
		this.icontent = icontent;
		this.ifilename = ifilename;
		this.mid = mid;
		this.iid = iid;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public String getIfilename() {
		return ifilename;
	}
	public void setIfilename(String ifilename) {
		this.ifilename = ifilename;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	@Override
	public String toString() {
		return "LikelistDto [no=" + no + ", ititle=" + ititle + ", icontent=" + icontent + ", ifilename=" + ifilename
				+ ", mid=" + mid + ", iid=" + iid + "]";
	}
	
}
