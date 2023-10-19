package com.lec.ex.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.ex.dto.FreeBoardDto;
import com.lec.ex.dto.InfoDto;

public class InfoDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;
	private static InfoDao instance= new InfoDao();
	public static InfoDao getInstance() {
		return instance;
	}
	private InfoDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	//글목록
	public ArrayList<InfoDto> infolist(int startRow, int endRow){
		ArrayList<InfoDto> dtos = new ArrayList<InfoDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* " + 
				"    FROM (SELECT I.*, LNAME, TNAME FROM INFO I, LOCATION L, THEME T " + 
				"    WHERE I.LNO=L.LNO AND I.TNO=T.TNO ORDER BY IINDENT DESC,IRDATE DESC)A) " + 
				"    WHERE RN BETWEEN ? AND ?  " ;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int iid = rs.getInt("iid");
				 String aid = rs.getString("aid");
				 String ititle = rs.getString("ititle");
				 String icontent = rs.getString("icontent");
				 int lno = rs.getInt("lno");
				 String lname= rs.getString("lname");
				 int tno = rs.getInt("tno");
				 String tname = rs.getString("tname");
				 String ifilename = rs.getString("ifilename");
				 String ifilename2 = rs.getString("ifilename2");
				 Date irdate =rs.getDate("irdate");
				 int ihit = rs.getInt("ihit");
				 int iindent = rs.getInt("iindent");
				 String iip = rs.getString("iip");
				 dtos.add(new InfoDto(iid, aid, ititle, icontent, lno, lname, tno, tname, ifilename, ifilename2, irdate, ihit, iindent, iip));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return dtos;
	}
	public int getinfoCnt() {
		int totCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) CNT FROM INFO ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return totCnt;
	}
	//글작성
	public int writeinfo(InfoDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO INFO (IID, AID, ITITLE, ICONTENT, LNO,TNO, IFILENAME,IFILENAME2 ,IHIT,IINDENT,IIP) " + 
				"    VALUES (INFO_SEQ.NEXTVAL, ?,?,?,?,?,?,?,0,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAid());
			pstmt.setString(2, dto.getItitle());
			pstmt.setString(3, dto.getIcontent());
			pstmt.setInt(4, dto.getLno());
			pstmt.setInt(5, dto.getTno());
			pstmt.setString(6, dto.getIfilename());
			pstmt.setString(7, dto.getIfilename2());
			pstmt.setInt(8, dto.getIindent());
			pstmt.setString(9, dto.getIip());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("글작성 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 글작성 실패 :");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
// (4) hit 1회 올리기
	public void hitUp(int iid) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE INFO SET IHIT = IHIT+1 WHERE IID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 조회수 up 실패");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
	}
// (5) 글번호(fid)로 글전체 내용(BoardDto) 가져오기 - 글상세보기, 글수정뷰, 답변글쓰기뷰용
	public InfoDto getInfoNotHitUp(int iid) {
		InfoDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = " SELECT I.*, LNAME, TNAME FROM INFO I, THEME T, LOCATION L WHERE I.TNO=T.TNO AND L.LNO=I.LNO AND IID= ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String aid = rs.getString("aid");
				String ititle = rs.getString("ititle");
				String icontent = rs.getString("icontent");
				int    lno= rs.getInt("lno");
				String lname = rs.getString("lname");
				int    tno= rs.getInt("tno");
				String tname = rs.getString("tname");
				String ifilename = rs.getString("ifilename");
				String ifilename2 = rs.getString("ifilename2");
				Date irdate = rs.getDate("irdate");
				int    ihit = rs.getInt("ihit");		
				int    iindent= rs.getInt("iindent");
				String iip = rs.getString("iip");
				dto = new InfoDto(iid, aid, ititle, icontent, lno, lname, tno, tname, ifilename, ifilename2, irdate, ihit, iindent, iip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return dto;
	}
// (6) 글 수정하기(fid, ftitle, fcontent, ffilename, frdate(SYSDATE), fip 수정)
	public int modifyInfo(InfoDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE INFO " + 
				"    SET ITITLE = ? , " + 
				"        ICONTENT = ? , " + 
				"        LNO = ? , " + 
				"        TNO = ? , " + 
				"        IFILENAME = ? ," + 
				"        IFILENAME2 = ? " + 
				"        WHERE IID = ? ;"
			;
		try {
			conn = ds.getConnection();
			pstmt.setString(1, dto.getItitle());
			pstmt.setString(2, dto.getIcontent());
			pstmt.setInt(3, dto.getLno());
			pstmt.setInt(4, dto.getTno());
			pstmt.setString(5, dto.getIfilename());
			pstmt.setString(6, dto.getIfilename2());
			pstmt.setInt(7, dto.getIid());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글수정 성공":" 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 수정 실패 ");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
// (7) 글 삭제하기(fid로)
	public int deleteInfo(int iid) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM INFO WHERE IID= ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iid);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글삭제 성공":"글번호(bid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 삭제 실패 ");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
}

























