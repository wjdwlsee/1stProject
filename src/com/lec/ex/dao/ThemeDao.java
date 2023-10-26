package com.lec.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.ex.dto.LocationDto;
import com.lec.ex.dto.ThemeDto;

public class ThemeDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;
	private static ThemeDao instance = new ThemeDao();
	public static ThemeDao getInstance() {
		return instance;
	}
	private ThemeDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	public ArrayList<ThemeDto> listBoard(){
		ArrayList<ThemeDto> dtos =new ArrayList<ThemeDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM THEME ORDER BY TNO " ;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int    tno      = rs.getInt("tno");
				String tname      = rs.getString("tname");
				dtos.add(new ThemeDto(tno, tname));
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
	public ThemeDto getList(int tno) {
		ThemeDto theme = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM LOCATION WHERE TNO = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				String tname = rs.getString("tname");
				theme = new ThemeDto(tno, tname);
			}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return theme;
	}
	public int insertTheme(ThemeDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO THEME (TNO, TNAME) VALUES (THEME_SEQ.NEXTVAL, ?) ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTname());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 실패 :");
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
