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

public class LocationDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;
	private static LocationDao instance = new LocationDao();
	public static LocationDao getInstance() {
		return instance;
	}
	private LocationDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	public ArrayList<LocationDto> listLocation(){
		ArrayList<LocationDto> dtos =new ArrayList<LocationDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM LOCATION ORDER BY LNO" ;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int    lno      = rs.getInt("lno");
				String lname      = rs.getString("lname");
				dtos.add(new LocationDto(lno, lname));
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
	public LocationDto getList(int lno) {
		LocationDto location = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM LOCATION WHERE LNO = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lno);
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				String lname = rs.getString("lname");
				location = new LocationDto(lno, lname);
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
		return location;
	}
	public int insertLocation(LocationDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO LOCATION (LNO, LNAME) VALUES (?, ?) ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getLno());
			pstmt.setString(2, dto.getLname());
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
