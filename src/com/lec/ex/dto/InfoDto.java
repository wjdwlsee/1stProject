package com.lec.ex.dto;

import java.sql.Date;

public class InfoDto {
	private int iid;
	private String aid;
	private String ititle;
	private String icontent;
	private int lno;
	private String lname;
	private int tno;
	private String tname;
	private String ifilename;
	private String ifilename2;
	private Date irdate;
	private int ihit;
	private int iindent;
	private String iip;
	public InfoDto() {}
	public InfoDto(int iid, String aid, String ititle, String icontent, int lno, String lname, int tno, String tname,
			String ifilename, String ifilename2, Date irdate, int ihit, int iindent, String iip) {
		this.iid = iid;
		this.aid = aid;
		this.ititle = ititle;
		this.icontent = icontent;
		this.lno = lno;
		this.lname = lname;
		this.tno = tno;
		this.tname = tname;
		this.ifilename = ifilename;
		this.ifilename2 = ifilename2;
		this.irdate = irdate;
		this.ihit = ihit;
		this.iindent = iindent;
		this.iip = iip;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
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
	public String getIfilename() {
		return ifilename;
	}
	public void setIfilename(String ifilename) {
		this.ifilename = ifilename;
	}
	public String getIfilename2() {
		return ifilename2;
	}
	public void setIfilename2(String ifilename2) {
		this.ifilename2 = ifilename2;
	}
	public Date getIrdate() {
		return irdate;
	}
	public void setIrdate(Date irdate) {
		this.irdate = irdate;
	}
	public int getIhit() {
		return ihit;
	}
	public void setIhit(int ihit) {
		this.ihit = ihit;
	}
	public int getIindent() {
		return iindent;
	}
	public void setIindent(int iindent) {
		this.iindent = iindent;
	}
	public String getIip() {
		return iip;
	}
	public void setIip(String iip) {
		this.iip = iip;
	}
	@Override
	public String toString() {
		return "InfoDto [iid=" + iid + ", aid=" + aid + ", ititle=" + ititle + ", icontent=" + icontent + ", lno=" + lno
				+ ", lname=" + lname + ", tno=" + tno + ", tname=" + tname + ", ifilename=" + ifilename
				+ ", ifilename2=" + ifilename2 + ", irdate=" + irdate + ", ihit=" + ihit + ", iindent=" + iindent
				+ ", iip=" + iip + "]";
	}
	
}
